package com.kh.ojungFinal.deptBoard.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.common.FileRename;
import com.kh.ojungFinal.common.Pagination;
import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.deptBoard.model.service.DeptBoardService;
import com.kh.ojungFinal.deptBoard.model.vo.DeptBoard;
import com.kh.ojungFinal.deptBoard.model.vo.DeptBoardFile;
import com.kh.ojungFinal.deptBoard.model.vo.DeptBoardReply;

@SessionAttributes({ "loginMember", "msg" })

@Controller
@RequestMapping("/departmentBoard/*")
public class DeptBoardController {

	@Autowired
	private DeptBoardService deptBoardService;

	// 부서게시판 화면 - 목록 출력
	@RequestMapping("departmentBoardList")
	public String departmentBoardList(Model model, String deptCode, DeptBoard deptBoard,
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "searchValue", required = false) String searchValue,
			@RequestParam(value = "currentPage", required = false) Integer currentPage) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		deptCode = loginMember.getDeptCode();

		try {

			// 부서명 조회
			String deptName = deptBoardService.selectDept(deptCode);
			model.addAttribute("deptName", deptName);
			
			// 검색 조건이 있는지 확인하여 map에 세팅
			Map<String, String> map = null;
			map = new HashMap<String, String>();
			map.put("deptCode", deptCode);
			if (searchKey != null && searchValue != null) {
				map.put("searchKey", searchKey);
				map.put("searchValue", searchValue);
				
			}

			
			
			// 부서게시판 게시글 수 조회
			int listCount = deptBoardService.getListCount(map);

			// 현재 페이지 계산
			if (currentPage == null)
				currentPage = 1;

			// 페이지 정보 저장
			PageInfo pInf = Pagination.getPageInfo(10, 10, currentPage, listCount);

			// 게시글 목록 조회
			List<DeptBoard> boardList = deptBoardService.selectList(map, pInf);
			model.addAttribute("pInf", pInf);
			model.addAttribute("boardList", boardList);
			System.out.println(boardList);
			
			return "departmentBoard/departmentBoardList";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "게시판 목록 조회중 오류 발생");
			return "common/errorPage";
		}

	}

	@RequestMapping("departmentBoardDetail")
	public ModelAndView deptBoardDetail(ModelAndView mv, Model model,
			@RequestParam(value = "no", required = false) Integer no, RedirectAttributes rdAttr,
			HttpServletRequest request) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		String deptCode = loginMember.getDeptCode();
		// System.out.println("상세 조회에서 전달받은 no : " + no);

		try {

			String deptName = deptBoardService.selectDept(deptCode);
			model.addAttribute("deptName", deptName);

			DeptBoard deptBoard = deptBoardService.selectDeptBoard(no);
			//System.out.println("게시판 상세조회  :" + deptBoard);

			if (deptBoard != null) {
				// System.out.println("선택한 게시글 번호 : "+ deptBoard.getBoardNo());

				List<DeptBoardFile> files = deptBoardService.selectFiles(no);
				//DeptBoardFile files =  deptBoardService.selectFiles(no);
				if (!files.isEmpty()) { // 해당 게시글에 등록된 파일이 있다면
					for(int i=0; i<files.size() ; i++) {
						files.get(i);
						model.addAttribute("files", files);
						//System.out.println(i + "번째 파일 이름 : " + files.get(i).getFileOriginName());
					}
					
				}

				mv.addObject("deptBoard", deptBoard);
				mv.setViewName("departmentBoard/departmentBoardDetail");
				// System.out.println("게시판에서 작성자 멤버 넘버 받아오나 ? : "+ deptBoard.getMemberNo());
			} else {
				mv.addObject("errorMsg", "부서게시판 조회 실패.");
				mv.setViewName("common/errorPage");
			}

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "부서게시판 조회중 오류 발생");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}


	// 부서게시판 작성폼 출력
	@RequestMapping("insertForm")
	public String insertForm(Model model, String deptCode) {
		Member loginMember = (Member) model.getAttribute("loginMember");
		deptCode = loginMember.getDeptCode();
		try {
			String deptName = deptBoardService.selectDept(deptCode);
			model.addAttribute("deptName", deptName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "departmentBoard/departmentBoardInsert";
	}

	// 부서게시판 작성하기
	@RequestMapping("insert")
	public String deptBoardInsert(ModelAndView mv, 
			Model model, HttpServletRequest request, 
			RedirectAttributes rdAttr,
			String title, String content,
			@RequestParam(value = "deptBoardfile", required = false) List<MultipartFile> deptBoardfile) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		String deptCode = loginMember.getDeptCode();

		DeptBoard deptBoard = new DeptBoard(title, content, loginMember.getMemberNo(), deptCode);
		System.out.println("게시판 삽입 내용 : " +  deptBoard);

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
		File folder = new File(savePath);

		if (!folder.exists())
			folder.mkdir();

		//int no = deptBoard.getBoardNo();
		// System.out.println("등록된 게시글 번호 : " + no);
		
		try {
			
			for (int i = 0; i < deptBoardfile.size(); i++) {
				System.out.println("deptBoardfile[" + i + "]" + deptBoardfile.get(i).getOriginalFilename());
			}
			
			List<DeptBoardFile> files = new ArrayList<DeptBoardFile>();
			DeptBoardFile df = null;

			
			for (MultipartFile mf : deptBoardfile) {
				
				if (!mf.getOriginalFilename().equals("")) {

				// 파일명 rename
				String changeFileName = FileRename.rename(mf.getOriginalFilename());

				// DeptBoardFile 객체 생성
				df = new DeptBoardFile(mf.getOriginalFilename(), changeFileName, savePath);
				
				// List<DeptBoardFile> files에 list 추가
				files.add(df);
				
				}
			}
			
			int result = deptBoardService.insertDeptBoard(deptBoard, files);
			
			
			String msg = null;
			String url = null;
			

			if (result > 0) { // db에 게시글 삽입 성공 시
				for (DeptBoardFile file : files) {

					// 서버에 파일 저장
					for (MultipartFile mf : deptBoardfile) {
						// 빈문자열(파일이 없는 경우)가 아니면 실제 파일 정보를 저장하기 위해
						if (mf.getOriginalFilename().equals(file.getFileOriginName())) {
							mf.transferTo(new File(file.getFilePath() + "/" + file.getFileChangeName()));
							break;
						}
					}
				}
					
				
				msg = "게시글 등록 성공";
				url = "departmentBoardDetail?no="+result;
				//model.addAttribute("msg", msg);
				//return "redirect:/departmentBoard/departmentBoardDetail?no=" + no;
			} else {
				msg = "게시글 등록 실패";
				url = "insert";
				//model.addAttribute("errorMsg", msg);
				//return "redirect:/departmentBoard/insert";
			}
			
			rdAttr.addFlashAttribute("msg", msg);
			return "redirect:" + url;
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "게시글 등록 오류");
			return "common/errorPage";
		}
	}

	@RequestMapping("updateForm")
	public ModelAndView updateForm(ModelAndView mv, Model model, int no,
			HttpServletRequest request) {
		
		Member loginMember = (Member) model.getAttribute("loginMember");
		String deptCode = loginMember.getDeptCode();
		//System.out.println("수정할 게시글 번호 : " + no);
		
		String detailUrl = request.getHeader("referer");
		model.addAttribute("detailUrl", detailUrl);
		System.out.println("referer : " + detailUrl);
		
		try {
			String deptName = deptBoardService.selectDept(deptCode);
			model.addAttribute("deptName", deptName);

			DeptBoard deptBoard = deptBoardService.updateForm(no);
			
			if (deptBoard != null) {
				mv.addObject("deptBoard", deptBoard);
				mv.setViewName("departmentBoard/departmentBoardUpdate");
			} else {
				mv.addObject("errorMsg", "게시판 수정폼 조회 실패.");
				mv.setViewName("common/errorPage");
			}

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "게시판 수정폼 조회 중 오류 발생");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	@RequestMapping("update")
	public String deptBoardUpdate(Model model, 
			String title, 
			String content, 
			Integer no,
			HttpServletRequest request,
			RedirectAttributes rdAttr,
			@RequestParam(value = "deptBoardfile", required = false) List<MultipartFile> deptBoardfile
			) {

		/*
		System.out.println("파라이터에서 전달 받은 no : " + no);
		System.out.println("파라이터에서 전달 받은 title : " + title);
		System.out.println("파라이터에서 전달 받은 content : " + content);
*/
		DeptBoard deptBoard = new DeptBoard(no, title, content);
		//System.out.println("수정내용" + deptBoard);
		
		//String detailUrl = (String) model.getAttribute("detailUrl");
		//System.out.println(detailUrl);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";

		File folder = new File(savePath);
		if (!folder.exists())
			folder.mkdir();
		
		try {
			int result = deptBoardService.updateDeptBoard(deptBoard, deptBoardfile, savePath);

			String msg = null;
			if (result > 0) {
				msg = "게시글 수정 성공";
				rdAttr.addFlashAttribute("msg", msg);
				return "redirect:departmentBoardDetail?no=" + no;

			} else {
				msg = "게시글 수정 실패";
				rdAttr.addFlashAttribute("msg", msg);
				return "redirect:departmetnBoardUpdate";
				//mv.addObject("errorMsg", "수정 실패");
				//mv.setViewName("redirect:departmetnBoardUpdate");
				
			}
			
			//return "redirect:" + detailUrl;

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "게시글 등록 오류");
			return "common/errorPage";
		}
	}

	@RequestMapping("delete")
	public String deleteDeptBaord(Model model, int no) {

		//System.out.println(no);

		try {
			int result = deptBoardService.deleteDeptBaord(no);

			String msg = null;

			if (result > 0) {
				model.addAttribute("msg", "삭제 성공");
				return "redirect:departmentBoardList";
			} else {
				model.addAttribute("msg", "삭제 실패");
				return "redirect:departmentBoardDetail?no=" + no;
			}

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "게시글 삭제 중 오류 발생");
			return "common/errorPage";
		}
	}
	
	/*
	
	@RequestMapping("insertReply")
	@ResponseBody
	public String insertReply( Model model, @RequestBody DeptBoardReply deptBoardReply
			) {
		
		Member loginMember = (Member) model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
		System.out.println("memberNo : " + memberNo);
		System.out.println("boardNo : " + deptBoardReply.getBoardNo());
		System.out.println("replyContent : " + deptBoardReply.getReplyContent());
		try {
			
			deptBoardReply.setMemberNo(memberNo);
			deptBoardReply.setBoardNo(deptBoardReply.getBoardNo());
			deptBoardReply.setReplyContent(deptBoardReply.getReplyContent());
			
			deptBoardService.insertReply(deptBoardReply);
			
			
			//System.out.println("deptBoardReply2 : " + deptBoardReply);
			} catch(Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

*/
	@ResponseBody
	@RequestMapping("insertReply")
	public String insertReply(@RequestBody DeptBoardReply reply) {
		int result = 0;
		String data = "";
		
		System.out.println(reply);
		
		try {
			result =  deptBoardService.insertReply(reply);
		}catch(Exception e) {
			e.printStackTrace();
			result = -1; //
		}
		
		if(result>0) {
			data = "success";
		}else {
			data = "fail";
		}
		
		return data;
		
	}
	
	
	/*
	@RequestMapping("replyList")
	@ResponseBody
	public List<DeptBoardReply> replyList(Model model, @RequestBody DeptBoardReply deptBoardReply) {
		
		int boardNo = deptBoardReply.getBoardNo();
		
		try {
			
			//for(int i=0;i<deptBoardReply.size();i++) {
			//	int boardNo = deptBoardReply.get(i).getBoardNo();
			//	System.out.println("리스트에서 받아온 boardNo : " + i + boardNo);
				deptBoardService.selectReply(boardNo);
				System.out.println("");
			//}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
				
		
	}
	*/
	
	@ResponseBody
	@RequestMapping(value="replyList", produces="application/json; charset=utf-8")
	public String selectReplyList(int boardNo, Model model) {
		//System.out.println("댓글 등록 리스트에서 불러오는 boardNo : " + boardNo);
		
		List<DeptBoardReply> replyList = deptBoardService.selectReplyList(boardNo);
		//System.out.println(replyList);
		model.addAttribute(replyList);
		// 댓글이 작성된 시간을 yyyy-mm-dd hh:mm:ss 
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd hh:mm:ss").create();
		return gson.toJson(replyList); 
	}

	@ResponseBody
	@RequestMapping("deleteReply")
	public int deleteReply( DeptBoardReply reply) {
		int replyNo = reply.getReplyNo();
		System.out.println("삭제할 댓글 번호 : " + replyNo);
		int result = 0;
		try {
			result = deptBoardService.deleteReply(replyNo);
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
	public int updateReply(@RequestBody DeptBoardReply reply) {
		System.out.println(reply);
		System.out.println("댓번" + reply.getReplyNo());
		System.out.println("댓내용" + reply.getReplyContent());
		int result = 0;
		try {
			result = deptBoardService.updateReply(reply);
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
	public int replyCount(int boardNo, Model model) {
		//int boardNo = reply.getBoardNo();
		System.out.println(boardNo);
		int count = 0;
		
		try {
			count = deptBoardService.replyCount(boardNo);
			model.addAttribute("count",count);
		}catch(Exception e) {
			e.printStackTrace();
			count = -1;
		}
		System.out.println(count);
		return count;
	}

}