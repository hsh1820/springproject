package com.kh.ojungFinal.elec.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.elec.model.vo.Sgn_doc;
import com.kh.ojungFinal.elec.model.vo.Sgn_docFile;
import com.kh.ojungFinal.elec.model.vo.Sgn_sign;
import com.kh.ojungFinal.elec.model.vo.SignListView;
import com.kh.ojungFinal.elec.model.vo.SignTobeListView;

@Repository("elecDAO")
public class ElecDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 소희(기안 올린 결재문서들의 전체 리스트 개수)
	public int getAllListCount(int memberNo) throws Exception {
		return sqlSession.selectOne("elecMapper.getAllListCount", memberNo);
	}

	// 소희(기안 올린 결재문서들의 전체 리스트)
	public List<SignListView> selectAllList(int memberNo, PageInfo pInf) throws Exception {

		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());

		return sqlSession.selectList("elecMapper.selectAllList", memberNo, rowBounds);
	}

	// 소희(기안자가 올린 결재 문서들 중 대기중인 문서 리스트 개수)
	public int getWaitListCount(int memberNo) {
		return sqlSession.selectOne("elecMapper.getWaitListCount", memberNo);
	}

	// 소희(기안자가 올린 결재 문서들 중 대기중인 문서 리스트)
	public List<SignListView> selectWaitList(int memberNo, PageInfo pInf) {

		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());

		return sqlSession.selectList("elecMapper.selectWaitList", memberNo, rowBounds);
	}

	// 희원 심사중 목록
	public int getProgressListCount(int memberNo) {
		return sqlSession.selectOne("elecMapper.getProgressListCount", memberNo);
	}

	// 희원 심사중 목록
	public List<SignListView> selectProgressList(PageInfo pInf, int memberNo) {
		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("elecMapper.selectProgressList", memberNo, rowBounds);
	}

	// 희원 반려 목록 수
	public int getCompletListCount(int memberNo) {
		return sqlSession.selectOne("elecMapper.getCompletListCount", memberNo);
	}

	// 희원 반려 목록
	public List<SignListView> selectCompletList(PageInfo pInf, int memberNo) {
		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("elecMapper.selectCompletList", memberNo, rowBounds);
	}

	// 희원 결재 완료 목록 수
	public int getRejectListCount(int memberNo) {
		return sqlSession.selectOne("elecMapper.getRejectListCount", memberNo);
	}

	// 희원 결재완료 목록
	public List<SignListView> selectRejectList(PageInfo pInf, int memberNo) {
		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("elecMapper.selectRejectList", memberNo, rowBounds);
	}

	// 결재자 전체 목록 수
	public int getPayerListCount(int memberNo) {
		return sqlSession.selectOne("elecMapper.getPayerListCount", memberNo);
	}

	// 결재자 전체 목록
	public List<SignTobeListView> selectPayerList(PageInfo pInf, int memberNo) {
		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("elecMapper.selectPayerList", memberNo, rowBounds);
	}

	// 소희 결재 해야 할 문서 목록 수
	public int getWaitTobeListCount(int memberNo) {
		return sqlSession.selectOne("elecMapper.getWaitTobeListCount", memberNo);
	}

	// 소희 결재 해야 할 문서 목록
	public List<SignTobeListView> selectWaitTobeList(PageInfo pInf, int memberNo) {
		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("elecMapper.selectWaitTobeList", memberNo, rowBounds);
	}
	
	
	// 기안서 작성 시작
	public int insertNightMeal(Sgn_doc sgnDoc) throws Exception {
		return sqlSession.insert("elecMapper.insertNightMeal", sgnDoc);
	}

	public int insertExpenseReport(Sgn_doc sgnDoc) throws Exception {
		return sqlSession.insert("elecMapper.insertExpenseReport", sgnDoc);
	}

	public int insertExpenditure(Sgn_doc sgnDoc) throws Exception {
		return sqlSession.insert("elecMapper.insertExpenditure", sgnDoc);
	}

	public int insertResignation(Sgn_doc sgnDoc) throws Exception {
		return sqlSession.insert("elecMapper.insertResignation", sgnDoc);
	}

	public int insertPhysicalExam(Sgn_doc sgnDoc) throws Exception {
		return sqlSession.insert("elecMapper.insertPhysicalExam", sgnDoc);
	}

	public int insertHolidayRequest(Sgn_doc sgnDoc) throws Exception {
		return sqlSession.insert("elecMapper.insertHolidayRequest", sgnDoc);
	}

	public int insertEvent(Sgn_doc sgnDoc) throws Exception {
		return sqlSession.insert("elecMapper.insertEvent", sgnDoc);
	}

	public int insertAbsentDoc(Sgn_doc sgnDoc) throws Exception {
		return sqlSession.insert("elecMapper.insertAbsentDoc", sgnDoc);
	}

	public int selectNextNo() throws Exception {
		return sqlSession.selectOne("elecMapper.selectNextNo");
	}

	/**
	 * 결재문서 첨부파일 삽입
	 * 
	 * @param df
	 * @return result
	 * @throws Exception
	 */
	public int insertSgnDocFile(Sgn_docFile files) throws Exception {
		return sqlSession.insert("elecMapper.insertSgnDocFile", files);
	}

	public List<Member> selectDepartment(Map<String, Object> map) {
		return sqlSession.selectList("elecMapper.selectDepartment", map);
	}

	public int selectNextSsNo() {
		return sqlSession.selectOne("elecMapper.selectNextSsNo");
	}

	public int insertNighMealSign(List<Sgn_sign> signList) {
		return sqlSession.insert("elecMapper.insertNighMealSign", signList);
	}

	public int insertExpenseReportSign(List<Sgn_sign> signList) {
		return sqlSession.insert("elecMapper.insertExpenseReportSign", signList);
	}

	public int insertExpenditureSign(List<Sgn_sign> signList) {
		return sqlSession.insert("elecMapper.insertExpenditureSign", signList);
	}

	public int insertResignationSign(List<Sgn_sign> signList) {
		return sqlSession.insert("elecMapper.insertResignationSign", signList);
	}

	public int insertPhysicalExamSign(List<Sgn_sign> signList) {
		return sqlSession.insert("elecMapper.insertPhysicalExamSign", signList);
	}

	public int insertHolidayRequestSign(List<Sgn_sign> signList) {
		return sqlSession.insert("elecMapper.insertHolidayRequestSign", signList);
	}

	public int insertEventSign(List<Sgn_sign> signList) {
		return sqlSession.insert("elecMapper.insertEventSign", signList);
	}

	public int insertAbsentDocSign(List<Sgn_sign> signList) {
		return sqlSession.insert("elecMapper.insertAbsentDocSign", signList);
	}
	
	// detail
	public List<Sgn_doc> selectDocList(Integer no) {
		return sqlSession.selectList("elecMapper.selectDocList", no);
	}
	
	public List<Sgn_docFile> selectFiles(Integer no) {
		return sqlSession.selectList("elecMapper.selectFile", no);
	}

	public int selectDocStatus(int no) throws Exception{
		return sqlSession.selectOne("elecMapper.selectDocStatus", no);
	}

	// step이 1인 사람의 결재
	public int firstSign(Map<String, String> map) throws Exception{
		System.out.println("serviceDAO 임");
		return sqlSession.update("elecMapper.firstSign", map);
	}

	// 1단계 사람이 끝나서 docStatus 단계 업
	public int updateStatus(int docNo) throws Exception{
		return sqlSession.update("elecMapper.updateStatus", docNo);
	}
	
	// 품의서 결재인데 docRemark, status update
	public int SignForExpenditureDoc(Map<String, String> map) throws Exception{
		return sqlSession.update("elecMapper.SignForExpenditureDoc", map);
	}
	
	// 결재가 총 몇단계인지 따져주기
	public int stepCount(int docNo) throws Exception{
		return sqlSession.selectOne("elecMapper.stepCount",docNo);
	}

	// 내가 몇단계인지 따져주기
	public int myStep(Map<String, String> map) throws Exception{
		return sqlSession.selectOne("elecMapper.myCount", map);
	}

	//docStatus=4
	public int completeSign(int docNo) throws Exception{
		return sqlSession.update("elecMapper.completeSign", docNo);
	}
	
	// 내가 중간단계일 때 status는 그대로 심사중으로 elecMapper납두고,docStep만 한단계 올려준다.
	public int midUpdateDocStep(int docNo) throws Exception{
		return sqlSession.update("elecMapper.midUpdateDocStep",docNo);
	}

	// 반려(SGN_SIGN 테이블에 넣기)
	public int rejectSignResult(Map<String, String> map) throws Exception {
		return sqlSession.update("elecMapper.rejectSignResult", map);
	}

	public int rejectSignDoc(Map<String, String> map) throws Exception {
		return sqlSession.update("elecMapper.rejectSignDoc", map);
	}

	public int selectDtNo(int docNo) throws Exception{
		return sqlSession.selectOne("elecMapper.selectDtNo",docNo);
	}
}
