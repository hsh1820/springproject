package com.kh.ojungFinal.personalMessage.model.vo;

import java.sql.Date;

public class PersonalMsg {
	
	
	
	private int msgNo;
	private String msgTitle;
	private String msgContent;
	private String msgStatus;
	private int msgSender;
	private String memberName;
	private int memberNo2;
	private Date msgDate;
	private String deptCode;
	private String deptName;
	private String jobName;
	private int memberNo;
	
	
	public PersonalMsg(){}

	
	
	







	public PersonalMsg(String msgTitle, String msgContent, int msgSender, int memberNo2) {
		super();
		this.msgTitle = msgTitle;
		this.msgContent = msgContent;
		this.msgSender = msgSender;
		this.memberNo2 = memberNo2;
	}











	public PersonalMsg(int msgNo, String msgTitle, String msgContent, int memberNo2, int msgSender) {
		super();
		this.msgNo = msgNo;
		this.msgTitle = msgTitle;
		this.msgContent = msgContent;
		this.memberNo2 = memberNo2;
		this.msgSender = msgSender;
	}




	public PersonalMsg(int msgNo, String msgTitle, String msgContent, String msgStatus, int msgSender,
			String memberName, int memberNo2, Date msgDate, String deptCode, String deptName, String jobName,
			int memberNo) {
		super();
		this.msgNo = msgNo;
		this.msgTitle = msgTitle;
		this.msgContent = msgContent;
		this.msgStatus = msgStatus;
		this.msgSender = msgSender;
		this.memberName = memberName;
		this.memberNo2 = memberNo2;
		this.msgDate = msgDate;
		this.deptCode = deptCode;
		this.deptName = deptName;
		this.jobName = jobName;
		this.memberNo = memberNo;
	}




	public int getMsgNo() {
		return msgNo;
	}




	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}




	public String getMsgTitle() {
		return msgTitle;
	}




	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}




	public String getMsgContent() {
		return msgContent;
	}




	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}




	public String getMsgStatus() {
		return msgStatus;
	}




	public void setMsgStatus(String msgStatus) {
		this.msgStatus = msgStatus;
	}




	public int getMsgSender() {
		return msgSender;
	}




	public void setMsgSender(int msgSender) {
		this.msgSender = msgSender;
	}




	public String getMemberName() {
		return memberName;
	}




	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}




	public int getMemberNo2() {
		return memberNo2;
	}




	public void setMemberNo2(int memberNo2) {
		this.memberNo2 = memberNo2;
	}




	public Date getMsgDate() {
		return msgDate;
	}




	public void setMsgDate(Date msgDate) {
		this.msgDate = msgDate;
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




	public String getJobName() {
		return jobName;
	}




	public void setJobName(String jobName) {
		this.jobName = jobName;
	}




	public int getMemberNo() {
		return memberNo;
	}




	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}




	@Override
	public String toString() {
		return "PersonalMsg [msgNo=" + msgNo + ", msgTitle=" + msgTitle + ", msgContent=" + msgContent + ", msgStatus="
				+ msgStatus + ", msgSender=" + msgSender + ", memberName=" + memberName + ", memberNo2=" + memberNo2
				+ ", msgDate=" + msgDate + ", deptCode=" + deptCode + ", deptName=" + deptName + ", jobName=" + jobName
				+ ", memberNo=" + memberNo + "]";
	}


	
	
	
	

	
	
	
}