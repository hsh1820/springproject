package com.kh.ojungFinal.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ojungFinal.member.model.vo.MemberView;
import com.kh.ojungFinal.member.model.vo.ProfileImage;
import com.kh.ojungFinal.member.model.vo.SignImage;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ojungFinal.admin.model.vo.Attendance;
import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.admin.model.vo.RecentBoard;
import com.kh.ojungFinal.common.FileRename;
import com.kh.ojungFinal.common.Pagination;
import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.member.model.service.MemberService;

@SessionAttributes({ "loginMember", "msg", "profileImg", "signImg"}) 
@Controller 
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	// 마이페이지 조회
		@RequestMapping("profileMember")
		public String profileMember(Model model) {
			
			Member loginMember = (Member)model.getAttribute("loginMember");

			try {
				// 1. 단순 기본 정보 조회
				MemberView member = memberService.selectMember(loginMember.getMemberNo());
				model.addAttribute("member", member);
				
				// 2. 동일부서원 목록 조회
				List<MemberView> list= memberService.selectSameDeptList(loginMember.getDeptCode());
				model.addAttribute("list", list);
				
				// 3. 해당 사원의 프로필 사진 조회
				ProfileImage profileImg = memberService.selectProfile(loginMember.getMemberNo());
				model.addAttribute("profileImg", profileImg);
				
				// 4. 해당 사원의 도장 사진 조회
				SignImage signImg = memberService.selectSign(loginMember.getMemberNo());
				model.addAttribute("signImg", signImg);
				
				//System.out.println("cont 프사 : " + profile.getImageChangeName());
				//System.out.println("member no : " + loginMember.getMemberNo());
				//System.out.println("프사 멤버 no : " + profile.getMemberNo());
				
				int enrollDate = Integer.parseInt(member.getEnrollDate().substring(0, 4));
				
				System.out.println("날짜 자른거 : " + enrollDate);
				// 해당 사원의 입사일자 값 전달
				model.addAttribute("enrollDate", enrollDate); 
				
				return "member/profileMember";
				
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMsg", "회원정보 조회 과정에서 오류 발생");
				return "common/errorPage";
			}
			
		}	
		
		// 근태기록 조회
		@ResponseBody
		@RequestMapping(value = "selectAttendanceList", produces = "application/json; charset=utf-8")
		public String selectAttendanceList(Model model){
			
				Member loginMember = (Member)model.getAttribute("loginMember");
				
				List<Attendance> aList = memberService.selectAttendanceList(loginMember.getMemberNo());
				
				for(Attendance a : aList) {
					
					String createChangeDate = new SimpleDateFormat("yyyy/MM/dd").format(a.getInTime());
					a.setChangeDate(createChangeDate);
					
					String createChangeInTime = new SimpleDateFormat("HH:mm").format(a.getInTime());
					a.setChangeInTime(createChangeInTime);

					if(a.getOutTime() != null) {
						String createChangeOutTime = new SimpleDateFormat("HH:mm").format(a.getOutTime());
						a.setChangeOutTime(createChangeOutTime);
					}
				}
				
				System.out.println(aList);
				
				Gson gson = new GsonBuilder().create();
				
			return gson.toJson(aList);
		}
		
		// 근태기록 검색
		@ResponseBody
		@RequestMapping("AttendanceSearch")
		public String attendanceSearchList(Model model,
				@RequestParam(value="searchKeyYear", required=false) String searchKeyYear,
				@RequestParam(value="searchKeyMonth", required=false) String searchKeyMonth) {
			
			System.out.println("searchKeyYear : " + searchKeyYear);
			System.out.println("searchKeyMonth : " + searchKeyMonth);
			
			Member loginMember = (Member)model.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo();
			
			Map<String,Object> map = null; 
			
			if(searchKeyYear != null && searchKeyMonth != null) {
				searchKeyYear = searchKeyYear.substring(2);
				System.out.println("searchKeyYear잘렸나 : " + searchKeyYear);
				
				map = new HashMap<String, Object>();
				map.put("searchKeyYear", searchKeyYear);
				map.put("searchKeyMonth", searchKeyMonth);
				map.put("memberNo", memberNo);
			}
			
			List<Attendance> aSearchList = memberService.attendanceSearchList(map);
			
			for(Attendance a : aSearchList) {
				
				String createChangeDate = new SimpleDateFormat("yyyy/MM/dd").format(a.getInTime());
				a.setChangeDate(createChangeDate);
				
				String createChangeInTime = new SimpleDateFormat("HH:mm").format(a.getInTime());
				a.setChangeInTime(createChangeInTime);
				
				String time1 = createChangeInTime.split(":")[0];
				String time2 = createChangeInTime.split(":")[1];
				
				int time = Integer.parseInt(time1+time2);
				
				System.out.println("시간 : " + time);
				
				if(time-900 > 0) {
					a.setInoutStatus(2);
				}else{
					a.setInoutStatus(1);
				}
				
				if(a.getOutTime() != null) {
					String createChangeOutTime = new SimpleDateFormat("HH:mm").format(a.getOutTime());
					a.setChangeOutTime(createChangeOutTime);
				}
			} 
			
			System.out.println("aSearchList : " + aSearchList);
			Gson gson = new GsonBuilder().create();
			
			return gson.toJson(aSearchList);
		}
		
		
		// 부서원 이름으로 검색
		@RequestMapping("list")
		public String coworkerSearch(Model model, RedirectAttributes rdAttr,
				@RequestParam(value="table_search", required = false) String table_search) {
			
			Member loginMember = (Member)model.getAttribute("loginMember");
			String deptCode = ((Member)model.getAttribute("loginMember")).getDeptCode();
			
			try {
				
				// 1. 단순 기본 정보 조회
				MemberView member = memberService.selectMember(loginMember.getMemberNo());
				model.addAttribute("member", member);			
				
				// 2. 동일부서원 목록 중 검색
				Map<String, String> map = null;
				if(table_search != null) {
					map = new HashMap<String, String>();
					map.put("deptCode", deptCode);
					map.put("table_search", table_search);
				}
				
				// 2. 동일부서원 목록 조회
				List<MemberView> list= memberService.selectDeptList(map);
				model.addAttribute("list", list);
				
				return "member/profileMember";
				
				
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMsg", "회원정보 조회 과정에서 오류 발생");
				return "common/errorPage";
			}
			
		}
		
		

		// 회원정보 수정
		@RequestMapping("updateMember")
		public String updateMember(Member member, Model model, RedirectAttributes rdAttr, String address, 
							String newPwd1, String newPwd2, String phone, HttpServletRequest request,
							@RequestParam(value="profile", required = false) MultipartFile profile) {
			
			
			Member loginMember = (Member)model.getAttribute("loginMember");
			
			loginMember.setMemberAddress(address);
			loginMember.setMemberPhone(phone);
			loginMember.setMemberPwd(newPwd1);
			
			
			// session에서 회원 번호 받아와 member에 set
			loginMember.setMemberNo(((Member)model.getAttribute("loginMember")).getMemberNo());
			
			// 수정 또는 새롭게 추가된 파일이 저장될 경로 얻어오기
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "/uploadFiles";

			// 저장폴더가 있는지 검사하여 없을 경우 생성하기
			File folder = new File(savePath);
			
			if(!folder.exists()) folder.mkdir();
			
			
			try {
							
				ProfileImage beforeImg = memberService.selectProfile(loginMember.getMemberNo());
				
				ProfileImage profileImage = null;
				
				String msg = null;
				String url = null;
				
				
				if(!profile.getOriginalFilename().equals("")) {
					
					String changeFileName = FileRename.rename(profile.getOriginalFilename());
					
					profileImage = new ProfileImage(profile.getOriginalFilename(), changeFileName, 
							savePath, loginMember.getMemberNo());
				}
				
				
				if(beforeImg == null) {	 
					
					int result = memberService.insertProfileImage(profileImage);
					
					if(result > 0) {
						profile.transferTo(new File(profileImage.getImagePath() + "/" + profileImage.getImageChangeName()));
						
						System.out.println("컨트롤러 멤버번호 : " + loginMember.getMemberNo());
						
						msg = "프로필 사진 삽입 성공";
						url ="profileMember";
					} else {
						msg = "프로필 사진 삽입 실패";
						url ="profileMember";
					}
					
					
					rdAttr.addFlashAttribute("msg", msg);
					return "redirect:" + url;
					
					
				} else {
					
					int result = memberService.updateMember(loginMember, profile, profileImage, savePath, newPwd1);
					
					
					if(result > 0) {
						msg = "업데이트 성공^0^";
						url ="profileMember";
					}
					else{
						msg = "업데이트 성공^0^";
						url ="profileMember";
					}
					
					
					
					rdAttr.addFlashAttribute("msg", msg);
					return "redirect:" + url;
				}
				
			
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMag", "회원정보 수정 과정 중 오류 발생!");
				return "common/errorPage";

			}
			
		}
		   
		
		
		// 도장 이미지
		@RequestMapping("updateSign")
		public String updateSign(Member member, Model model, RedirectAttributes rdAttr, HttpServletRequest request,
				@RequestParam(value="sign", required = false) MultipartFile sign) {


		Member loginMember = (Member)model.getAttribute("loginMember");
		
		loginMember.setMemberNo(((Member)model.getAttribute("loginMember")).getMemberNo());
		
		// 수정 또는 새롭게 추가된 파일이 저장될 경로 얻어오기
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
		
		// 저장폴더가 있는지 검사하여 없을 경우 생성하기
		File folder = new File(savePath);
		
		if(!folder.exists()) folder.mkdir();
		
		
		try {
			
			SignImage beforeSign = memberService.selectSign(loginMember.getMemberNo());
			SignImage signImage = null;
			
			String msg = null;
			String url = null;
			
			
			if(!sign.getOriginalFilename().equals("")) {
							
				String changeSignName = FileRename.rename(sign.getOriginalFilename());
				
				
				signImage = new SignImage(sign.getOriginalFilename(), changeSignName, 
						savePath, loginMember.getMemberNo());
			}
		
			
			if(beforeSign == null) {	
						
				int result = memberService.insertSignImage(signImage);
				
				if(result > 0) {
					sign.transferTo(new File(signImage.getSignPath() + "/" + signImage.getSignChangeName()));
					
					msg = "도장 사진 삽입 성공";
					url ="profileMember";
				} else {
					msg = "도장 사진 삽입 실패";
					url ="profileMember";
				}
				
				
				rdAttr.addFlashAttribute("msg", msg);
				return "redirect:" + url;
				
				
			} else {
				
				int result = memberService.updateSign(loginMember, sign, signImage, savePath);
				
				
				if(result > 0) {
					msg = "업데이트 성공^0^";
					url ="profileMember";
				}
				else {
					msg = "업데이트 실패 T0T";
					url ="profileMember";
				}
				
				
				
				rdAttr.addFlashAttribute("msg", msg);
				return "redirect:" + url;
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMag", "회원정보 수정 과정 중 오류 발생!");
			return "common/errorPage";
		
		}
		
		}
				
		
	}
	

	
