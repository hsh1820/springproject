package com.kh.ojungFinal.admin.model.vo;

public class Member {
	private int memberNo;
	private String memberEmail;
	private String memberPwd;
	private String memberName;
	private String enrollDate;
	private int memberStatus;
	private String memberPhone;
	private String memberAddress;
	private int memberGrade;
	private String deptCode;
	private String jobCode;
	private int holiday;
	private String memberIdNo;
	private String gender;
	private String extensionNumber;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	

	public Member(int memberNo, String memberEmail, String memberPwd, String memberName, String enrollDate,
			int memberStatus, String memberPhone, String memberAddress, int memberGrade, String deptCode,
			String jobCode, int holiday, String memberIdNo, String gender, String extensionNumber) {
		super();
		this.memberNo = memberNo;
		this.memberEmail = memberEmail;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.enrollDate = enrollDate;
		this.memberStatus = memberStatus;
		this.memberPhone = memberPhone;
		this.memberAddress = memberAddress;
		this.memberGrade = memberGrade;
		this.deptCode = deptCode;
		this.jobCode = jobCode;
		this.holiday = holiday;
		this.memberIdNo = memberIdNo;
		this.gender = gender;
		this.extensionNumber = extensionNumber;
	}



	public Member(String memberEmail, String memberName, String memberPhone, String memberAddress, String deptCode,
			String jobCode, String memberIdNo, String gender) {
		super();
		this.memberEmail = memberEmail;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberAddress = memberAddress;
		this.deptCode = deptCode;
		this.jobCode = jobCode;
		this.memberIdNo = memberIdNo;
		this.gender = gender;
	}


	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(int memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public int getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(int memberGrade) {
		this.memberGrade = memberGrade;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getJobCode() {
		return jobCode;
	}

	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}

	public int getHoliday() {
		return holiday;
	}

	public void setHoliday(int holiday) {
		this.holiday = holiday;
	}

	public String getMemberIdNo() {
		return memberIdNo;
	}

	public void setMemberIdNo(String memberIdNo) {
		this.memberIdNo = memberIdNo;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	

	public String getExtensionNumber() {
		return extensionNumber;
	}


	public void setExtensionNumber(String extensionNumber) {
		this.extensionNumber = extensionNumber;
	}


	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberEmail=" + memberEmail + ", memberPwd=" + memberPwd
				+ ", memberName=" + memberName + ", enrollDate=" + enrollDate + ", memberStatus=" + memberStatus
				+ ", memberPhone=" + memberPhone + ", memberAddress=" + memberAddress + ", memberGrade=" + memberGrade
				+ ", deptCode=" + deptCode + ", jobCode=" + jobCode + ", holiday=" + holiday + ", memberIdNo="
				+ memberIdNo + ", gender=" + gender + ", extensionNumber=" + extensionNumber + "]";
	}


	
	
	
	
}
