package com.kh.ojungFinal.collaboBoard.model.vo;

public class DeptList {
	private int MemberNo;
	private String memberName;
	private String jobName;
	private String deptCode;
	private String deptName;
	
	public DeptList() {
		// TODO Auto-generated constructor stub
	}

	public DeptList(int memberNo, String memberName, String jobName, String deptCode, String deptName) {
		super();
		MemberNo = memberNo;
		this.memberName = memberName;
		this.jobName = jobName;
		this.deptCode = deptCode;
		this.deptName = deptName;
	}

	public int getMemberNo() {
		return MemberNo;
	}

	public void setMemberNo(int memberNo) {
		MemberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
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
		return "DeptList [MemberNo=" + MemberNo + ", memberName=" + memberName + ", jobName=" + jobName + ", deptCode="
				+ deptCode + ", deptName=" + deptName + "]";
	}

	
	
}
