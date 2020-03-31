package com.kh.ojungFinal.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.ojungFinal.member.model.vo.ProfileImage;
import com.kh.ojungFinal.member.model.vo.SignImage;
import com.kh.ojungFinal.admin.model.vo.Attendance;
import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.member.model.vo.MemberView;

public interface MemberService {

	
	
	/** 마이페이지 조회
	 * @param memberNo
	 * @return member
	 * @throws Exception
	 */
	public abstract MemberView selectMember(int memberNo) throws Exception;




	public abstract List<MemberView> selectSameDeptList(String deptCode) throws Exception;



	/** 같은 부서원 리스트 중사원 이름으로 정보 검색
	 * @param map
	 * @param deptCode
	 * @return
	 * @throws  
	 */
	public abstract List<MemberView> selectDeptList(Map<String, String> map) throws Exception;



	/** 사원정보 변경
	 * @param member
	 * @return
	 * @throws Exception
	 */
	public abstract int updateMember(Member loginMember, MultipartFile profile, ProfileImage profileImage, String savePath, String newPwd1) throws Exception;



	/** 사원 기본 이미지 유무 조회
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public abstract ProfileImage selectProfile(int memberNo) throws Exception;



	/** 프로필 사진 삽입
	 * @param profileImage
	 * @return
	 * @throws Exception
	 */
	public abstract int insertProfileImage(ProfileImage profileImage) throws Exception;


	

	/** 회원 도장 사진 유무조회
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public abstract SignImage selectSign(int memberNo) throws Exception;


	/** 해당 사원의 근태기록 조회용 Service
	 * @param memberNo
	 * @param pInf 
	 * @return aList
	 * @throws Exception
	 */
	public abstract List<Attendance> selectAttendanceList(int memberNo);




	/**게시글 수 조회용 Service
	 * @param memberNo
	 * @return listCount
	 * @throws Exception
	 */
	public abstract int getListCount(int memberNo);




	/** 근태기록 검색 리스트
	 * @param map
	 * @param memberNo
	 * @return aSearchList
	 */
	public abstract List<Attendance> attendanceSearchList(Map<String, Object> map);




	/** 도장 사진 삽입
	 * @param signImg
	 * @return
	 * @throws Exception
	 */
	public abstract int insertSignImage(SignImage signImg) throws Exception;




	/** 도장 이미지 변경
	 * @param loginMember
	 * @param sign
	 * @param signImg
	 * @param savePath
	 * @return
	 * @throws Exception
	 */
	public abstract int updateSign(Member loginMember, MultipartFile sign, SignImage signImage, String savePath) throws Exception;





	
}
