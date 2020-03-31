package com.kh.ojungFinal.personalMessage.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.personalMessage.model.service.PersonalMsgService;
import com.kh.ojungFinal.personalMessage.model.vo.PersonalMsg;

@SessionAttributes({ "loginMember"})
@Controller
@RequestMapping("/personalMessage/*")
public class personalMessageController {
	
	@Autowired
	private PersonalMsgService personalMsgService;
	
	
	@RequestMapping("personalMessage")
	public ModelAndView personalMsgList(ModelAndView mv, HttpServletRequest req) {

		Member login = (Member)req.getSession().getAttribute("loginMember");
		
		int memberNo = login.getMemberNo();
		
		try {
				
			List<PersonalMsg> list = personalMsgService.selectMsgList(memberNo);

			mv.addObject("list", list);
			mv.setViewName("personalMessage/personalMessage");
			
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "쪽지 목록 조회중 오류 발생");
			mv.setViewName("common/errorPage");
			
		}
		return mv;

	}
	
	
	@RequestMapping("sendReply")
	public ModelAndView sendReply(ModelAndView mv,int msgNo, int memberNo2, String msgTitle, String msgContent, int msgSender) {
		
		try {
			
			PersonalMsg personalMsg = new PersonalMsg(msgNo, msgTitle, msgContent, memberNo2, msgSender);
			
			int result = personalMsgService.sendReply(personalMsg);
			
			mv.setViewName("redirect:/personalMessage/personalMessage");
			
		
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "쪽지 답장 중 오류 발생");
			mv.setViewName("common/errorPage");
			
		}
		
		
		
		return mv;
	}
	
	/*@ResponseBody
	@RequestMapping(value="msgSelectDepartment")
	public List<Member> msgSelectDepartment(String radiovalue) {
		
		System.out.println("radiovalue="+radiovalue);
		
		List<Member> mList = null;
		
		try {
			mList = personalMsgService.selectDepartment(radiovalue);
			System.out.println(mList);
			
			if(!mList.isEmpty()) {
				System.out.println("출력성공");
				
			} else {
				System.out.println("출력실패");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mList;
	
		
	}*/
	
	@ResponseBody
	@RequestMapping(value="msgSelectDepartment")
	public String msgSelectDepartment(String radiovalue) {
		
		System.out.println("radiovalue="+radiovalue);
		
		List<Member> mList = null;
		
		try {
			mList = personalMsgService.selectDepartment(radiovalue);
			System.out.println(mList);
			
			if(!mList.isEmpty()) {
				System.out.println("출력성공" + mList);
				
			} else {
				System.out.println("출력실패");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new Gson().toJson(mList);
	
		
	}


	@RequestMapping("sendNewMsg")
	public ModelAndView sendNewMsg(ModelAndView mv, HttpServletRequest request, String msgTitle, String msgContent , int memberNo2,
			 int msgSender) {
	
	
		
		System.out.println(msgTitle + " : msgTitle");
		System.out.println(msgContent + " : msgContent");
		System.out.println(msgSender + " : msgSender");
		System.out.println(memberNo2 + " : memberNo2");
		
		try {
			
			PersonalMsg personalMsg = new PersonalMsg(msgTitle, msgContent, msgSender, memberNo2);
			System.out.println(personalMsg);
			
			int result = personalMsgService.sendNewMsg(personalMsg);
			System.out.println(result + "개의 쪽지 발송 완료");
			

			mv.setViewName("redirect:/personalMessage/personalMessage");
			
		
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "쪽지 전송 중 오류 발생"); 
			mv.setViewName("common/errorPage");
			
		}
		
		
		
		return mv;
	}



	 @RequestMapping("searchMsg")
	 public ModelAndView searchMsg(ModelAndView mv, HttpServletRequest req, 
			 @RequestParam(value = "searchValue", required = false) String searchValue) {
		 
		 System.out.println("검색어 : " + searchValue);
		 
			Member login = (Member)req.getSession().getAttribute("loginMember");
			
			int memberNo = login.getMemberNo();			
				

			  Map<String, Object> map = null;
				if (searchValue != null) {
					map = new HashMap<String, Object>();
					map.put("memberNo", memberNo);
					map.put("searchValue", searchValue);
					
					System.out.println(map);
				}
			
				try {
						
					List<PersonalMsg> list = personalMsgService.searchMsgList(map);
					
					System.out.println("list : " + list);

					mv.addObject("list", list);
					mv.setViewName("personalMessage/personalMessage");
					
			 
		 } catch (Exception e) {
			 e.printStackTrace();
				mv.addObject("errorMsg", "쪽지함 검색 중 오류 발생"); 
				mv.setViewName("common/errorPage");
		 }
		 
		 
		 return mv;
	 }
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}