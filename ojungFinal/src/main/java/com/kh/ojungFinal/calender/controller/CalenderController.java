package com.kh.ojungFinal.calender.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.calender.model.service.CalendarService;
import com.kh.ojungFinal.calender.model.vo.Calendar;

@SessionAttributes({"loginMember", "msg"})
@Controller
@RequestMapping("/calender/*")
public class CalenderController {
	
	@Autowired
	private CalendarService calendarService;
	
	
	@RequestMapping("calender")
	public String departmentBoardList() {
		return "calender/calender";
		
	}
	

	// 일정 목록 조회
	@ResponseBody
	@RequestMapping(value="readEvent", produces="application/json; charset=utf-8")
	public String readEvent(Model model) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
		
		List<Calendar> cList = calendarService.selectEventList(memberNo);
		
		
		Gson gson = new GsonBuilder().create();
		
		
		return gson.toJson(cList);
		
	}

	
	// 새로운 일정 추가
	@ResponseBody
	@RequestMapping(value="insertEvent", produces="application/json; charset=utf-8")
	public int insertEvent(Model model, Calendar calendar) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		calendar.setMemberNo(loginMember.getMemberNo());
		
		
		int result = 0;
		try {
			result = calendarService.insertEvent(calendar);
				
			
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		}
		
		
		return result;
		
	}
	
	// 일정 수정
	@ResponseBody
	@RequestMapping(value="updateEvent", produces="application/json; charset=utf-8")
	public int updateEvent(Model model, Calendar calendar) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		calendar.setMemberNo(loginMember.getMemberNo());
		
	
		int result = 0;
		try {
			result = calendarService.updateEvent(calendar);
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		}
		
		return result;
	}
	
	// 일정 삭제(진짜로 delete 진행할거임)
	@ResponseBody
	@RequestMapping(value="deleteEvent", produces="application/json; charset=utf-8")
	public int deleteEvent(Model model, Calendar calendar) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		calendar.setMemberNo(loginMember.getMemberNo());
		
		int result = 0;
		try {
			
			result = calendarService.deleteEvent(calendar);
			
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		}

		
		return result;
	}
	
	// 일정 리사이즈 업데이트(all-day인 경우 기간 변경)
	@ResponseBody
	@RequestMapping(value="resizeEvent", produces="application/json; charset=utf-8")
	public int resizeEvent(Model model, Calendar calendar) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		calendar.setMemberNo(loginMember.getMemberNo());
		
		int result = 0;
		try {
			
			result = calendarService.resizeEvent(calendar);
			
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		}
		
		
		return result;
	}
	
	// 일정 마우스 드레그해서 날짜 변경
	@ResponseBody
	@RequestMapping(value="dropEvent",  produces="application/json; charset=utf-8")
	public int dropEvent(Model model, Calendar calendar) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		calendar.setMemberNo(loginMember.getMemberNo());
		
		int result = 0;
		try {
			
			result = calendarService.dropEvent(calendar);
			
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		}
		
		return result;
	}
	
	
	
	

	
	
	
}