package com.kh.ojungFinal.admin.model.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ojungFinal.admin.model.dao.AdminDAO;
import com.kh.ojungFinal.admin.model.vo.AdminMemberView;
import com.kh.ojungFinal.admin.model.vo.Attendance;
import com.kh.ojungFinal.admin.model.vo.MainCollaboBoard;
import com.kh.ojungFinal.admin.model.vo.MainDeptBoard;
import com.kh.ojungFinal.admin.model.vo.MainSign;
import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.admin.model.vo.ProfileImage;
import com.kh.ojungFinal.admin.model.vo.RecentBoard;
import com.kh.ojungFinal.elec.model.vo.SignTobeListView;
import com.kh.ojungFinal.notice.model.vo.Notice;
import com.kh.ojungFinal.schedule.model.vo.Schedule;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;

	/**
	 * 로그인
	 * 
	 * @param member
	 * @return Member
	 * @throws Exception
	 */
	@Override
	public Member loginMember(Member member) throws Exception {

		Member loginMember = adminDAO.selectMember(member);

		// 비밀번호 일치하는지 확인하는 방법
		// 입력한 비밀번호, DB에서 가져온 비밀번호
//		if(!bCryptPasswordEncoder.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
//			loginMember = null;
//		}

		return loginMember;
	}

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	/**
	 * 신규사원 등록
	 * 
	 * @param createMember
	 * @return result
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertMember(Member createMember) throws Exception {

		// 암호화된 비밀번호를 저장
		String encPwd = bCryptPasswordEncoder.encode("0000");
		// 이 순간에 salt가 일어나게 됨
		createMember.setMemberPwd(encPwd);
		// 다시 세팅 해준 후 DB로 가져갈 수 있게

		int result = adminDAO.insertMember(createMember);

		return result;
	}

	/**
	 * 이메일 중복 검사
	 * 
	 * @param memberId
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int emailDupCheck(String memberEmail) throws Exception {
		int result = adminDAO.emailDupCheck(memberEmail);
		return result;
	}

	/**
	 * 사원 목록 조회
	 * 
	 * @param map
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<AdminMemberView> selectMemberList(Map<String, String> map) throws Exception {
		return adminDAO.selectMemberList(map);
	}

	/**
	 * 사원 변경을 위한 내용 가져오기
	 * 
	 * @param no
	 * @return member
	 * @throws Exception
	 */
	@Override
	public Member detailAdminMember(int no) throws Exception {
		return adminDAO.detailAdminMember(no);
	}

	/**
	 * 공지사항 리스트 불러오기
	 * 
	 * @return noticeList
	 * @throws Exception
	 */
	@Override
	public List<Notice> selectNoticeList() throws Exception {
		return adminDAO.selectNoticeList();
	}

	/**관리자의 멤버 일부 변경 
	 * @param member
	 * @return
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateAdminMember(Member member) throws Exception {
		return adminDAO.updateAdminMember(member);
	}


	/**
	 * 메인화면 결재대기문서 리스트 불러오기
	 * 
	 * @param memberNo
	 * @return mainSignList
	 * @throws Exception
	 */
	@Override
	public List<SignTobeListView> selectMainSignList(int memberNo) throws Exception {
		return adminDAO.selectMainSignList(memberNo);
	}
	
	
	/**프로필 사진 조회
	 * @param memberNo
	 * @return profileImg
	 * @throws Exception
	 */
	@Override
	public ProfileImage selectProfileImage(int memberNo) throws Exception {
		return adminDAO.selectProfileImage(memberNo);
	}

	/** 최신 게시글 리스트 불러오기
	 * @param deptCode
	 * @return rList
	 * @throws Exception
	 */
	@Override
	public List<RecentBoard> selectRecentBoardList(String deptCode) throws Exception {
	
		RecentBoard rBoard = null;
		List<RecentBoard> rList = new ArrayList<RecentBoard>();
		
		// 1) 부서게시판 최신 글 4개 가져오기
		List<MainDeptBoard> dList = adminDAO.selectDeptList(deptCode);
		
		
		System.out.println(dList);
		
		// 2) 최신게시글 List에 각각의 값 대입하고 list에 넣기
		for(MainDeptBoard dBoard : dList) {
			rBoard = new RecentBoard();
			
			rBoard.setrBoardType(1);
			rBoard.setrBoardNo(dBoard.getBoardNo());
			rBoard.setrDeptName(dBoard.getDeptName());
			rBoard.setrBoardTitle(dBoard.getBoardTitle());
			rBoard.setrBoardCreateDate(dBoard.getCreateDate());
			rBoard.setrMemberName(dBoard.getMemberName());
			
			rList.add(rBoard);
		}
		
		
	
		// 2) 협동게시판 최신 글 4개 가져오기
		List<MainCollaboBoard> cList = adminDAO.selectCollaboList(deptCode);
		
		System.out.println(cList);
		
		for(MainCollaboBoard collaboBoard : cList) {
			rBoard = new RecentBoard();
			rBoard.setrBoardType(2);
			rBoard.setrBoardNo(collaboBoard.getBoardNo());
			rBoard.setrDeptName(collaboBoard.getDeptName());
			rBoard.setrBoardTitle(collaboBoard.getBoardTitle());
			rBoard.setrBoardCreateDate(collaboBoard.getCreateDate());
			rBoard.setrMemberName(collaboBoard.getMemberName());
			
			rList.add(rBoard);
		}
		
		System.out.println("모두 합친 것 ");
		for(RecentBoard r : rList) {
			System.out.println(r);
		}
		
		return rList;
	}

	/** 출근 버튼 클릭 시 근태관리 테이블에 데이터 삽입
	 * @param inTime
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertInTime(Attendance attendance) throws Exception {
		return adminDAO.insertInTime(attendance);
	}

	/** 당일 출근버튼을 눌렀는지 확인하기 위한 Service
	 * @param memberNo
	 * @return attendance
	 * @throws Exception
	 */
	@Override
	public Attendance checkAttendance(int memberNo) throws Exception {
		return adminDAO.checkAttendance(memberNo);
	}

	/**퇴근 버튼을 클릭했을 때 처리해주기 위한 Service
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateOutTime(int memberNo) throws Exception {
		return adminDAO.updateOutTime(memberNo);
	}

	/** 오늘 날짜와 회원 번호가 일치하는 Attendance 불러오기
	 * @param memberNo
	 * @return selectAttendance
	 * @throws Exception
	 */
	@Override
	public Attendance selectAttendance(int memberNo) throws Exception {
		return adminDAO.selectAttendance(memberNo);
	}

	/** inoutStatus 업데이트용 Service
	 * @param map
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateInoutStatus(Map<String, Integer> map) throws Exception {
		return adminDAO.updateInoutStatus(map);
	}

	@Override
	public List<Schedule> selectScheduleList(int memberNo) throws Exception {
		return adminDAO.selectScheduleList(memberNo);
	}
}
