package com.kh.ojungFinal.notice.controller;

import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ojungFinal.notice.model.service.NoticeService;
import com.kh.ojungFinal.common.FileRename;
import com.kh.ojungFinal.common.Pagination;
import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.deptBoard.model.vo.DeptBoardReply;
import com.kh.ojungFinal.notice.model.vo.Notice;
import com.kh.ojungFinal.notice.model.vo.NoticeFile;
import com.kh.ojungFinal.notice.model.vo.NoticeReply;
import com.kh.ojungFinal.notice.model.vo.NoticeView;
import com.sun.xml.internal.ws.api.message.Attachment;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.collaboBoard.model.vo.CollaboBoard;
import com.kh.ojungFinal.collaboBoard.model.vo.CollaboFile;

@Controller
@RequestMapping("/notice/*")
@SessionAttributes({"loginMember", "msg", "detailUrl"})
public class NoticeController {
	
	private List<NoticeFile> nList = new ArrayList<NoticeFile>();
	
	@Autowired
	private NoticeService noticeService;
	
	// 공지사항 목록
	@RequestMapping("noticeList")
	public ModelAndView noticeList(ModelAndView mv, 
			@RequestParam(value="searchKey", required = false) String searchKey, 
			@RequestParam(value="searchValue", required = false) String searchValue, 
			@RequestParam(value="currentPage", required = false) Integer currentPage) {
		
		try {
			
			Map<String, String> map = null;
			if(searchKey != null && searchValue != null) {
				map = new HashMap<String, String>();
				map.put("searchKey", searchKey);
				map.put("searchValue", searchValue);
			}
			
			int listCount = noticeService.getListCount(map);
			
			if(currentPage == null) currentPage = 1;
			
			PageInfo pInf = Pagination.getPageInfo(10, 10, currentPage, listCount);
			
			List<NoticeView> list= noticeService.selectList(map);
			List<NoticeView> nList= noticeService.selectNlist(map, pInf);
			
			
			/*
			 * System.out.println(pInf); for(NoticeView n : list) { System.out.println(n); }
			 */
			
			mv.addObject("list", list);
			mv.addObject("nList", nList);
			mv.addObject("pInf", pInf);
			mv.setViewName("notice/noticeList");
			
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "공지사항 목록 조회중 오류 발생");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 게시글 등록 화면 이동 
		@RequestMapping("insertForm")
		public String insertForm(){
			return "notice/noticeWrite";
		}
		
	
	// 공지사항 게시글 등록
	@RequestMapping("noticeWrite")
	public String noticeWrite(NoticeView noticeView, Model model, 
			HttpServletRequest request, RedirectAttributes rdAttr,
			@RequestParam(value="fileUpload", required=false) List<MultipartFile> noticeFile, int category) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
		
		noticeView.setMemberNo(memberNo);
		noticeView.setNoticeCode(category);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "/uploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) folder.mkdir();
		
		try {
			
			List<NoticeFile> files = new ArrayList<NoticeFile>();
			NoticeFile nf = null;
			
			for(MultipartFile mf : noticeFile) {
				if(!mf.getOriginalFilename().equals("")) {
					
					// 파일명 rename
					String changeFileName = FileRename.rename(mf.getOriginalFilename());
					
					// Attachment 객체 생성
					nf = new NoticeFile(mf.getOriginalFilename(), changeFileName, savePath);
					
					files.add(nf);
				}
			}
			
			// 게시글 + 이미지 삽입 Service 호츌
			int result = noticeService.insertNotice(noticeView, files);
			
			String msg = null;
			String url = null;
			
			if(result > 0) { // DB에 게시글 삽입 성공 시

				for(NoticeFile file : files) {
					for(MultipartFile mf : noticeFile) {
						
						if(mf.getOriginalFilename().equals(file.getFileOriginName())) {
							mf.transferTo(new File(file.getFilePath() + "/" + file.getFileChangeName()));
							break;
						}
					}
				}
				
				msg = "게시글 등록 성공";
				//url = "detail?no="+result+"&currentPage=1";
				// 상세조회 완성 후 사용
				url = "noticeList";
				
			} else {
				msg = "게시글 등록 실패";
				url = "noticeList";
			}
			rdAttr.addFlashAttribute("msg", msg);
			return "redirect:" + url;
			
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "게시글 등록 과정에서 오류 발생");
			return "common/errorPage";
		}
	}
	
	
	// 게시판 상세조회
	@RequestMapping(value="detail", method = RequestMethod.GET)
	public String noticeDetail(Integer no, Model model, 
			RedirectAttributes rdAttr, HttpServletRequest request) {

		String beforeUrl = request.getHeader("referer");
		
		try {

			// 1) 글 번호를 이용하여 Board 테이블에서 해당 게시글 조회
			NoticeView noticeView = noticeService.selectNotice(no);
			
			// 2) 게시글 조회 성공 시 글 번호를 이용하여  Attachment 테이블에서 게시글에 포함된 이미지 목록 조회
			if(noticeView != null) {
				List<NoticeFile> files = noticeService.selectFile(no);
				
				if(!files.isEmpty()) { // 해당 게시글에 이미지가 있다면
					model.addAttribute("files", files);
					
				}
				
				// 3) 조회수 증가
				int result = noticeService.increaseCount(no);
				
				noticeView.setNoticeCount(noticeView.getNoticeCount()+1);
				
				model.addAttribute("noticeView", noticeView);
				return "notice/noticeDetail";
				
				
			} else {
				rdAttr.addFlashAttribute("msg", "게시글 상세 조회 실패");
				return "redirect:" + beforeUrl;
			}

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "게시글 상세조회 과정에서 오류 발생");
			return "common/errorPage";
		}
	}
		
	
	// 공지사항 수정 화면 이동
	@RequestMapping("updateForm")
	public String updateForm(Integer no, Model model, HttpServletRequest request) { 
		
		// 이전 페이지(상세조회 페이지) 주소를 detailUrl에 저장
		String detailUrl = request.getHeader("referer");
		
		// @SessionAttributes에 "detailUrl" 추가 후  Session에 detailUrl 올리기
		model.addAttribute("detailUrl", detailUrl);
		
		try {
			// 1) 게시글 상세 조회
			NoticeView noticeView = noticeService.selectNotice(no);
			
			// 2) 게시글 상세조회 성공 시 파일 목록 조회
			if(noticeView != null) {
				List<NoticeFile> files = noticeService.selectFile(no);
				
				
				if(!files.isEmpty()) { // 해당 게시글에 이미지가 있다면
					model.addAttribute("files", files);
				}
			}
			
			// 3) 조회된 정보를 View에 전달 후 Forward
			model.addAttribute("noticeView", noticeView);
			return "notice/noticeUpdate";
			
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "게시글 수정화면 전환 과정에서 오류 발생");
			return "common/errorPage";
		}
	}


	// 공지사항 수정 
	@RequestMapping("update")
	public String updateNotice(NoticeView noticeView, Integer no,
			Model model, RedirectAttributes rdAttr, HttpServletRequest request,
			@RequestParam(value="noticeFile", required=false) List<MultipartFile> noticeFile, int category) {
		
		
		String detailUrl = (String)model.getAttribute("detailUrl");
		
		// 2) no(글번호)를 board(커맨드객체)에 set
		noticeView.setNoticeNo(no);
		noticeView.setNoticeCode(category);
		
		// 3) 수정 또는 새롭게 추가된 파일이 저장될 경로 얻어오기
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
		
		// 저장폴더가 있는지 검사하여 없을 경우 생성하기
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdir();
		
		try {
			// 4) 게시글 (+게시글 이미지) 수정용 서비스 호출
			int result = noticeService.updateNotice(noticeView, noticeFile, savePath);
			
			// 5) 서비스 호출 결과에 따른 메세지 처리
			String msg = null;
			if(result > 0) msg = "게시글 수정 성공";
			else		   msg = "게시글 수정 실패";
			rdAttr.addFlashAttribute("msg", msg);
			
			// 수정 후 상세조회 화면 요청
			return "redirect:"+detailUrl;
			
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "게시글 수정 과정에서 오류 발생");
			return "common/errorPage";
		}
	}
		
	
	// 공지사항 삭제
	@RequestMapping("delete")
	public ModelAndView updateNotice(ModelAndView mv, Model model,  Integer no) {
		
		try {
			int result = noticeService.deleteNotice(no);
			String msg = null;
			
			if(result > 0) {
				msg="공지사항이 삭제되었습니다.";
				model.addAttribute("msg", msg);
				mv.setViewName("redirect:noticeList");
			}
			else {		  
				msg="공지사항 삭제 실패";
				model.addAttribute("msg", msg);
				mv.setViewName("redirect:detail?no="+no);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "공지사항 삭제 중 오류 발생");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}

	
	// 댓글 등록
	@ResponseBody
	@RequestMapping("insertReply")
	public String insertReply(@RequestBody NoticeReply noticeReply) {

		int result = 0;
		String data = "";
		
		try {
			result = noticeService.insertReply(noticeReply);
			
		} catch(Exception e) {
			e.printStackTrace();
			result = -1; 
		}
		
		if(result>0) {
			data = "success";
		}else {
			data = "fail";
		}
		
		return data;
	}
	
	
	// 댓글 목록
	@ResponseBody
	@RequestMapping(value="replyList", produces="application/json; charset=utf-8")
	public String selectReplyList(int noticeNo, Model model) {
		//System.out.println("댓글 등록 리스트에서 불러오는 boardNo : " + boardNo);
		
		List<NoticeReply> replyList = noticeService.selectReplyList(noticeNo);
		//System.out.println(replyList);
		model.addAttribute(replyList);
		// 댓글이 작성된 시간을 yyyy-mm-dd hh:mm:ss 
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd hh:mm:ss").create();
		return gson.toJson(replyList); 
	}
	

	@ResponseBody
	@RequestMapping("deleteReply")
	public int deleteReply( NoticeReply noticeReply) {
		int replyNo = noticeReply.getNoticeReplyNo();
		System.out.println("삭제할 댓글 번호 : " + replyNo);
		int result = 0;
		try {
			result = noticeService.deleteReply(replyNo);
			if (result > 0) {
			} else {
				result=0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result=-1;
		}
		return result;
	}
	

	@ResponseBody
	@RequestMapping("updateReply")
	public int updateReply(@RequestBody  NoticeReply noticeReply) {
		System.out.println(noticeReply);
		System.out.println("댓번" + noticeReply.getNoticeReplyNo());
		System.out.println("댓내용" + noticeReply.getNoticeReplyContent());
		int result = 0;
		try {
			result = noticeService.updateReply(noticeReply);
			if (result > 0) {
			} else {
				result=0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result=-1;
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("replyCount")
	public int replyCount(int noticeNo, Model model) {
		//int boardNo = reply.getBoardNo();
		System.out.println(noticeNo);
		int count = 0;
		
		try {
			count = noticeService.replyCount(noticeNo);
			model.addAttribute("count",count);
		}catch(Exception e) {
			e.printStackTrace();
			count = -1;
		}
		System.out.println(count);
		return count;
	}
	
	
	
	

	
}
