package com.kh.ojungFinal.elec.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.elec.model.dao.ElecDAO;
import com.kh.ojungFinal.elec.model.vo.Sgn_doc;
import com.kh.ojungFinal.elec.model.vo.Sgn_docFile;
import com.kh.ojungFinal.elec.model.vo.Sgn_sign;
import com.kh.ojungFinal.elec.model.vo.SignListView;
import com.kh.ojungFinal.elec.model.vo.SignTobeListView;

@Service("elecService")
public class ElecServiceImpl implements ElecService {
	@Autowired
	private ElecDAO elecDAO;
	

	// 소희(기안 올린 결재문서들의 전체 리스트 개수)
	@Override
	public int getAllListCount(int memberNo) throws Exception{
		return elecDAO.getAllListCount(memberNo);
	}

	// 소희(기안 올린 결재문서들의 전체 리스트)
	@Override
	public List<SignListView> selectAllList(int memberNo, PageInfo pInf) throws Exception{
		return elecDAO.selectAllList(memberNo,pInf);
	}

	// 소희(기안자가 올린 결재 문서들 중 대기중인 문서 리스트 개수)
	@Override
	public int getWaitListCount(int memberNo) {
		return elecDAO.getWaitListCount(memberNo);
	}

	// 소희(기안자가 올린 결재 문서들 중 대기중인 문서 리스트)
	@Override
	public List<SignListView> selectWaitList(int memberNo, PageInfo pInf) {
		return elecDAO.selectWaitList(memberNo, pInf);
	}
	

	// 희원 심사중 목록 수
	@Override
	public int getProgressListCount(int memberNo) {
		return elecDAO.getProgressListCount(memberNo);
	}

	// 희원 심사중 목록
	@Override
	public List<SignListView> selectProgressList(PageInfo pInf, int memberNo) {
		return elecDAO.selectProgressList(pInf, memberNo);
	}

	// 희원 반려 목록 수
	@Override
	public int getCompletListCount(int memberNo) {
		return elecDAO.getCompletListCount(memberNo);
	}

	// 희원 반려 목록
	@Override
	public List<SignListView> selectCompletList(PageInfo pInf, int memberNo) {
		return elecDAO.selectCompletList(pInf, memberNo);
	}

	// 희원 결재 완료 목록 수
	@Override
	public int getRejectListCount(int memberNo) {
		return elecDAO.getRejectListCount(memberNo);
	}

	// 희원 결재 완료 목록
	@Override
	public List<SignListView> selectRejectList(PageInfo pInf, int memberNo) {
		return elecDAO.selectRejectList(pInf, memberNo);
	}
	
	// 희원 결재자 전체 목록 수 
		@Override
		public int getPayerListCount(int memberNo) {
			return elecDAO.getPayerListCount(memberNo);
		}

		// 희원 결재자 전체 목록 
		@Override
		public List<SignTobeListView> selectPayerList(PageInfo pInf, int memberNo) {
			return elecDAO.selectPayerList(pInf, memberNo);
		}

		// 소희 결재 해야 할 문서 목록 수
		@Override
		public int getWaitTobeListCount(int memberNo) {
			return elecDAO.getWaitTobeListCount(memberNo);
		}

		// 소희 결재 해야 할 문서 목록
		@Override
		public List<SignTobeListView> selectWaitTobeList(PageInfo pInf, int memberNo) {
			return elecDAO.selectWaitTobeList(pInf, memberNo);
		}

		
// 기안서 작성 시작		
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertNightMeal(int memberNo, String deptNm,  String docTitle, String docContents, String docSignPath,String docRemark, List<Sgn_docFile> files) throws Exception {
		
		int result = 0;
		
		int docNo = elecDAO.selectNextNo();
		//System.out.println("삽입된 결재문서 번호(SEQ_DOC)" + docNo);
		
		Sgn_doc sgnDoc = new Sgn_doc();
		
		sgnDoc.setDocNo(docNo);
		sgnDoc.setMemberNo(memberNo);
		sgnDoc.setDeptNm(deptNm);
		sgnDoc.setDocTitle(docTitle);
		sgnDoc.setDocContents(docContents);
		sgnDoc.setDocSignPath(docSignPath);
		sgnDoc.setDocRemark(docRemark);
		
		result = elecDAO.insertNightMeal(sgnDoc);
		
		if(result>0) {
			
			List<Sgn_sign> signList = null;
			Sgn_sign sign = null;
			
			//System.out.println("docSignPath확인 : " + docSignPath);
			String[] pathSplit = docSignPath.split(",\\|\\|");
			
			//System.out.println("pathSplit 첫번째 : " + pathSplit[0]);
			//System.out.println("pathSplit 첫번째 : " + pathSplit[1]);
			
			signList = new ArrayList<Sgn_sign>();
			
			for(int i=0;i<pathSplit.length;i++) {
				sign = new Sgn_sign();
				//System.out.println("잘렸냐 : " + pathSplit[i]);
				
				String[] eachPathSplit = pathSplit[i].split(":");
				
				int ssNo = elecDAO.selectNextSsNo();
				sign.setSsNo(ssNo);
				sign.setMemberNo(Integer.parseInt(eachPathSplit[0]));
				sign.setDocNo(docNo);
				sign.setsStep(i+1);
				sign.setSsType(eachPathSplit[4]);
				sign.setUserPos(eachPathSplit[3]);
				
				//System.out.println("sign값 보자" + sign);
				signList.add(sign);
				
			}
			//System.out.println("signList" + signList);
			result = elecDAO.insertNighMealSign(signList); // sgn_sign 삽입 
		}
		
		if(result>0 && !files.isEmpty()) {
			for (Sgn_docFile df : files) {

				df.setDocNo(docNo); // 게시글 번호 set 
				result = elecDAO.insertSgnDocFile(df);
				// 해당 게시글에 파일을 삽입하고
				if (result == 0) { 
					throw new Exception(); 
				}
			}
		}
		
		//System.out.println("SERVICE - FILES : " + files);
		//System.out.println("SERVICE - sgnDoc : " + sgnDoc);
		
		return result;
	}

	@Override
	public int insertExpenseReport(int memberNo, String deptNm,  String docTitle, String docContents,  String docSignPath,String docRemark,List<Sgn_docFile> files) throws Exception {
		
		int result = 0;
		
		int docNo = elecDAO.selectNextNo();
		//System.out.println("삽입된 결재문서 번호(SEQ_DOC)" + docNo);
		Sgn_doc sgnDoc = new Sgn_doc();
		
		sgnDoc.setDocNo(docNo);
		sgnDoc.setMemberNo(memberNo);
		sgnDoc.setDeptNm(deptNm);
		sgnDoc.setDocTitle(docTitle);
		sgnDoc.setDocContents(docContents);
		sgnDoc.setDocSignPath(docSignPath);
		sgnDoc.setDocRemark(docRemark);
		
		result = elecDAO.insertExpenseReport(sgnDoc);
		
		if(result>0) {
			
			List<Sgn_sign> signList = null;
			Sgn_sign sign = null;
			
			//System.out.println("docSignPath확인 : " + docSignPath);
			String[] pathSplit = docSignPath.split(",\\|\\|");
			
			//System.out.println("pathSplit 첫번째 : " + pathSplit[0]);
			
			signList = new ArrayList<Sgn_sign>();
			
			for(int i=0;i<pathSplit.length;i++) {
				sign = new Sgn_sign();
				System.out.println("잘렸냐 : " + pathSplit[i]);
				
				String[] eachPathSplit = pathSplit[i].split(":");
				/*
				 * System.out.println("eachPathSplit 0 : " + eachPathSplit[0]);
				 * System.out.println("eachPathSplit 1 : " +eachPathSplit[1]);
				 * System.out.println("eachPathSplit 2 : " +eachPathSplit[2]);
				 * System.out.println("eachPathSplit 3 : " +eachPathSplit[3]);
				 * System.out.println("eachPathSplit 4 : " +eachPathSplit[4]);
				 */
				
				int ssNo = elecDAO.selectNextSsNo();
				sign.setSsNo(ssNo);
				sign.setMemberNo(Integer.parseInt(eachPathSplit[0]));
				sign.setDocNo(docNo);
				sign.setsStep(i+1);
				sign.setSsType(eachPathSplit[4]);
				sign.setUserPos(eachPathSplit[3]);
				
				System.out.println("sign값 보자" + sign);
				signList.add(sign);
				
			}
			//System.out.println("signList" + signList);
			result = elecDAO.insertExpenseReportSign(signList); // sgn_sign 삽입 
		}
		
		if(result>0 && !files.isEmpty()) {
			for (Sgn_docFile df : files) {

				df.setDocNo(docNo); // 게시글 번호 set 
				result = elecDAO.insertSgnDocFile(df);
				// 해당 게시글에 파일을 삽입하고
				if (result == 0) { 
					throw new Exception(); 
				}
			}
		}
		
		//System.out.println("SERVICE - FILES : " + files);
		//System.out.println("SERVICE - sgnDoc : " + sgnDoc);
		
		return result;
	}

	@Override
	public int insertExpenditure(int memberNo, String deptNm,  String docTitle, String docContents,  String docSignPath, List<Sgn_docFile> files) throws Exception {
		
		int result = 0;
		
		int docNo = elecDAO.selectNextNo();
		//System.out.println("삽입된 결재문서 번호(SEQ_DOC)" + docNo);
		
		Sgn_doc sgnDoc = new Sgn_doc();
		
		sgnDoc.setDocNo(docNo);
		sgnDoc.setMemberNo(memberNo);
		sgnDoc.setDeptNm(deptNm);
		sgnDoc.setDocTitle(docTitle);
		sgnDoc.setDocContents(docContents);
		sgnDoc.setDocSignPath(docSignPath);
		
		result = elecDAO.insertExpenditure(sgnDoc);
		
		if(result>0) {
			
			List<Sgn_sign> signList = null;
			Sgn_sign sign = null;
			
			//System.out.println("docSignPath확인 : " + docSignPath);
			String[] pathSplit = docSignPath.split(",\\|\\|");
			
			//System.out.println("pathSplit 첫번째 : " + pathSplit[0]);
			//System.out.println("pathSplit 첫번째 : " + pathSplit[1]);
			
			signList = new ArrayList<Sgn_sign>();
			
			for(int i=0;i<pathSplit.length;i++) {
				sign = new Sgn_sign();
				//System.out.println("잘렸냐 : " + pathSplit[i]);
				
				String[] eachPathSplit = pathSplit[i].split(":");
				
				int ssNo = elecDAO.selectNextSsNo();
				sign.setSsNo(ssNo);
				sign.setMemberNo(Integer.parseInt(eachPathSplit[0]));
				sign.setDocNo(docNo);
				sign.setsStep(i+1);
				sign.setSsType(eachPathSplit[4]);
				sign.setUserPos(eachPathSplit[3]);
				
				//System.out.println("sign값 보자" + sign);
				signList.add(sign);
				
			}
			//System.out.println("signList" + signList);
			result = elecDAO.insertExpenditureSign(signList); // sgn_sign 삽입 
		}
		
		if(result>0 && !files.isEmpty()) {
			for (Sgn_docFile df : files) {

				df.setDocNo(docNo); // 게시글 번호 set 
				result = elecDAO.insertSgnDocFile(df);
				// 해당 게시글에 파일을 삽입하고
				if (result == 0) { 
					throw new Exception(); 
				}
			}
		}
		
		//System.out.println("SERVICE - FILES : " + files);
		//System.out.println("SERVICE - sgnDoc : " + sgnDoc);
		
		return result;
	}

	@Override
	public int insertResignation(int memberNo, String deptNm,  String docTitle, String docContents,  String docSignPath,String docRemark, List<Sgn_docFile> files) throws Exception {
		
		int result = 0;
		
		int docNo = elecDAO.selectNextNo();
		//System.out.println("삽입된 결재문서 번호(SEQ_DOC)" + docNo);
		
		Sgn_doc sgnDoc = new Sgn_doc();
		
		sgnDoc.setDocNo(docNo);
		sgnDoc.setMemberNo(memberNo);
		sgnDoc.setDeptNm(deptNm);
		sgnDoc.setDocTitle(docTitle);
		sgnDoc.setDocContents(docContents);
		sgnDoc.setDocSignPath(docSignPath);
		sgnDoc.setDocRemark(docRemark);
		
		result = elecDAO.insertResignation(sgnDoc);
		
		if(result>0) {
			
			List<Sgn_sign> signList = null;
			Sgn_sign sign = null;
			
			//System.out.println("docSignPath확인 : " + docSignPath);
			String[] pathSplit = docSignPath.split(",\\|\\|");
			
			//System.out.println("pathSplit 첫번째 : " + pathSplit[0]);
			//System.out.println("pathSplit 첫번째 : " + pathSplit[1]);
			
			signList = new ArrayList<Sgn_sign>();
			
			for(int i=0;i<pathSplit.length;i++) {
				sign = new Sgn_sign();
				//System.out.println("잘렸냐 : " + pathSplit[i]);
				
				String[] eachPathSplit = pathSplit[i].split(":");
				
				int ssNo = elecDAO.selectNextSsNo();
				sign.setSsNo(ssNo);
				sign.setMemberNo(Integer.parseInt(eachPathSplit[0]));
				sign.setDocNo(docNo);
				sign.setsStep(i+1);
				sign.setSsType(eachPathSplit[4]);
				sign.setUserPos(eachPathSplit[3]);
				
				//System.out.println("sign값 보자" + sign);
				signList.add(sign);
				
			}
			//System.out.println("signList" + signList);
			result = elecDAO.insertResignationSign(signList); // sgn_sign 삽입 
		}
		
		if(result>0 && !files.isEmpty()) {
			for (Sgn_docFile df : files) {

				df.setDocNo(docNo); // 게시글 번호 set 
				result = elecDAO.insertSgnDocFile(df);
				// 해당 게시글에 파일을 삽입하고
				if (result == 0) { 
					throw new Exception(); 
				}
			}
		}
		
		//System.out.println("SERVICE - FILES : " + files);
		//System.out.println("SERVICE - sgnDoc : " + sgnDoc);
		
		return result;
	}

	@Override
	public int insertPhysicalExam(int memberNo, String deptNm,  String docTitle, String docContents, String docSignPath,String docRemark, List<Sgn_docFile> files) throws Exception {
		
		int result = 0;
		
		int docNo = elecDAO.selectNextNo();
		//System.out.println("삽입된 결재문서 번호(SEQ_DOC)" + docNo);
		
		Sgn_doc sgnDoc = new Sgn_doc();
		
		sgnDoc.setDocNo(docNo);
		sgnDoc.setMemberNo(memberNo);
		sgnDoc.setDeptNm(deptNm);
		sgnDoc.setDocTitle(docTitle);
		sgnDoc.setDocContents(docContents);
		sgnDoc.setDocSignPath(docSignPath);
		sgnDoc.setDocRemark(docRemark);
		
		result = elecDAO.insertPhysicalExam(sgnDoc);
		
		if(result>0) {
			
			List<Sgn_sign> signList = null;
			Sgn_sign sign = null;
			
			//System.out.println("docSignPath확인 : " + docSignPath);
			String[] pathSplit = docSignPath.split(",\\|\\|");
			
			//System.out.println("pathSplit 첫번째 : " + pathSplit[0]);
			//System.out.println("pathSplit 첫번째 : " + pathSplit[1]);
			
			signList = new ArrayList<Sgn_sign>();
			
			for(int i=0;i<pathSplit.length;i++) {
				sign = new Sgn_sign();
				//System.out.println("잘렸냐 : " + pathSplit[i]);
				
				String[] eachPathSplit = pathSplit[i].split(":");
				
				int ssNo = elecDAO.selectNextSsNo();
				sign.setSsNo(ssNo);
				sign.setMemberNo(Integer.parseInt(eachPathSplit[0]));
				sign.setDocNo(docNo);
				sign.setsStep(i+1);
				sign.setSsType(eachPathSplit[4]);
				sign.setUserPos(eachPathSplit[3]);
				
				//System.out.println("sign값 보자" + sign);
				signList.add(sign);
				
			}
			//System.out.println("signList" + signList);
			result = elecDAO.insertPhysicalExamSign(signList); // sgn_sign 삽입 
		}
		
		if(result>0 && !files.isEmpty()) {
			for (Sgn_docFile df : files) {

				df.setDocNo(docNo); // 게시글 번호 set 
				result = elecDAO.insertSgnDocFile(df);
				// 해당 게시글에 파일을 삽입하고
				if (result == 0) { 
					throw new Exception(); 
				}
			}
		}
		
		//System.out.println("SERVICE - FILES : " + files);
		//System.out.println("SERVICE - sgnDoc : " + sgnDoc);
		
		return result;
	}

	@Override
	public int insertHolidayRequest(int memberNo, String deptNm,  String docTitle, String docContents, String docSignPath,String docRemark, List<Sgn_docFile> files) throws Exception {
		
		int result = 0;
		
		int docNo = elecDAO.selectNextNo();
		//System.out.println("삽입된 결재문서 번호(SEQ_DOC)" + docNo);
		
		Sgn_doc sgnDoc = new Sgn_doc();
		
		sgnDoc.setDocNo(docNo);
		sgnDoc.setMemberNo(memberNo);
		sgnDoc.setDeptNm(deptNm);
		sgnDoc.setDocTitle(docTitle);
		sgnDoc.setDocContents(docContents);
		sgnDoc.setDocSignPath(docSignPath);
		sgnDoc.setDocRemark(docRemark);
		
		result = elecDAO.insertHolidayRequest(sgnDoc);
		
		if(result>0) {
			
			List<Sgn_sign> signList = null;
			Sgn_sign sign = null;
			
			//System.out.println("docSignPath확인 : " + docSignPath);
			String[] pathSplit = docSignPath.split(",\\|\\|");
			
			//System.out.println("pathSplit 첫번째 : " + pathSplit[0]);
			//System.out.println("pathSplit 첫번째 : " + pathSplit[1]);
			
			signList = new ArrayList<Sgn_sign>();
			
			for(int i=0;i<pathSplit.length;i++) {
				sign = new Sgn_sign();
				//System.out.println("잘렸냐 : " + pathSplit[i]);
				
				String[] eachPathSplit = pathSplit[i].split(":");
				
				int ssNo = elecDAO.selectNextSsNo();
				sign.setSsNo(ssNo);
				sign.setMemberNo(Integer.parseInt(eachPathSplit[0]));
				sign.setDocNo(docNo);
				sign.setsStep(i+1);
				sign.setSsType(eachPathSplit[4]);
				sign.setUserPos(eachPathSplit[3]);
				
				//System.out.println("sign값 보자" + sign);
				signList.add(sign);
				
			}
			//System.out.println("signList" + signList);
			result = elecDAO.insertHolidayRequestSign(signList); // sgn_sign 삽입 
		}
		
		if(result>0 && !files.isEmpty()) {
			for (Sgn_docFile df : files) {

				df.setDocNo(docNo); // 게시글 번호 set 
				result = elecDAO.insertSgnDocFile(df);
				// 해당 게시글에 파일을 삽입하고
				if (result == 0) { 
					throw new Exception(); 
				}
			}
		}
		
		//System.out.println("SERVICE - FILES : " + files);
		//System.out.println("SERVICE - sgnDoc : " + sgnDoc);
		
		return result;
	}

	@Override
	public int insertEvent(int memberNo, String deptNm,  String docTitle, String docContents, String docSignPath,String docRemark, List<Sgn_docFile> files) throws Exception {
		
		int result = 0;
		
		int docNo = elecDAO.selectNextNo();
		//System.out.println("삽입된 결재문서 번호(SEQ_DOC)" + docNo);
		
		Sgn_doc sgnDoc = new Sgn_doc();
		
		sgnDoc.setDocNo(docNo);
		sgnDoc.setMemberNo(memberNo);
		sgnDoc.setDeptNm(deptNm);
		sgnDoc.setDocTitle(docTitle);
		sgnDoc.setDocContents(docContents);
		sgnDoc.setDocSignPath(docSignPath);
		sgnDoc.setDocRemark(docRemark);
		
		result = elecDAO.insertEvent(sgnDoc);
		
		if(result>0) {
			
			List<Sgn_sign> signList = null;
			Sgn_sign sign = null;
			
			//System.out.println("docSignPath확인 : " + docSignPath);
			String[] pathSplit = docSignPath.split(",\\|\\|");
			
			//System.out.println("pathSplit 첫번째 : " + pathSplit[0]);
			//System.out.println("pathSplit 첫번째 : " + pathSplit[1]);
			
			signList = new ArrayList<Sgn_sign>();
			
			for(int i=0;i<pathSplit.length;i++) {
				sign = new Sgn_sign();
				//System.out.println("잘렸냐 : " + pathSplit[i]);
				
				String[] eachPathSplit = pathSplit[i].split(":");
				
				int ssNo = elecDAO.selectNextSsNo();
				sign.setSsNo(ssNo);
				sign.setMemberNo(Integer.parseInt(eachPathSplit[0]));
				sign.setDocNo(docNo);
				sign.setsStep(i+1);
				sign.setSsType(eachPathSplit[4]);
				sign.setUserPos(eachPathSplit[3]);
				
				//System.out.println("sign값 보자" + sign);
				signList.add(sign);
				
			}
			//System.out.println("signList" + signList);
			result = elecDAO.insertEventSign(signList); // sgn_sign 삽입 
		}
		
		if(result>0 && !files.isEmpty()) {
			for (Sgn_docFile df : files) {

				df.setDocNo(docNo); // 게시글 번호 set 
				result = elecDAO.insertSgnDocFile(df);
				// 해당 게시글에 파일을 삽입하고
				if (result == 0) { 
					throw new Exception(); 
				}
			}
		}
		
		//System.out.println("SERVICE - FILES : " + files);
		//System.out.println("SERVICE - sgnDoc : " + sgnDoc);
		
		return result;
	}

	@Override
	public int insertAbsentDoc(int memberNo, String deptNm,  String docTitle, String docContents,  String docSignPath, String docRemark, List<Sgn_docFile> files) throws Exception {
		
		int result = 0;
		
		int docNo = elecDAO.selectNextNo();
		//System.out.println("삽입된 결재문서 번호(SEQ_DOC)" + docNo);
		
		Sgn_doc sgnDoc = new Sgn_doc();
		
		sgnDoc.setDocNo(docNo);
		sgnDoc.setMemberNo(memberNo);
		sgnDoc.setDeptNm(deptNm);
		sgnDoc.setDocTitle(docTitle);
		sgnDoc.setDocContents(docContents);
		sgnDoc.setDocSignPath(docSignPath);
		sgnDoc.setDocRemark(docRemark);
		
		result = elecDAO.insertAbsentDoc(sgnDoc);
		
		if(result>0) {
			
			List<Sgn_sign> signList = null;
			Sgn_sign sign = null;
			
			//System.out.println("docSignPath확인 : " + docSignPath);
			String[] pathSplit = docSignPath.split(",\\|\\|");
			
			//System.out.println("pathSplit 첫번째 : " + pathSplit[0]);
			//System.out.println("pathSplit 첫번째 : " + pathSplit[1]);
			
			signList = new ArrayList<Sgn_sign>();
			
			for(int i=0;i<pathSplit.length;i++) {
				sign = new Sgn_sign();
				//System.out.println("잘렸냐 : " + pathSplit[i]);
				
				String[] eachPathSplit = pathSplit[i].split(":");
				
				int ssNo = elecDAO.selectNextSsNo();
				sign.setSsNo(ssNo);
				sign.setMemberNo(Integer.parseInt(eachPathSplit[0]));
				sign.setDocNo(docNo);
				sign.setsStep(i+1);
				sign.setSsType(eachPathSplit[4]);
				sign.setUserPos(eachPathSplit[3]);
				
				//System.out.println("sign값 보자" + sign);
				signList.add(sign);
				
			}
			//System.out.println("signList" + signList);
			result = elecDAO.insertAbsentDocSign(signList); // sgn_sign 삽입 
		}
		
		if(result>0 && !files.isEmpty()) {
			for (Sgn_docFile df : files) {

				df.setDocNo(docNo); // 게시글 번호 set 
				result = elecDAO.insertSgnDocFile(df);
				// 해당 게시글에 파일을 삽입하고
				if (result == 0) { 
					throw new Exception(); 
				}
			}
		}
		
		//System.out.println("SERVICE - FILES : " + files);
		//System.out.println("SERVICE - sgnDoc : " + sgnDoc);
		
		return result;
	}
	
   @Override
   public List<Member> selectDepartment(Map<String, Object> map) throws Exception {
      return elecDAO.selectDepartment(map);
   }

   
   // detail
   @Override
   public List<Sgn_doc> selectDocList(Integer no) {
      return elecDAO.selectDocList(no);
   }

   // 파일 가져오기
   @Override
   public List<Sgn_docFile> selectFiles(Integer no){
      return elecDAO.selectFiles(no);
   }

	// 결재하기
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateSign(Map<String, String> map) throws Exception {
		System.out.println("serviceImpl 임");
		int result = 0;
		int docNo = Integer.parseInt(map.get("no"));

		int docStatus = elecDAO.selectDocStatus(docNo);
		System.out.println("docStatus : " + docStatus);

		if (docStatus == 1) { // 대기중일 경우 나는 step 1번임 그래서 sign 결과값을 넣어주면 됨

			// signDate, ssResult,docStep
			int stepCount = elecDAO.stepCount(docNo);
			int myStep = elecDAO.myStep(map);
			
			if (myStep < stepCount) {
				
				result = elecDAO.firstSign(map); // SGN_SIGN에 값넣기
				
				if (result > 0) {
					result = elecDAO.updateStatus(docNo); // 심사중으로 바꿔주는 것, DOCSTEP 올리기
					System.out.println("serviceImpl 임2");
				}
			}else { // 내가 처음이면서 마지막 단계 일 때
				if (Integer.parseInt(map.get("dtNo")) != 3) {

					result = elecDAO.firstSign(map); // SGN_SIGN에 값넣기

					if (result > 0) {
						result = elecDAO.completeSign(docNo); // docStatus를 4로 바꾸기 위한 것
					}
				} else {
					// dtNo == 3일 때 
					result = elecDAO.firstSign(map);

					if (result > 0) {
						result = elecDAO.SignForExpenditureDoc(map);
					}

				}
				
			}


		} else {// 내가 처음이 아닌 경우, 첫결재가 아닌 경우

			int stepCount = elecDAO.stepCount(docNo);
			int myStep = elecDAO.myStep(map);
			// DOCSTEP처리 해줘야함 까먹음 MYSTEP+1
			// 내가 중간단계일때 마지막일때
			if (myStep < stepCount) { // 나의 결재 단계가 중간일 때

				result = elecDAO.firstSign(map); // SGN_SIGN에 값넣기
				if (result > 0) {
					result = elecDAO.midUpdateDocStep(docNo);
				}
			} else { // 내가 마지막 단계인 경우

				if (Integer.parseInt(map.get("dtNo")) != 3) {

					result = elecDAO.firstSign(map); // SGN_SIGN에 값넣기

					if (result > 0) {
						result = elecDAO.completeSign(docNo); // docStatus를 4로 바꾸기 위한 것
					}
				} else {
					// dtNo == 3일 때
					result = elecDAO.firstSign(map);

					if (result > 0) {
						result = elecDAO.SignForExpenditureDoc(map);
					}

				}
			}
		}
		return result;
	}

	// 품의서 화면 때문에 step 카운트 해줌
	@Override
	public int stepCount(int docNo) throws Exception{
		return elecDAO.stepCount(docNo);
	}

	// 반려
	@Override
	public int rejectSign(Map<String, String> map) throws Exception {
		int result = 0;
		
		// SGN_SIGN 먼저 데이터 넣기
		result = elecDAO.rejectSignResult(map);
		
		// SGN_DOC에 DOCSTATUS=3으로 변경
		if(result>0) {
			result = elecDAO.rejectSignDoc(map);
		}
		
		return result;
	}

	// pdf 전환을 위한 dtNo 가져오기
	@Override
	public int selectDtNo(int docNo) throws Exception{
		return elecDAO.selectDtNo(docNo);
	}
   
}
