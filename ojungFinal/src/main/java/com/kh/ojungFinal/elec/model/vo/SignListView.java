package com.kh.ojungFinal.elec.model.vo;

import java.sql.Date;

public class SignListView {
	private int docNo;
	private int drafter; // 기안자 
	private String docTitle;
	private Date insertDate;
	private String deleteFlag;
	private int dtNo; // 문서 타입 번호
	private String dTitle; // 문서 타입 이름(지출결의서t, 품의서 등)
	private int memberNo;
	private String memberName; // 결재자
	private String docStatus; // 문서상태(대기중, 심사중, 결재완료, 반려)
	private Date signDate; // 사인한 날짜
	
	public SignListView() {
		// TODO Auto-generated constructor stub
	}

	public SignListView(int docNo, int drafter, String docTitle, Date insertDate, String deleteFlag, int dtNo,
			String dTitle, int memberNo, String memberName, String docStatus, Date signDate) {
		super();
		this.docNo = docNo;
		this.drafter = drafter;
		this.docTitle = docTitle;
		this.insertDate = insertDate;
		this.deleteFlag = deleteFlag;
		this.dtNo = dtNo;
		this.dTitle = dTitle;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.docStatus = docStatus;
		this.signDate = signDate;
	}

	public int getDocNo() {
		return docNo;
	}

	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}

	public int getDrafter() {
		return drafter;
	}

	public void setDrafter(int drafter) {
		this.drafter = drafter;
	}

	public String getDocTitle() {
		return docTitle;
	}

	public void setDocTitle(String docTitle) {
		this.docTitle = docTitle;
	}

	public Date getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}

	public String getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public int getDtNo() {
		return dtNo;
	}

	public void setDtNo(int dtNo) {
		this.dtNo = dtNo;
	}

	public String getdTitle() {
		return dTitle;
	}

	public void setdTitle(String dTitle) {
		this.dTitle = dTitle;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getDocStatus() {
		return docStatus;
	}

	public void setDocStatus(String docStatus) {
		this.docStatus = docStatus;
	}

	public Date getSignDate() {
		return signDate;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

	@Override
	public String toString() {
		return "SignListView [docNo=" + docNo + ", drafter=" + drafter + ", docTitle=" + docTitle + ", insertDate="
				+ insertDate + ", deleteFlag=" + deleteFlag + ", dtNo=" + dtNo + ", dTitle=" + dTitle + ", memberNo="
				+ memberNo + ", memberName=" + memberName + ", docStatus=" + docStatus + ", signDate=" + signDate + "]";
	}

	
	
	
}
