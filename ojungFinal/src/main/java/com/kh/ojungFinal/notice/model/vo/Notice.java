package com.kh.ojungFinal.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeCreateDate;
	private Date noticeUpdateDate;
	private int noticeCount;
	private int memberNo;
	private int noticeCode;
	
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}
	

	


	public Notice(String noticeTitle, String noticeContent, int memberNo, int noticeCode) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.memberNo = memberNo;
		this.noticeCode = noticeCode;
	}

	




	public Notice(String noticeTitle, String noticeContent, int noticeCode) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeCode = noticeCode;
	}





	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date noticeCreateDate, Date noticeUpdateDate,
			int noticeCount, int memberNo, int noticeCode) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeCreateDate = noticeCreateDate;
		this.noticeUpdateDate = noticeUpdateDate;
		this.noticeCount = noticeCount;
		this.memberNo = memberNo;
		this.noticeCode = noticeCode;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeCreateDate() {
		return noticeCreateDate;
	}

	public void setNoticeCreateDate(Date noticeCreateDate) {
		this.noticeCreateDate = noticeCreateDate;
	}

	public Date getNoticeUpdateDate() {
		return noticeUpdateDate;
	}

	public void setNoticeUpdateDate(Date noticeUpdateDate) {
		this.noticeUpdateDate = noticeUpdateDate;
	}

	public int getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getNoticeCode() {
		return noticeCode;
	}

	public void setNoticeCode(int noticeCode) {
		this.noticeCode = noticeCode;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeCreateDate=" + noticeCreateDate + ", noticeUpdateDate=" + noticeUpdateDate + ", noticeCount="
				+ noticeCount + ", memberNo=" + memberNo + ", noticeCode=" + noticeCode + "]";
	}
	
	
	

}
