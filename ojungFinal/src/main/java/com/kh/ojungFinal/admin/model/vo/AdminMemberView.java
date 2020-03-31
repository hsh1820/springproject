package com.kh.ojungFinal.admin.model.vo;

import java.sql.Date;

public class AdminMemberView {
	private int memberNo;
	private String memberName;
	private String deptName;
	private Date enrollDate;
	private int memberStatus;
	
	public AdminMemberView() {
	}

	public AdminMemberView(int memberNo, String memberName, String deptName, Date enrollDate, int memberStatus) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.deptName = deptName;
		this.enrollDate = enrollDate;
		this.memberStatus = memberStatus;
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

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(int memberStatus) {
		this.memberStatus = memberStatus;
	}

	@Override
	public String toString() {
		return "AdminMemberView [memberNo=" + memberNo + ", memberName=" + memberName + ", deptName=" + deptName
				+ ", enrollDate=" + enrollDate + ", memberStatus=" + memberStatus + "]";
	}
	
	
	
	

}
