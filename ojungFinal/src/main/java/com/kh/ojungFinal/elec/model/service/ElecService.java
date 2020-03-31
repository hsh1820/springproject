package com.kh.ojungFinal.elec.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.elec.model.vo.Sgn_doc;
import com.kh.ojungFinal.elec.model.vo.Sgn_docFile;
import com.kh.ojungFinal.elec.model.vo.SignListView;
import com.kh.ojungFinal.elec.model.vo.SignTobeListView;

public interface ElecService {
	
	// 소희(기안 올린 결재문서들의 전체 리스트 개수)
	public abstract int getAllListCount(int memberNo) throws Exception;
	
	// 소희(기안 올린 결재문서들의 전체 리스트)
	public abstract List<SignListView> selectAllList(int memberNo, PageInfo pInf) throws Exception;

	// 소희(기안자가 올린 결재 문서들 중 대기중인 문서 리스트 개수)
	public abstract int getWaitListCount(int memberNo);

	// 소희(기안자가 올린 결재 문서들 중 대기중인 문서 리스트)
	public abstract List<SignListView> selectWaitList(int memberNo, PageInfo pInf);

	// 희원 심사중 목록 수
	public abstract int getProgressListCount(int memberNo);

	// 희원 심사중 목록
	public abstract List<SignListView> selectProgressList(PageInfo pInf, int memberNo);
	
	// 희원 반려 목록 수
	public abstract int getCompletListCount(int memberNo);

	// 희원 반려 목록
	public abstract List<SignListView> selectCompletList(PageInfo pInf, int memberNo);

	// 희원 결재 완료 목록 수
	public abstract int getRejectListCount(int memberNo);

	// 희원 결재 완료 목록
	public abstract List<SignListView> selectRejectList(PageInfo pInf, int memberNo);
	
	// 희원 결재자 전체 목록 수
	public abstract int getPayerListCount(int memberNo);
	
	// 희원 결재자 전체 목록
	public abstract List<SignTobeListView> selectPayerList(PageInfo pInf, int memberNo);
	
	// 소희 결재 해야 할 문서 목록 수
	public abstract int getWaitTobeListCount(int memberNo);

	// 소희 결재 해야 할 문서 목록
	public abstract List<SignTobeListView> selectWaitTobeList(PageInfo pInf, int memberNo);


	int insertNightMeal(int memberNo, String deptNm, String docTitle, String docContents, String docSignPath, String docRemark,  List<Sgn_docFile> files) throws Exception;

	int insertExpenseReport(int memberNo, String deptNm, String docTitle, String docContents, String docSignPath, String docRemark, List<Sgn_docFile> files) throws Exception;

	int insertExpenditure(int memberNo, String deptNm, String docTitle, String docContents, String docSignPath,   List<Sgn_docFile> files) throws Exception;

	int insertResignation(int memberNo, String deptNm, String docTitle, String docContents, String docSignPath, String docRemark,  List<Sgn_docFile> files) throws Exception;

	int insertPhysicalExam(int memberNo, String deptNm, String docTitle, String docContents, String docSignPath, String docRemark,  List<Sgn_docFile> files) throws Exception;

	int insertHolidayRequest(int memberNo, String deptNm, String docTitle, String docContents, String docSignPath, String docRemark,  List<Sgn_docFile> files) throws Exception;

	int insertEvent(int memberNo, String deptNm, String docTitle, String docContents, String docSignPath, String docRemark,  List<Sgn_docFile> files) throws Exception;

	int insertAbsentDoc(int memberNo, String deptNm, String docTitle, String docContents, String docSignPath, String docRemark,  List<Sgn_docFile> files) throws Exception;
	
	List<Member> selectDepartment(Map<String, Object> map) throws Exception;

	// detail 화면 넘기기
	public abstract List<Sgn_doc> selectDocList(Integer no) throws Exception;
	
	public abstract List<Sgn_docFile> selectFiles(Integer no);

	// 결재하기
	public abstract int updateSign(Map<String, String> map) throws Exception;

	// 품의서 화면 때문에 step 카운트 해줌
	public abstract int stepCount(int docNo) throws Exception;

	// 반려
	public abstract int rejectSign(Map<String, String> map) throws Exception;

	// pdf 전환을 위한 dtNo 가져오기
	public abstract int selectDtNo(int docNo) throws Exception;
}
