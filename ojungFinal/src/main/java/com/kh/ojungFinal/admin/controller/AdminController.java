package com.kh.ojungFinal.admin.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kh.ojungFinal.admin.model.service.AdminService;
import com.kh.ojungFinal.admin.model.vo.AdminMemberView;
import com.kh.ojungFinal.admin.model.vo.Attendance;
import com.kh.ojungFinal.admin.model.vo.MainSign;
import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.admin.model.vo.ProfileImage;
import com.kh.ojungFinal.admin.model.vo.RecentBoard;
import com.kh.ojungFinal.calender.model.service.CalendarService;
import com.kh.ojungFinal.calender.model.vo.Calendar;
import com.kh.ojungFinal.elec.model.vo.SignTobeListView;
import com.kh.ojungFinal.notice.model.vo.Notice;
import com.kh.ojungFinal.schedule.model.vo.Schedule;

@SessionAttributes({ "loginMember", "msg", "profileImg"})
@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private CalendarService calendarService;

	@RequestMapping("login")
	public String memberLogin(Member member, Model model, RedirectAttributes rdAttr, HttpServletRequest request) {

		
		 Member loginMember = null; 
		 System.out.println(member.getMemberEmail() + " / "+ member.getMemberPwd());
		 

		String beforeUrl = request.getHeader("referer");

		try {
			// 로그인
			loginMember = (Member) model.getAttribute("loginMember"); 

			if (loginMember == null)
				loginMember = adminService.loginMember(member);
			System.out.println("loginMember" + loginMember);

			if (loginMember != null) {
				model.addAttribute("loginMember", loginMember);

				int memberNo = loginMember.getMemberNo();

				// 공지사항 리스트 불러오기
				List<Notice> noticeList = adminService.selectNoticeList();

				System.out.println(noticeList);
				model.addAttribute("noticeList", noticeList);

				// 결재대기문서 리스트 불러오기
				List<SignTobeListView> mainSignList = adminService.selectMainSignList(memberNo);

				System.out.println(mainSignList);
				model.addAttribute("mainSignList", mainSignList);

				// 사원 프로필 사진 불러오기
				ProfileImage profileImg = adminService.selectProfileImage(memberNo);
				model.addAttribute("profileImg", profileImg);

				// 최신게시판 글 불러오기(협업게시판+부서게시판)
				String deptCode = loginMember.getDeptCode();

				List<RecentBoard> rList = adminService.selectRecentBoardList(deptCode);

				Collections.sort(rList);

				Collections.reverse(rList);

				System.out.println("정렬1");
				for (RecentBoard r : rList) {
					String createChangeDate = new SimpleDateFormat("yyyy-MM-dd").format(r.getrBoardCreateDate());
					r.setChangeDate(createChangeDate);
				}
				model.addAttribute("rList", rList);

				// 근태기록 불러오기
				Attendance attendance = adminService.checkAttendance(memberNo);
				System.out.println(attendance);
				model.addAttribute("attendance", attendance);
				
				// 일정
				List<Schedule> scheduleList = adminService.selectScheduleList(memberNo);
				
				System.out.println("스케줄 리스트 : " + scheduleList);
				//model.addAttribute("scheduleList", scheduleList);
				
				JsonArray jArray = new JsonArray();
				for(int i=0; i<scheduleList.size(); i++) {
					JsonObject sObject = new JsonObject();
					sObject.addProperty("ssTitle", scheduleList.get(i).getSsTitle());
					sObject.addProperty("ssStartDate", scheduleList.get(i).getSsStartDate());
					jArray.add(sObject);
				}
				
				model.addAttribute("jArray", jArray);
				System.out.println(jArray);
				
				
				return "common/index";

			} else {
				rdAttr.addFlashAttribute("msg", "로그인 정보가 유효하지 않습니다.");
				return "redirect:" + beforeUrl;

			}

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "로그인 과정에서 오류 발생");
			return "common/errorPage";
		}
	}

	@RequestMapping("logout")
	public String memberLogout(SessionStatus status/* HttpSession session */) {
		// 세션 무효화
		// session.invalidate();

		// SessionStatus 객체 : 세션의 상태를 관리할 수 있는 객체
		// @SessionAttributes 사용 시
		// Session을 무효화 시키기 위해서는 SessionStatus 객체를 사용해야 함.
		status.setComplete();

		return "redirect:/";
	}

	@RequestMapping("memberManagement")
	public String memberManagement() {
		return "admin/memberManagement";

	}

	@RequestMapping("insert")
	public String memberInsert(RedirectAttributes rdAttr, Member member, Model model, String phone1, String phone2, String phone3, String post,
			String address1, String address2, String idNo1, String idNo2) {

		String memberPhone = phone1 + "-" + phone2 + "-" + phone3;

		String memberAddress = post + "," + address1 + "," + address2;

		String memberIdNo = idNo1 + "-" + idNo2;

		Member createMember = new Member(member.getMemberEmail(), member.getMemberName(), memberPhone, memberAddress,
				member.getDeptCode(), member.getJobCode(), memberIdNo, member.getGender());

		System.out.println(createMember);

		try {
			int result = adminService.insertMember(createMember);

			String msg = null;
			String url = null;

			if (result > 0) {

				msg = "신규사원 등록 성공";
				url = "list";
			} else {

				msg = "신규사원 등록 실패";
				url = "list";
			}

			rdAttr.addFlashAttribute("msg", msg);
			return "redirect:" + url;

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "회원가입 오류");
			return "common/errorPage";
		}
	}

	/*
	 * @ResponseBody란? 메소드에서 리턴되는 값을 View를 통해 출력하는 것이 아닌 리턴값을 HTTP Response Body에 담는
	 * 역할을 함 -> jsp로 화면이 이동되는 것이 아닌 기존 페이지로 데이터만 전달됨. String, ModelAndView -> view
	 * 이동 AJAX 데이터, JSON, XML 사용할 때 -> Data 전달, 이때 @ResponseBody사용
	 */

	// 아이디 중복 검사
	@ResponseBody
	@RequestMapping("emailDupCheck")
	public String emailDupCheck(String memberEmail, Model model) {
		try {
			return adminService.emailDupCheck(memberEmail) == 0 ? true + "" : false + "";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "아이디 중복 체크 과정에서 오류 발생");
			return "common/errorPage";
		}
	}

	// 사원 목록 조회
	@RequestMapping("list")
	public ModelAndView selectMemberList(ModelAndView mv,
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "searchValue", required = false) String searchValue

	) {

		try {
			// 검색 조건이 있는지 확인하여 map에 세팅
			Map<String, String> map = null;
			if (searchKey != null && searchValue != null) {
				map = new HashMap<String, String>();
				map.put("searchKey", searchKey);
				map.put("searchValue", searchValue);

			}

			List<AdminMemberView> list = adminService.selectMemberList(map);

			mv.addObject("list", list);
			mv.setViewName("admin/memberManagement");

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "사원 목록 조회 중 오류 발생");
			mv.setViewName("common/errorPage");

		}
		return mv;

	}

	@ResponseBody
	@RequestMapping("detail")
	public Member detailAdminMember(ModelAndView mv, int no) {

		try {
			Member member = adminService.detailAdminMember(no);
			System.out.println(member);
			return member;

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "사원  조회 중 오류 발생");
			mv.setViewName("common/errorPage");
			return null;
		}
	}

	@RequestMapping("update")
	public String updateAdminMember(RedirectAttributes rdAttr, Model model, int memberNoAjax, String jobSelect,
			String memberStatusAjax, String deptSelect) {
		System.out.println(memberNoAjax + "," + jobSelect + "," + memberStatusAjax + "," + deptSelect);
		String msg = null;
		String url = null;
		try {
			Member member = new Member();
			member.setMemberNo(memberNoAjax);
			member.setJobCode(jobSelect);
			member.setDeptCode(deptSelect);
			member.setMemberStatus(Integer.parseInt(memberStatusAjax));

			int result = adminService.updateAdminMember(member);

			if (result > 0) {
				msg = "회원 정보 수정 완료";
				url = "list";
			} else {
				msg = "회원 정보 수정 실패";
				url = "list";
			}
			rdAttr.addFlashAttribute("msg", msg);
			return "redirect:" + url;
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "게시글 등록 과정 중 오류 발생");
			return "common/errorPage";
		}
	}

	
	@ResponseBody
	@RequestMapping("inTime")
	public int inTime(Model model) {
		int result = 0;
		try {
			
			Member loginMember = (Member) model.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo();

			Attendance attendance = new Attendance();

			attendance.setMemberNo(memberNo);

			result = adminService.insertInTime(attendance);
			// 일단 insert
			
			if(result > 0) {
				// inoutStatus 설정을 위해 해당 Attendance 불러오기
				Attendance selectAttendance = adminService.selectAttendance(memberNo);
				
				String createChangeInTime = new SimpleDateFormat("HH:mm").format(selectAttendance.getInTime());
				selectAttendance.setChangeInTime(createChangeInTime);
				
				String time1 = createChangeInTime.split(":")[0];
				String time2 = createChangeInTime.split(":")[1];
				
				int time = Integer.parseInt(time1 + time2);
				
				System.out.println("시간 : " + time);
				
				int inoutStatus = 0;
				
				if (time - 900 > 0) {
					inoutStatus = 2;
				} else {
					inoutStatus = 1;
				}
				
				Map<String,Integer> map = new HashMap<String, Integer>();
				
				map.put("memberNo", memberNo);
				map.put("inoutStatus", inoutStatus);
				
				result = adminService.updateInoutStatus(map);
				
			}
			
			
		}catch(Exception e) { 
			e.printStackTrace();
			result = -1;
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("outTime")
	public int outTime(Model model) {
		int result = 0;
		try {
			Member loginMember = (Member)model.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo();
			
			result = adminService.updateOutTime(memberNo);
			
		}catch (Exception e) {
			e.printStackTrace();
			result = -1;
		}
		return result;
	}
	@ResponseBody
	@RequestMapping(value="readEvent", produces="application/json; charset=utf-8")
	public String readEvent(Model model) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
		
		List<Calendar> cList = calendarService.selectEventList(memberNo);
		
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(cList);
		
	}
	
}
