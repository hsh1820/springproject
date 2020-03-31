package com.kh.ojungFinal.elec.model.vo;

import java.sql.Date;

public class Sgn_sign {
	private int ssNo;
	private int docNo;
	private int sStep;
	private String ssType; // 1: 합의, 2: 결재
	private String ssResult;
	private String ssComment;
	private Date receiveDate;
	private Date signDate;
	private String userPos;
	private int memberNo;
	
	public Sgn_sign() {
		// TODO Auto-generated constructor stub
	}

	public Sgn_sign(int ssNo, int docNo, int sStep, String ssType, String ssResult, String ssComment, Date receiveDate,
			Date signDate, String userPos, int memberNo) {
		super();
		this.ssNo = ssNo;
		this.docNo = docNo;
		this.sStep = sStep;
		this.ssType = ssType;
		this.ssResult = ssResult;
		this.ssComment = ssComment;
		this.receiveDate = receiveDate;
		this.signDate = signDate;
		this.userPos = userPos;
		this.memberNo = memberNo;
	}

	public int getSsNo() {
		return ssNo;
	}

	public void setSsNo(int ssNo) {
		this.ssNo = ssNo;
	}

	public int getDocNo() {
		return docNo;
	}

	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}

	public int getsStep() {
		return sStep;
	}

	public void setsStep(int sStep) {
		this.sStep = sStep;
	}

	public String getSsType() {
		return ssType;
	}

	public void setSsType(String ssType) {
		this.ssType = ssType;
	}

	public String getSsResult() {
		return ssResult;
	}

	public void setSsResult(String ssResult) {
		this.ssResult = ssResult;
	}

	public String getSsComment() {
		return ssComment;
	}

	public void setSsComment(String ssComment) {
		this.ssComment = ssComment;
	}

	public Date getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}

	public Date getSignDate() {
		return signDate;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

	public String getUserPos() {
		return userPos;
	}

	public void setUserPos(String userPos) {
		this.userPos = userPos;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Sgn_sign [ssNo=" + ssNo + ", docNo=" + docNo + ", sStep=" + sStep + ", ssType=" + ssType + ", ssResult="
				+ ssResult + ", ssComment=" + ssComment + ", receiveDate=" + receiveDate + ", signDate=" + signDate
				+ ", userPos=" + userPos + ", memberNo=" + memberNo + "]";
	}
	
	
	
	
	
}
