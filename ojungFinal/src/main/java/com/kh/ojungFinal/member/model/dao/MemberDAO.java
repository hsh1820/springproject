package com.kh.ojungFinal.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ojungFinal.member.model.vo.ProfileImage;
import com.kh.ojungFinal.member.model.vo.SignImage;
import com.kh.ojungFinal.admin.model.vo.Attendance;
import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.member.model.vo.MemberView;

@Repository("memberDAO")
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	/** 마이페이지 조회 DAO
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public MemberView mypageMember(int memberNo) throws Exception{
		return sqlSession.selectOne("memberMapper.mypageMember", memberNo);
	}
	

	/** 부서원 리스트 DAO
	 * @param deptCode
	 * @return
	 * @throws Exception
	 */
	public List<MemberView> selectSameDeptList(String deptCode) throws Exception{
		return sqlSession.selectList("memberMapper.selectSameDeptList", deptCode);
	}

	
	/** 사원명으로 부서원 검색 DAO
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<MemberView> selectDeptList(Map<String, String> map) throws Exception{
		
		return sqlSession.selectList("memberMapper.selectDeptList", map);
	}
 
	/** 사원정보 업데이트 DAO
	 * @param loginMember
	 * @return
	 * @throws Exception
	 */
	public int updateMember(Member loginMember) throws Exception{
		
		return sqlSession.update("memberMapper.updateMember", loginMember);
	}
	
	

	/** 사원정보 업데이트DAO(비밀번호 제외)
	 * @param loginMember
	 * @return
	 */
	public int updateMember2(Member loginMember) {
		return sqlSession.update("memberMapper.updateMember2", loginMember);
	}

	
	

	/** 이미지 조회용 DAO
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public ProfileImage selectProfile(int memberNo) throws Exception{
		
		return sqlSession.selectOne("memberMapper.selectProfile", memberNo);
	}
	
	
	/** 이미지 삽입용 DAO
	 * @param profileImage
	 * @return
	 * @throws Exception
	 */
	public int insertProfileImage(ProfileImage profileImage) throws Exception{
		return sqlSession.insert("memberMapper.insertProfileImage", profileImage);
	}
	

	/** 이미지 수정용 DAO
	 * @param profileImage
	 * @return
	 * @throws Exception
	 */
	public int updateProfileImage(ProfileImage profileImage) throws Exception{
		return sqlSession.update("memberMapper.updateProfileImage", profileImage);
	}


	/**근태관리 게시글 조회
	 * @param memberNo
	 * @param pInf
	 * @return
	 */
	public List<Attendance> selectAttendanceList(int memberNo){
		return sqlSession.selectList("memberMapper.selectAttendanceList", memberNo);
	}


	/**근태관리 게시글 수 조회
	 * @param memberNo
	 * @return
	 */
	public int getListCount(int memberNo){
		return sqlSession.selectOne("memberMapper.getListCount", memberNo);
	}


	/** 근태관리 리스트 검색 
	 * @param map
	 * @return
	 */
	public List<Attendance> attendanceSearchList(Map<String, Object> map) {
		return sqlSession.selectList("memberMapper.attendanceSearchList", map);
	}


	/** inoutStatus 업데이트용 DAO
	 * @param memberNo
	 * @param inoutStatus
	 * @return result
	 * @throws Exception
	 */
	public int updateInoutStatus(Map<String, Integer> map) throws Exception{
		return sqlSession.update("memberMapper.updateInoutStatus", map);
	}

	
	/** 도장 이미지 조회용 DAO
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public SignImage selectSign(int memberNo) throws Exception{
		return sqlSession.selectOne("memberMapper.selectSign", memberNo);
	}
	

	/** 도장 이미지 삽입용 DAO
	 * @param signImg
	 * @return
	 * @throws Exception
	 */
	public int insertSignImage(SignImage signImage) throws Exception{
		return sqlSession.insert("memberMapper.insertSignImage", signImage);
	}


	/** 도장 이미지 변경용 DAO
	 * @param updateSign
	 * @return
	 * @throws Exception
	 */
	public int updateSignImage(SignImage updateSign) throws Exception{
		return sqlSession.update("memberMapper.updateSignImage", updateSign);
	}






}
