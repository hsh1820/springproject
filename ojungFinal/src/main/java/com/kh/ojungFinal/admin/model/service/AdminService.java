package com.kh.ojungFinal.admin.model.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kh.ojungFinal.admin.model.vo.AdminMemberView;
import com.kh.ojungFinal.admin.model.vo.Attendance;
import com.kh.ojungFinal.admin.model.vo.MainSign;
import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.admin.model.vo.ProfileImage;
import com.kh.ojungFinal.admin.model.vo.RecentBoard;
import com.kh.ojungFinal.elec.model.vo.SignTobeListView;
import com.kh.ojungFinal.notice.model.vo.Notice;
import com.kh.ojungFinal.schedule.model.vo.Schedule;

public interface AdminService {

	/**
	 * 로그인
	 * 
	 * @param member
	 * @return Member
	 * @throws Exception
	 */
	public abstract Member loginMember(Member member) throws Exception;

	/**
	 * 신규사원 등록
	 * 
	 * @param createMember
	 * @return result
	 */
	public abstract int insertMember(Member createMember) throws Exception;

	/**
	 * 이메일 중복 검사
	 * 
	 * @param memberId
	 * @return result
	 * @throws Exception
	 */
	public abstract int emailDupCheck(String memberEmail) throws Exception;

	/**
	 * 사원 목록 조회
	 * 
	 * @param map
	 * @return list
	 * @throws Exception
	 */
	public abstract List<AdminMemberView> selectMemberList(Map<String, String> map) throws Exception;

	/**
	 * 사원 변경을 위한 내용 가져오기
	 * 
	 * @param no
	 * @return member
	 * @throws Exception
	 */
	public abstract Member detailAdminMember(int no) throws Exception;

	/**
	 * 메인화면 공지사항 리스트 불러오기
	 * 
	 * @return noticeList
	 * @throws Exception
	 */
	public abstract List<Notice> selectNoticeList() throws Exception;

	/**관리자의 멤버 일부 변경 
	 * @param member
	 * @return
	 * @throws Exception
	 */
	public abstract int updateAdminMember(Member member) throws Exception;
	/**
	 * 메인화면 결재대기문서 리스트 불러오기
	 * 
	 * @param memberNo
	 * @return mainSignList
	 * @throws Exception
	 */

	public abstract List<SignTobeListView> selectMainSignList(int memberNo)throws Exception;

	/**프로필 사진 조회
	 * @param memberNo
	 * @return profileImg
	 * @throws Exception
	 */
	public abstract ProfileImage selectProfileImage(int memberNo) throws Exception;

	
	/** 최신 게시글 리스트 불러오기
	 * @param deptCode
	 * @return rList
	 * @throws Exception
	 */
	public abstract List<RecentBoard> selectRecentBoardList(String deptCode)throws Exception;

	/** 출근 버튼 클릭 시 근태관리 테이블에 데이터 삽입
	 * @param inTime
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertInTime(Attendance attendance)throws Exception;

	/** 당일 출근버튼을 눌렀는지 확인하기 위한 Service
	 * @param memberNo
	 * @return attendance
	 * @throws Exception
	 */
	public abstract Attendance checkAttendance(int memberNo) throws Exception;

	/**퇴근 버튼을 클릭했을 때 처리해주기 위한 Service
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public abstract int updateOutTime(int memberNo)throws Exception;

	/** 오늘 날짜와 회원 번호가 일치하는 Attendance 불러오기
	 * @param memberNo
	 * @return selectAttendance
	 * @throws Exception
	 */
	public abstract Attendance selectAttendance(int memberNo)throws Exception;

	/** inoutStatus 업데이트용 Service
	 * @param map
	 * @return result
	 * @throws Exception
	 */
	public abstract int updateInoutStatus(Map<String, Integer> map)throws Exception;

	
	public abstract List<Schedule> selectScheduleList(int memberNo) throws Exception;

		
}
