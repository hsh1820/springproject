package com.kh.ojungFinal.member.model.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ojungFinal.member.model.vo.MemberView;
import com.kh.ojungFinal.member.model.vo.ProfileImage;
import com.kh.ojungFinal.member.model.vo.SignImage;
import com.kh.ojungFinal.member.model.dao.MemberDAO;
import com.kh.ojungFinal.admin.model.dao.AdminDAO;
import com.kh.ojungFinal.admin.model.vo.Attendance;
import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.common.FileRename;
import com.kh.ojungFinal.common.vo.PageInfo;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	 @Autowired 
	 private AdminDAO adminDAO;
	
	 @Autowired 
	 private BCryptPasswordEncoder bCryptPasswordEncoder;
	 
	
	
	// 마이페이지
	@Override
	public MemberView selectMember(int memberNo) throws Exception {
		MemberView selectMember = memberDAO.mypageMember(memberNo);
		
		return selectMember;
	}


	// 부서원 리스트 조회
	@Override
	public List<MemberView> selectSameDeptList(String deptCode) throws Exception {
		
		return memberDAO.selectSameDeptList(deptCode);
	}



	// 사원명으로 검색
	@Override
	public List<MemberView> selectDeptList(Map<String, String> map) throws Exception{
			
		return memberDAO.selectDeptList(map);
	}


	// 사원 이전 기본 이미지 유무 조회
	@Override
	public ProfileImage selectProfile(int memberNo) throws Exception {
		return memberDAO.selectProfile(memberNo);
	}
	

	// 프로필 사진 삽입
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertProfileImage(ProfileImage profileImage) throws Exception {
			
		return memberDAO.insertProfileImage(profileImage);

	}


	// 회원정보 수정용
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateMember(Member loginMember, MultipartFile profile, ProfileImage profileImage, String savePath, String newPwd1)
			throws Exception {

		// 기존  이미지 정보를 DB에서 조회
		ProfileImage image = memberDAO.selectProfile(loginMember.getMemberNo());
		
		ProfileImage beforePr = null;
		
		beforePr = image;
		
		// 기존 이미지 수정할 때
		ProfileImage updateImage = new ProfileImage(); 
				
		if(!newPwd1.equals("")) {
			String encPwd = bCryptPasswordEncoder.encode(newPwd1);
			loginMember.setMemberPwd(encPwd);
		}
		
			
		if(!profile.getOriginalFilename().equals("")) {	// 썸네일 신규 O
			// rename 작업 진행
			String changeFileName = FileRename.rename(profile.getOriginalFilename());
			
			// 프사 기존 O --> update 진행
			if(beforePr != null) {
				updateImage = new ProfileImage(beforePr.getImageNo(), profile.getOriginalFilename(), changeFileName);
			}
			
		} 
		
		int result = 0;

		if(!newPwd1.equals("")) {
			result = memberDAO.updateMember(loginMember);
		} else if(newPwd1.equals("")){
			result = memberDAO.updateMember2(loginMember);
		}
		
		// 수정할 프로필사진정보가 있는 경우
		if(result > 0 && updateImage != null) {
			
			
			result = memberDAO.updateProfileImage(updateImage);
			
			
			/*
			 * if(result == 0) { throw new Exception("이미지 삽입 과정에서 오류 발생"); }
			 */
			 
		}
		
		// DB수정이 정상적으로 처리된 경우 파일 저장
		if(result > 0) {

			profile.transferTo(new File(savePath + "/" + updateImage.getImageChangeName()));

		}
				
		if((image.getImageNo() == updateImage.getImageNo())) {
				
			File deleteImage = new File(savePath + "/" + image.getImageChangeName());
			
			deleteImage.delete();

		}
		
		return result;
	}


	/** 해당 사원의 근태기록 조회용 Service
	 * @param memberNo
	 * @return aList
	 * @throws Exception
	 */
	@Override
	public List<Attendance> selectAttendanceList(int memberNo){
		return memberDAO.selectAttendanceList(memberNo);
	}


	/**게시글 수 조회용 Service
	 * @param memberNo
	 * @return listCount
	 * @throws Exception
	 */
	@Override
	public int getListCount(int memberNo){
		return memberDAO.getListCount(memberNo);
	}


	/** 근태기록 검색 리스트
	 * @param map
	 * @param memberNo
	 * @return aSearchList
	 */
	@Override
	public List<Attendance> attendanceSearchList(Map<String, Object> map) {
		return memberDAO.attendanceSearchList(map);
	}

	
	// 사원 이전 도장 사진 유무 조회
	@Override
	public SignImage selectSign(int memberNo) throws Exception {
		return memberDAO.selectSign(memberNo);
	}
	

	// 도장 사진 삽입
	@Override
	public int insertSignImage(SignImage signImage) throws Exception {
		return memberDAO.insertSignImage(signImage);
	}


	// 도장 사진 변경
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateSign(Member loginMember, MultipartFile sign, SignImage signImage, String savePath) throws Exception {
		////////////////////////////////////////////////////////////////////////
		// 기존  이미지 정보를 DB에서 조회
		SignImage image = memberDAO.selectSign(loginMember.getMemberNo());
		
		SignImage beforeSi = null;
		
		beforeSi = image;
		
		// 기존 이미지 수정할 때
		SignImage updateImage = new SignImage(); 
		
		
		if(!sign.getOriginalFilename().equals("")) {	// 썸네일 신규 O
			// rename 작업 진행
			String changeSignName = FileRename.rename(sign.getOriginalFilename());
		
		
			// 썸네일 기존 O --> update 진행
			if(beforeSi != null) {
				updateImage = new SignImage(beforeSi.getSignNo(), sign.getOriginalFilename(), changeSignName);
			}
		}
				
		int result = 0;
		
		// 수정할 프로필사진정보가 있는 경우
		if(updateImage != null) {
		
			result = 0;
			
			result = memberDAO.updateSignImage(updateImage);
			
			if(result == 0) {
				throw new Exception("이미지 수정 과정에서 오류 발생");
			}
		}
		
		
		// DB수정이 정상적으로 처리된 경우 파일 저장
		if(result > 0) {
		
			sign.transferTo(new File(savePath + "/" + updateImage.getSignChangeName()));
		}
		

		
		if((image.getSignNo() == updateImage.getSignNo())) {
		
			File deleteImage = new File(savePath + "/" + image.getSignChangeName());
			
			deleteImage.delete();
		}
		
		return result;
	}

}



