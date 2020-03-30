package com.kh.ojungFinal.admin.model.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository("adminDAO")  
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 로그인
	 * @param member
	 * @return loginMember
	 * @throws Exception
	 */
	public Member selectMember(Member member) throws Exception{
		return sqlSession.selectOne("adminMapper.loginMember", member);
	}

	/** 신규 사원 등록
	 * @param createMember
	 * @return result
	 * @throws Exception
	 */
	public int insertMember(Member createMember) throws Exception{
		return sqlSession.insert("adminMapper.insertMember",createMember);
	}

	/** 이메일 중복 체크
	 * @param memberEmail
	 * @return result
	 * @throws Exception
	 */
	public int emailDupCheck(String memberEmail) throws Exception{
		return sqlSession.selectOne("adminMapper.emailDupCheck", memberEmail);
	}

	public List<AdminMemberView> selectMemberList(Map<String, String> map) throws Exception{
		return sqlSession.selectList("adminMapper.selectMemberList", map);
	}

	public Member detailAdminMember(int no) throws Exception{
		return sqlSession.selectOne("adminMapper.detailAdminMember", no);
	}

	public List<Notice> selectNoticeList() throws Exception{
		return sqlSession.selectList("adminMapper.selectNoticeList");
	}

	public int updateAdminMember(Member member) throws Exception{
		return sqlSession.update("adminMapper.updateAdminMember", member);
	}

	public List<SignTobeListView> selectMainSignList(int memberNo) throws Exception{
		return sqlSession.selectList("adminMapper.selectMainSignList", memberNo);
	}

	public ProfileImage selectProfileImage(int memberNo) throws Exception{
		return sqlSession.selectOne("adminMapper.selectProfileImage",memberNo);
	}

	
	/** 부서게시판에서 최신 4개 가져오기
	 * @param deptCode
	 * @return dList
	 */
	public List<MainDeptBoard> selectDeptList(String deptCode) {
		return sqlSession.selectList("adminMapper.selectDeptList", deptCode);
	} 

	/** 협동게시판에서 최신 4개 가져오기
	 * @param deptCode
	 * @return cList
	 */
	public List<MainCollaboBoard> selectCollaboList(String deptCode) throws Exception{
		return sqlSession.selectList("adminMapper.selectCollaboList", deptCode);
	}

	/** 출근 버튼 클릭 시 근태 관리 테이블에 데이터 삽입
	 * @param inTime
	 * @return
	 * @throws Exception
	 */
	public int insertInTime(Attendance attendance) throws Exception{
		return sqlSession.insert("adminMapper.insertInTime", attendance);
	}

	/** 당일 출근버튼을 눌렀는지 확인하기 위한 Service
	 * @param memberNo
	 * @return attendance
	 * @throws Exception
	 */
	public Attendance checkAttendance(int memberNo) throws Exception{
		return sqlSession.selectOne("adminMapper.checkAttendance", memberNo);
	}


	/**퇴근 버튼을 클릭했을 때 처리해주기 위한 Service
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int updateOutTime(int memberNo) throws Exception{
		return sqlSession.update("adminMapper.updateOutTime", memberNo);
	}

	public Attendance selectAttendance(int memberNo) throws Exception{
		return sqlSession.selectOne("adminMapper.selectAttendance", memberNo);
	}

	public int updateInoutStatus(Map<String, Integer> map) throws Exception{
		return sqlSession.update("adminMapper.updateInoutStatus", map);
	}

	public List<Schedule> selectScheduleList(int memberNo) throws Exception {
		return sqlSession.selectList("adminMapper.selectScheduleList", memberNo);
	}
}
