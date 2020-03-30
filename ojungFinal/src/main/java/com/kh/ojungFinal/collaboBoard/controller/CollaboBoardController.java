package com.kh.ojungFinal.collaboBoard.controller;

import java.io.File;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.metal.MetalIconFactory.FolderIcon16;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.calender.model.service.CalendarService;
import com.kh.ojungFinal.calender.model.vo.Calendar;
import com.kh.ojungFinal.collaboBoard.model.service.CollaboBoardService;
import com.kh.ojungFinal.collaboBoard.model.vo.CollaboBoard;
import com.kh.ojungFinal.collaboBoard.model.vo.CollaboCmmt;
import com.kh.ojungFinal.collaboBoard.model.vo.CollaboFile;
import com.kh.ojungFinal.collaboBoard.model.vo.DeptList;
import com.kh.ojungFinal.common.FileRename;
import com.kh.ojungFinal.common.Pagination;
import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.mail.controller.MyAuthentication;

@Controller
@RequestMapping("/collaboBoard/*")
@SessionAttributes({"loginMember","msg","detailUrl"})
public class CollaboBoardController {
	
	@Autowired
	private CollaboBoardService collaboBoardService;
	
	@Autowired
	private CalendarService calendarService;
	
	// 협업 게시판에서 첨부한 파일 리스트
	private List<CollaboFile> cfList = new ArrayList<CollaboFile>();
	// 첨부파일 객체
	private CollaboFile cf1 = null;
	
	/** 협업 게시판 목록 조회
	 * @param mv
	 * @param searchKey
	 * @param searchValue
	 * @param currentPage
	 * @return mv
	 */
	@RequestMapping("collaboBoardList")
	public ModelAndView departmentBoardList(ModelAndView mv, HttpServletRequest request,
			@RequestParam(value="searchKey", required = false) String searchKey,
			@RequestParam(value="searchValue", required = false) String searchValue,
			@RequestParam(value="searchStatus", required = false) String searchStatus,
			@RequestParam(value="currentPage", required = false) Integer currentPage) {
			
			Member loginMember = (Member)request.getSession().getAttribute("loginMember");
			if (loginMember == null) {
				mv.addObject("errorMsg", "로그인한 사용자만 접속 가능합니다.");
				mv.setViewName("login");
				return mv;
			}
		try {
			
			Map<String, Object> map = null;
			if(searchKey != null && /* searchValue != null &&*/ searchStatus != null) {
				map = new HashMap<String, Object>();
				map.put("searchKey", searchKey);

				Iterator<String> it = map.keySet().iterator();
				while(it.hasNext()) {
					String key = it.next();
					if(key.equals("searchKey") && map.get(key).equals("myself")) {
						map.put("searchValue", loginMember.getMemberName());
					}else if(key.equals("searchKey") && map.get(key).equals("myselfTask")) {
						map.put("searchValue", loginMember.getMemberName());
					}else map.put("searchValue", searchValue);
	
					}
				map.put("searchStatus", searchStatus);
			}
			int listCount = collaboBoardService.getListCount(map);
			
			if(currentPage == null) currentPage = 1;
			
			// 페이지 정보 저장 			
			PageInfo pInf = Pagination.getPageInfo(10, 10, currentPage, listCount);
			
			//2. 협업 게시판 목록 조회
			List<CollaboBoard> list = collaboBoardService.selectList(map, pInf);
			
			mv.addObject("collabo",list);
			mv.addObject("pInf",pInf);
			mv.setViewName("collaboBoard/collaboBoardList");
		}catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "협업 게시판 목록 조회중 오류 발생");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/** 협업 게시판 게시글 상세조회
	 * @param mv
	 * @param no
	 * @return
	 */
	@RequestMapping("detail")
	public ModelAndView collaboBoardDetail(Model model,
			HttpServletRequest request,
			ModelAndView mv, int no
			) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		if (loginMember == null) {
			mv.addObject("errorMsg", "로그인한 사용자만 접속 가능합니다.");
			mv.setViewName("login");
			return mv;
		}
		
		// 이전 페이지(상세조회 페이지) 주소를 detailUrl에 저장
		String beforeUrl = request.getHeader("referer");	
		
		try {
			CollaboBoard collaboBoard = collaboBoardService.selectCollaboBoard(no);
			
			
			if(collaboBoard != null) {
				mv.addObject("loginMember", loginMember);
				String deptCode = collaboBoard.getWriterDeptCode();
				String collaDepts = collaboBoard.getCollaboDept();
				String[] depts = collaDepts.split(",");
				// 협업 요청 부서 명단 조회
				List<DeptList> deptList = collaboBoardService.selectDeptList(deptCode);
				// 협업 처리 부서 명단 조회
				List<List<DeptList>> collaList = new ArrayList<List<DeptList>>();
				// 협업 첨부파일 조회
				List<CollaboFile> cfList = collaboBoardService.selectCollaboFiles(no);
				
				for(int i=0;i<depts.length;i++) {
					collaList.add(collaboBoardService.selectDeptList(depts[i]));
				} 
				
				if(deptList != null) {
					mv.addObject("collaList", collaList);
					mv.addObject("collaDepts", collaDepts); // 요청글의 협업부서 코드 문자열 배열
					mv.addObject("deptList", deptList);
				}
				if(cfList != null) {
					mv.addObject("cfList",cfList);
				}
				
				mv.addObject("detail", collaboBoard);
				mv.setViewName("collaboBoard/collaboBoardDetail");
				
			} else {
				mv.addObject("errorMsg", "협업 게시판 상세 조회 실패");
				mv.setViewName("common/errorPage");
			}
		}catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "협업 게시판 상세 조회중 오류 발생");
			mv.setViewName("redirect:"+beforeUrl);
		}
		return mv;
	}
	
	/** 협업 게시판  글 등록 폼
	 * @param mv
	 * @param req
	 * @param model
	 * @param title
	 * @param content
	 * @return 
	 */
	@RequestMapping("collaboBoardEditors")
	public ModelAndView collaboBoardEditors(ModelAndView mv,HttpServletRequest req, 
			Model model, String title, String content ) {
		Member loginMember = (Member)req.getSession().getAttribute("loginMember"); 
		if (loginMember == null) {
			mv.addObject("errorMsg", "로그인한 사용자만 접속 가능합니다.");
			mv.setViewName("login");
			return mv;
		}
		try {
			// 협업 처리 부서 선택 리스트
			List<Member> deptList = collaboBoardService.selectDept();
			
			// 협업  
			
			// 협업 처리 부서 리스트 담기
			if(deptList != null) {
				mv.addObject("deptList",deptList);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorPage", "협업 게시판 등록 화면 로딩 과정중 오류 발생");
			mv.setViewName("common/errorPage");
		}
		mv.addObject("loginMember",loginMember);
		
		return mv;
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	   public String insertCollaBoard(Model model,
	         CollaboBoard cBoard,
	         HttpServletRequest request,
	         RedirectAttributes rdAttr,
	         @RequestParam(value="collaboTitle", required=false)String collaboTitle,
	         @RequestParam(value="collaboContent", required=false)String collaboContent,
	         @RequestParam(value="collaboDept", required=false)String[] collaboDept,
	         @RequestParam(value="collaboStartDate", required=false)Date collaboStartDate,
	         @RequestParam(value="collaboEndDate", required=false)Date collaboEndDate
	         )  {
	      Member loginMember = (Member)request.getSession().getAttribute("loginMember");
	      if (loginMember == null) {
	         rdAttr.addFlashAttribute("msg", "로그인한 사용자만 접속 가능합니다.");
	         return "redirect:login";
	      }
	      int memberNo = loginMember.getMemberNo();
	      
	      String deptStr = String.join(",", collaboDept);
	      cBoard.setCollaboDept(deptStr); // 선택한 부서 1개의 문자열로 세팅
	      cBoard.setMemberNo(memberNo);   // 현재 로그인한 회원 번호 세팅
	      
	      try {
	         // bNo에는 insert 성공 : 보드 넘버 리턴받음
	                       // 실패 : -1 리턴받음
	         int bNo = collaboBoardService.insertCboard(cBoard);
	         String msg = null;
	         String url = null;
	         if(!(bNo < 0)) { // 게시글 삽입 성공 시 
	            msg = "게시글 등록 성공";
	            url = "detail?no="+bNo+"&currentPage=1";
	            try { 
	               int result = 0;
	               Iterator<CollaboFile> it = cfList.iterator();
	               while(it.hasNext()) {
	                  CollaboFile cff = it.next();
	                  cff.setCollaboNo(bNo);
	                  result = collaboBoardService.insertCollaboFile(cff);
	                  
	               }
	               
	               if(result > 0) {
	                  url = "detail?no="+bNo+"&currentPage=1";
	                  msg = "게시글, 첨부파일 등록 성공";
	               }
	               
	            }catch (Exception e) {
	               e.printStackTrace();
	            }
	            
	            // 참조된 부서 원들에게 전체 메일 
	            List<CollaboBoard> elist = collaboBoardService.selectEmailList(bNo);
	            
	            
	            System.out.println("=========== 메일 리스트 ===========");
	            for(CollaboBoard mail : elist) {
	               
	               if((mail.getMemberEmail().substring(mail.getMemberEmail().indexOf("@"))+1).contains("ojung.iptime.org")){
	               // 메일 발송 설정 시작
	               Properties props = System.getProperties();
	               //개별설정
	               props.put("mail.smtp.user",loginMember.getMemberEmail()
	                     .substring(0,loginMember.getMemberEmail().indexOf("@"))); 
	               
	               //공통부분
	               props.put("mail.smtp.host","ojung.iptime.org"); // 메일 호스팅중인 서버
	               props.put("mail.smtp.port","25"); // 메일 서버의 포트
	               props.put("mail.smtp.starttls.enable","true"); 
	               props.put("mail.smtp.auth","false"); // iptime에서 받은 무료 도메인이라 ssl 설정이 안돼서 인증설정은 false
	               props.put("mail.smtp.socketFactory.port","25"); // 웹메일 소켓포트 : 25
	               props.put("mail.smtp.socketFactory.fallback","false"); 
	               
	               Authenticator auth = new MyAuthentication();
	               Session session = Session.getDefaultInstance(props,auth);
	               MimeMessage msg1 = new MimeMessage(session);
	               
	               
	                  msg1.setSentDate(new java.util.Date());
	                  // 메일상에서의 from
	                  InternetAddress from = new InternetAddress(loginMember.getMemberEmail()); 
	                  msg1.setFrom(from);
	                  
	                  String email = mail.getMemberEmail(); // 받는이 이메일주소
	                  InternetAddress to = new InternetAddress(email);
	                  msg1.setRecipient(Message.RecipientType.TO, to);
	                  msg1.setSubject("협업 요청 메일","UTF-8");
	                  msg1.setHeader("content-Type", "text/plain");
	                  
	                  StringBuffer sb = new StringBuffer();
	                     sb.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">");
	                  sb.append("<html xmlns=\"http://www.w3.org/1999/xhtml\">");
	                  sb.append("<head>");
	                  sb.append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
	                  sb.append("<title>오정 그룹웨어</title>");
	                  sb.append("</head>");
	                  sb.append("<body style=\"font-family: Arial, '맑은 고딕', 'Malgun Gothic', Dotum, '돋움',sans-serif, Helvetica; font-size:12px; color:#464646; line-height:0;\">");
	                  sb.append("<div style=\"width:100%; padding:20px 0;\">");
	                  sb.append("<div style=\"width:700px; margin:0 auto;\">");
	                  sb.append("<div style=\"padding:30px;\">");
	                  sb.append("<p><h3>여러분의 소중한 의견과 함께 커가는 오정 그룹웨어입니다.</h3></p>");
	                  sb.append("<p style=\"background-color:#f4f4f4; color:#754c24; border:1px solid #d7d7d7; padding:30px; text-align:center; font-size:18px; font-weight:bold; margin-bottom:50px;\">협업요청이 등록되었습니다.</p>");
	                     sb.append("<p style=\"line-height:1.6em;\">");
	                     sb.append(collaboTitle);
	                     sb.append("</p>");
	                  sb.append("<div style=\"background:url(http://xxxxxxxxxx.co.kr/images/icon_a.jpg) left 25px no-repeat; border-top:1px solid #d7d7d7; border-bottom:1px solid #d7d7d7; padding:10px 10px 10px 50px; margin-bottom:50px;\">");
	                  sb.append("<p style=\"line-height:1.6em; color:#754c24;\">");
	                  sb.append(collaboContent);
	                     sb.append("</p></div>");
	                     sb.append("<div style=\"text-align: center;\"><button>요청글 확인</button></div>");
	                  sb.append("</div>");
	                  sb.append("<div style=\"font-size:11px; color:#636363; background-color:#f4f4f4; line-height:1.3em; padding:20px 30px; margin-top:50px;\">");
	                  sb.append("본 메일은 발신 전용이므로 메일로 문의 시 확인이 불가능합니다.</br>");
	                  sb.append("다른 궁금하신 사항은  웹사이트(<a href=\"http://ojung.iptime.org\" target=\"_blank\">ojung.iptime.org</a>)의 FAQ에서 확인 또는 Q&amp;A에서 문의해 주세요.<br />");
	                     sb.append("<br>Copyrjght 2020 ojung All rights reserved.");
	                     sb.append("</div></div></div></body></html>");
	                  
	                  msg1.setContent(sb.toString(),"text/html; charset=UTF-8"); // HTML 형식
	      
	                  javax.mail.Transport.send(msg1);
	               }
	               System.out.println("==================================");
	               System.out.println("협업 메일 보냈어욜~");
	            
	            }// ojung.iptime.org. 계정에만 이메일 전송
	            
	            cfList.clear(); 
	            
	         }else msg = "게시글 등록 실패";

	         rdAttr.addFlashAttribute("msg", msg);
	         return "redirect:" + url;

	      } catch (Exception e) {
	      e.printStackTrace();
	      model.addAttribute("errormsg","게시글 등록 과정에서 오류 발생");
	      return "common/errorPage";
	      }
	   }
	
	/** 파일 업로드 컨트롤러
	 * @param model
	 * @return String
	 */
	@RequestMapping(value = "/fileUpload", method = RequestMethod.GET)
	    public String dragAndDrop(Model model) {
	        
	        return "fileUpload";
	        
	    }
	    
	// 여기서는 첨부파일 리스트, 파일 서버에생성, 디비 삽입
	@RequestMapping(value = "/fileUpload/post") //ajax에서 호출하는 부분
    @ResponseBody
    public String upload(MultipartHttpServletRequest multipartRequest, HttpServletRequest request) { //Multipart로 받는다.
         
        Iterator<String> itr =  multipartRequest.getFileNames();
        String root = request.getSession().getServletContext().getRealPath("resources");
        String filePath = root + "/collaboUploads"; 
        
        File folder = new File(filePath);
        
        if(!folder.exists()) folder.mkdir();
        
        // 파일 드롭 다운시 실행
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
            
            MultipartFile mpf = multipartRequest.getFile(itr.next());
     
            String originalFilename = mpf.getOriginalFilename(); //원본 파일명
            String changeFilename = FileRename.rename(originalFilename); // 파일명 변경
     
            String fileFullPath = filePath+"/"+changeFilename; //파일 전체 경로  + 서버에 저장할 리네임 파일
     
            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                
                System.out.println("originalFilename => "+originalFilename);
                System.out.println("fileFullPath => "+fileFullPath);
                
                // 여기까지가 서버에 파일 저장 
                // 여기서 부터 cfList에 파일 정보 저장
                CollaboFile cf = new CollaboFile();
                cf.setFileOriginNm(originalFilename);
                cf.setFileChangeNm(changeFilename);
                cf.setFilePath(filePath);
                System.out.println("cf => " + cf);
                
                
                
                cfList.add(cf);
                
     
            } catch (Exception e) {
                System.out.println("postTempFile_ERROR======>"+fileFullPath);
                e.printStackTrace();
            }
                         
       }
        return "success";
    }
	    
	    @RequestMapping(value="task", method = RequestMethod.GET)
	    public String insertAccept(HttpServletRequest request,
	    							Model model,
	    							@RequestParam(value = "cNo", required = true) int cNo ,/* collaboNo */
	    							@RequestParam(value = "task", required = true) int taskConfirm /* collaboNo */) {
	    		
	    		Member loginMember = (Member)request.getSession().getAttribute("loginMember"); // taskAccepter
	    		if (loginMember == null) {
	    			model.addAttribute("msg", "로그인한 사용자만 접속 가능합니다.");
	    			return "redirect:login";
	    		}
	    		int memberNo = loginMember.getMemberNo();
	    		String beforeUrl = request.getHeader("referer"); // 이전 페이지 주소를 얻어옴
	    		try {
	    			int result = collaboBoardService.updateAccept(cNo, memberNo,taskConfirm);
	    			
	    			if(result>0) {
	    				if(taskConfirm == 1) model.addAttribute("msg", "요청이 수락되었습니다.");
	    				else if(taskConfirm == 2) model.addAttribute("msg", "요청이 거절되었습니다.");
	    			}else {
	    				model.addAttribute("msg", "요청 수락을 실패하였습니다. 시스템 관리자에게 문의하시기 바랍니다.");
	    				
	    			}
	    			
	    		}catch (Exception e) {
	    			e.printStackTrace();
				}
	    		
	    	return "redirect:"+beforeUrl;
	    }
	    
	    @RequestMapping(value="edit", method=RequestMethod.GET)
	    public String editDetail(Integer no,
	    						 Model model,
	    						 HttpServletRequest request) {
	    	Member loginMember = (Member)request.getSession().getAttribute("loginMember");
	    	if (loginMember == null) {
	    		model.addAttribute("msg", "로그인한 사용자만 접속 가능합니다.");
	    		return "redirect:login";
	    	}
	    	
	    	model.addAttribute("loginMember", loginMember);

	    	String detailUrl = request.getHeader("referer");
	    	model.addAttribute("detailUrl", detailUrl);
	    
	    	try {
	    		CollaboBoard cBoard = collaboBoardService.selectCollaboBoard(no);
	    		if(cBoard != null) {
	    			// 협업 파일 조회
    	            List<CollaboFile> files = collaboBoardService.selectFiles(no);
    	            
    	            if(!files.isEmpty()) { // 해당 게시글에 이미지가 있다면
    	               model.addAttribute("files", files);
    	            }
	    			// 협업 부서 선택용 리스트
					List<Member> deptList = collaboBoardService.selectDept();
					if(deptList != null) model.addAttribute("deptList", deptList);
	    			// 선택된 요청 처리 부서 리스트 
	    			List<String> selectDepts = new ArrayList<String>();
	    			String[] depts = cBoard.getCollaboDept().split(",");
	    			
	    			for(int i=0;i<depts.length;i++) {
	    				selectDepts.add(depts[i]);
	    			}
		    			if(selectDepts != null) {
		    				model.addAttribute("selectDepts", selectDepts);
		    			}
	    			
	    			// 협업 요청 부서 리스트
	    			
	    		}
	    		
	    		cBoard.setCollaboContent(cBoard.getCollaboContent().replace("<br>", "\r\n"));
	    		
	    		model.addAttribute("cBoard", cBoard);
	    		return "collaboBoard/collaboBoardUpdate";
	    		
	    	}catch (Exception e) {
	    		e.printStackTrace();
	    		model.addAttribute("errorMsg", "게시글 수정중 에러 발생");
	    		return "common/errorPage";
			}
	    }
	   
	    @RequestMapping(value="update",method = RequestMethod.POST)
	    public String updateDetail (Model model, Integer no, CollaboBoard cBoard,
	    			RedirectAttributes rdAttr, HttpServletRequest request,
	    			@RequestParam(value="fileUpload", required=false)List<MultipartFile> fileUpload) {
	    	
	    	Member loginMember = (Member)request.getSession().getAttribute("loginMember");
	    	if (loginMember == null) {
	    		model.addAttribute("msg", "로그인한 사용자만 접속 가능합니다.");
	    		return "redirect:login";
	    	}
	    	
			// 이전 페이지(상세조회 페이지) 주소를 detailUrl에 저장
	    	String detailUrl = (String)model.getAttribute("detailUrl");
			model.addAttribute("detailUrl", detailUrl);
	    		
			cBoard.setCollaboNo(no);
	    	String msg = null;
	    	
	    	String root = request.getSession().getServletContext().getRealPath("resources");
	        String filePath = root + "/collaboUploads"; 
	        
	        File folder = new File(filePath);
	        
	        if(!folder.exists()) folder.mkdir();
	        
	        
	    	try {
	    		int result = collaboBoardService.updateDetail(cBoard, fileUpload, filePath);
	    		
	    		if(result > 0 ) {
	    			msg = "게시판 수정 성공";
	    			
	    		}else {
	    			msg = "게시판 수정 실패";
	    		} 
	    		
	    		rdAttr.addFlashAttribute("msg",msg);
	    		return "redirect:"+detailUrl;
	    		
	    	}catch (Exception e) {
	    		e.printStackTrace();
	    		model.addAttribute("errorMsg", "게시글 수정중 에러 발생");
	    		return "common/errorPage";
			}
	    	
	    }


	    @RequestMapping(value="delete", method=RequestMethod.GET)
	    public String deleteDetail(Integer no,Model model, HttpServletRequest request,
	    							RedirectAttributes rdAttr) {
	    	Member loginMember = (Member)request.getSession().getAttribute("loginMember");
	    	if (loginMember == null) {
	    		model.addAttribute("msg", "로그인한 사용자만 접속 가능합니다.");
	    		return "redirect:login";
	    	}

	    		try {
	    			String msg = null;
	    			
	    			int result = collaboBoardService.deleteDetail(no);
	    			
	    			if (result > 0) {
	    				msg = "게시글 삭제 성공";
	    				
	    			}else {
	    				msg = "게시글 삭제 성공";
	    			}
	    			
	    			rdAttr.addFlashAttribute("msg",msg);
	    		}catch (Exception e) {
	    			e.printStackTrace();
	    			model.addAttribute("errorMsg", "게시글 삭제 중 에러 발생");
	    			return "common/errorPage";
				}
	    		// 이전 페이지(상세조회 페이지) 주소를 detailUrl에 저장
				String detailUrl = request.getHeader("referer");	
		    		
				return "redirect:collaboBoardList";
	    }
	    
	    
	    @ResponseBody
		@RequestMapping("insertReply")
		public String insertReply(@RequestBody CollaboCmmt reply) {
			int result = 0;
			String data = "";
			
			
			try {
				result =  collaboBoardService.insertReply(reply);
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

	    @ResponseBody
		@RequestMapping(value="replyList", produces="application/json; charset=utf-8")
		public String selectReplyList(int collaboNo) {

	    	List<CollaboCmmt> replyList = new ArrayList<CollaboCmmt>();
	    	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd hh:mm:ss").create();
	    	
	    	try {
				replyList = collaboBoardService.selectReplyList(collaboNo);
			}catch (Exception e) {
				e.printStackTrace();
			}
	    	return gson.toJson(replyList);
			
		}

		@ResponseBody
		@RequestMapping("deleteReply")
		public int deleteReply( CollaboCmmt reply) {
			int replyNo = reply.getCollaboCmmtNo();
			int result = 0;
			try {
				result = collaboBoardService.deleteReply(replyNo);
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
		public int updateReply(@RequestBody CollaboCmmt reply) {
			int result = 0;
			try {
				result = collaboBoardService.updateReply(reply);
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
		public int replyCount(int collaboNo, Model model) {
			int count = 0;
			
			try {
				count = collaboBoardService.replyCount(collaboNo);
				model.addAttribute("count",count);
			}catch(Exception e) {
				e.printStackTrace();
				count = -1;
			}
			return count;
		}
		
		@ResponseBody
		@RequestMapping(value = "selectCflist", 
						produces = "appliocation/json; charset = utf-8")
		public String selectCflist(int collaboNo, Model model,
									HttpServletRequest request) {

			// 첨부파일 리스트
			List<CollaboFile> cfList = new ArrayList<CollaboFile>();
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd hh:mm:ss").create();
	    	try {
	    		System.out.println(collaboNo);
	    		cfList = collaboBoardService.selectFiles(collaboNo);
	    		
	    	}catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	return gson.toJson(cfList);
		}
	    
	}
