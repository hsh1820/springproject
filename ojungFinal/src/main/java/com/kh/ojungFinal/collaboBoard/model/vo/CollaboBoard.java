package com.kh.ojungFinal.collaboBoard.model.vo;

import java.sql.Date;

public class CollaboBoard {
	private int collaboNo;
	private String collaboTitle;
	private String collaboContent;
	private String collaboCreateDate;
	private String collaboUpdateDate;
	private int collaboCount;
	private String collaboDept;
	private Date collaboStartDate;
	private Date collaboEndDate;
	private String collaboDeleteYn;
	private int collaboStatus;
	private int memberNo;
	private int taskAccepter;
	private int cmmtCount;
	
    //  COLLABO_LIST_VIEW 에서 추가된 필드
	private String memberName;
	private String taskAccepterName;
	private String wirterDeptName;
	private String collaboStatusTitle;
	private String writerJobName;
	private String writerDeptCode;
	private String memberEmail;
	
	public CollaboBoard() {
		// TODO Auto-generated constructor stub
	}


	public CollaboBoard(int collaboNo, String collaboTitle, String collaboContent, String collaboCreateDate,
			String collaboUpdateDate, int collaboCount, String collaboDept, Date collaboStartDate, Date collaboEndDate,
			String collaboDeleteYn, int collaboStatus, int memberNo, int taskAccepter, int cmmtCount, String memberName,
			String taskAccepterName, String wirterDeptName, String collaboStatusTitle, String writerJobName,
			String writerDeptCode, String memberEmail) {
		super();
		this.collaboNo = collaboNo;
		this.collaboTitle = collaboTitle;
		this.collaboContent = collaboContent;
		this.collaboCreateDate = collaboCreateDate;
		this.collaboUpdateDate = collaboUpdateDate;
		this.collaboCount = collaboCount;
		this.collaboDept = collaboDept;
		this.collaboStartDate = collaboStartDate;
		this.collaboEndDate = collaboEndDate;
		this.collaboDeleteYn = collaboDeleteYn;
		this.collaboStatus = collaboStatus;
		this.memberNo = memberNo;
		this.taskAccepter = taskAccepter;
		this.cmmtCount = cmmtCount;
		this.memberName = memberName;
		this.taskAccepterName = taskAccepterName;
		this.wirterDeptName = wirterDeptName;
		this.collaboStatusTitle = collaboStatusTitle;
		this.writerJobName = writerJobName;
		this.writerDeptCode = writerDeptCode;
		this.memberEmail = memberEmail;
	}


	public int getCollaboNo() {
		return collaboNo;
	}

	public void setCollaboNo(int collaboNo) {
		this.collaboNo = collaboNo;
	}

	public String getCollaboTitle() {
		return collaboTitle;
	}

	public void setCollaboTitle(String collaboTitle) {
		this.collaboTitle = collaboTitle;
	}

	public String getCollaboContent() {
		return collaboContent;
	}

	public void setCollaboContent(String collaboContent) {
		this.collaboContent = collaboContent;
	}

	public String getCollaboCreateDate() {
		return collaboCreateDate;
	}

	public void setCollaboCreateDate(String collaboCreateDate) {
		this.collaboCreateDate = collaboCreateDate;
	}

	public String getCollaboUpdateDate() {
		return collaboUpdateDate;
	}

	public void setCollaboUpdateDate(String collaboUpdateDate) {
		this.collaboUpdateDate = collaboUpdateDate;
	}

	public int getCollaboCount() {
		return collaboCount;
	}

	public void setCollaboCount(int collaboCount) {
		this.collaboCount = collaboCount;
	}

	public String getCollaboDept() {
		return collaboDept;
	}

	public void setCollaboDept(String collaboDept) {
		this.collaboDept = collaboDept;
	}

	public Date getCollaboStartDate() {
		return collaboStartDate;
	}

	public void setCollaboStartDate(Date collaboStartDate) {
		this.collaboStartDate = collaboStartDate;
	}

	public Date getCollaboEndDate() {
		return collaboEndDate;
	}

	public void setCollaboEndDate(Date collaboEndDate) {
		this.collaboEndDate = collaboEndDate;
	}

	public String getCollaboDeleteYn() {
		return collaboDeleteYn;
	}

	public void setCollaboDeleteYn(String collaboDeleteYn) {
		this.collaboDeleteYn = collaboDeleteYn;
	}

	public int getCollaboStatus() {
		return collaboStatus;
	}

	public void setCollaboStatus(int collaboStatus) {
		this.collaboStatus = collaboStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getTaskAccepter() {
		return taskAccepter;
	}

	public void setTaskAccepter(int taskAccepter) {
		this.taskAccepter = taskAccepter;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getTaskAccepterName() {
		return taskAccepterName;
	}

	public void setTaskAccepterName(String taskAccepterName) {
		this.taskAccepterName = taskAccepterName;
	}

	public String getWirterDeptName() {
		return wirterDeptName;
	}

	public void setWirterDeptName(String wirterDeptName) {
		this.wirterDeptName = wirterDeptName;
	}

	public String getCollaboStatusTitle() {
		return collaboStatusTitle;
	}

	public void setCollaboStatusTitle(String collaboStatusTitle) {
		this.collaboStatusTitle = collaboStatusTitle;
	}

	public String getWriterJobName() {
		return writerJobName;
	}

	public void setWriterJobName(String writerJobName) {
		this.writerJobName = writerJobName;
	}

	public String getWriterDeptCode() {
		return writerDeptCode;
	}

	public void setWriterDeptCode(String writerDeptCode) {
		this.writerDeptCode = writerDeptCode;
	}

	public int getCmmtCount() {
		return cmmtCount;
	}

	public void setCmmtCount(int cmmtCount) {
		this.cmmtCount = cmmtCount;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}


	@Override
	public String toString() {
		return "CollaboBoard [collaboNo=" + collaboNo + ", collaboTitle=" + collaboTitle + ", collaboContent="
				+ collaboContent + ", collaboCreateDate=" + collaboCreateDate + ", collaboUpdateDate="
				+ collaboUpdateDate + ", collaboCount=" + collaboCount + ", collaboDept=" + collaboDept
				+ ", collaboStartDate=" + collaboStartDate + ", collaboEndDate=" + collaboEndDate + ", collaboDeleteYn="
				+ collaboDeleteYn + ", collaboStatus=" + collaboStatus + ", memberNo=" + memberNo + ", taskAccepter="
				+ taskAccepter + ", cmmtCount=" + cmmtCount + ", memberName=" + memberName + ", taskAccepterName="
				+ taskAccepterName + ", wirterDeptName=" + wirterDeptName + ", collaboStatusTitle=" + collaboStatusTitle
				+ ", writerJobName=" + writerJobName + ", writerDeptCode=" + writerDeptCode + ", memberEmail="
				+ memberEmail + "]";
	}
	

}
