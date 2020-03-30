package com.kh.ojungFinal.collaboBoard.model.vo;

public class CollaboCmmt {
	private int collaboCmmtNo;
	private String collaboCmmtContent;
	private String collaboCmmtCreateDt;
	private String collaboCmmtModifyDt;
	private String collaboCmmtDeleteYn;
	private String memberName;
	private int memberNo;
	private int collaboNo;
	private String jobCode;
	private String jobName;
	private String deptCode;
	private String deptName;

	public CollaboCmmt() {
		// TODO Auto-generated constructor stub
	}

	public CollaboCmmt(int collaboCmmtNo, String collaboCmmtContent, String collaboCmmtCreateDt,
			String collaboCmmtModifyDt, String collaboCmmtDeleteYn, String memberName, int collaboNo) {
		super();
		this.collaboCmmtNo = collaboCmmtNo;
		this.collaboCmmtContent = collaboCmmtContent;
		this.collaboCmmtCreateDt = collaboCmmtCreateDt;
		this.collaboCmmtModifyDt = collaboCmmtModifyDt;
		this.collaboCmmtDeleteYn = collaboCmmtDeleteYn;
		this.memberName = memberName;
		this.collaboNo = collaboNo;
	}

	public int getCollaboCmmtNo() {
		return collaboCmmtNo;
	}

	public void setCollaboCmmtNo(int collaboCmmtNo) {
		this.collaboCmmtNo = collaboCmmtNo;
	}

	public String getCollaboCmmtContent() {
		return collaboCmmtContent;
	}

	public void setCollaboCmmtContent(String collaboCmmtContent) {
		this.collaboCmmtContent = collaboCmmtContent;
	}

	public String getCollaboCmmtCreateDt() {
		return collaboCmmtCreateDt;
	}

	public void setCollaboCmmtCreateDt(String collaboCmmtCreateDt) {
		this.collaboCmmtCreateDt = collaboCmmtCreateDt;
	}

	public String getCollaboCmmtModifyDt() {
		return collaboCmmtModifyDt;
	}

	public void setCollaboCmmtModifyDt(String collaboCmmtModifyDt) {
		this.collaboCmmtModifyDt = collaboCmmtModifyDt;
	}

	public String getCollaboCmmtDeleteYn() {
		return collaboCmmtDeleteYn;
	}

	public void setCollaboCmmtDeleteYn(String collaboCmmtDeleteYn) {
		this.collaboCmmtDeleteYn = collaboCmmtDeleteYn;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getCollaboNo() {
		return collaboNo;
	}

	public void setCollaboNo(int collaboNo) {
		this.collaboNo = collaboNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getJobCode() {
		return jobCode;
	}

	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Override
	public String toString() {
		return "CollaboCmmt [collaboCmmtNo=" + collaboCmmtNo + ", collaboCmmtContent=" + collaboCmmtContent
				+ ", collaboCmmtCreateDt=" + collaboCmmtCreateDt + ", collaboCmmtModifyDt=" + collaboCmmtModifyDt
				+ ", collaboCmmtDeleteYn=" + collaboCmmtDeleteYn + ", memberName=" + memberName + ", memberNo="
				+ memberNo + ", collaboNo=" + collaboNo + ", jobCode=" + jobCode + ", jobName=" + jobName
				+ ", deptCode=" + deptCode + ", deptName=" + deptName + "]";
	}
	
	
}
