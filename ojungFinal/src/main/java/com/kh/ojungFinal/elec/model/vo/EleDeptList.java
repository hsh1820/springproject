package com.kh.ojungFinal.elec.model.vo;

public class EleDeptList {
	private int memberNo;
	private String memberName;
	private String deptCode;
	private String deptName;
	private String jobCode;
	private String jobName;
	
	public EleDeptList() {
		// TODO Auto-generated constructor stub
	}

	public EleDeptList(int memberNo, String memberName, String deptCode, String deptName, String jobCode,
			String jobName) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.deptCode = deptCode;
		this.deptName = deptName;
		this.jobCode = jobCode;
		this.jobName = jobName;
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

	@Override
	public String toString() {
		return "EleDeptList [memberNo=" + memberNo + ", memberName=" + memberName + ", deptCode=" + deptCode
				+ ", deptName=" + deptName + ", jobCode=" + jobCode + ", jobName=" + jobName + "]";
	}
	
	
	
}
