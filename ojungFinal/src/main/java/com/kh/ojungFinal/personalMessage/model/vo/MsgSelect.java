package com.kh.ojungFinal.personalMessage.model.vo;
public class MsgSelect {

	private String memberName;
	private String deptName;
	private String jobName;
	private String deptCode;
	private int memberNo;
	
	public MsgSelect() {}

	public MsgSelect(String memberName, String deptName, String jobName, String deptCode, int memberNo) {
		super();
		this.memberName = memberName;
		this.deptName = deptName;
		this.jobName = jobName;
		this.deptCode = deptCode;
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "MsgSelect [memberName=" + memberName + ", deptName=" + deptName + ", jobName=" + jobName + ", deptCode="
				+ deptCode + ", memberNo=" + memberNo + "]";
	}
	
	
	
	
	
	
	
}
