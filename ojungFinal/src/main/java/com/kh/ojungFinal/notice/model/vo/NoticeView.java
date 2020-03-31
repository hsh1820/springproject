package com.kh.ojungFinal.notice.model.vo;

import java.sql.Date;

public class NoticeView {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeCreateDate;
	private Date noticeUpdateDate;
	private int noticeCount;
	private int memberNo;
	private int noticeCode;
	private String memberName;
	private String noticeName;
	
	public NoticeView() {
		// TODO Auto-generated constructor stub
	}

	public NoticeView(int noticeNo, String noticeTitle, String noticeContent, Date noticeCreateDate,
			Date noticeUpdateDate, int noticeCount, int memberNo, int noticeCode, String memberName,
			String noticeName) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeCreateDate = noticeCreateDate;
		this.noticeUpdateDate = noticeUpdateDate;
		this.noticeCount = noticeCount;
		this.memberNo = memberNo;
		this.noticeCode = noticeCode;
		this.memberName = memberName;
		this.noticeName = noticeName;
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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getNoticeName() {
		return noticeName;
	}

	public void setNoticeName(String noticeName) {
		this.noticeName = noticeName;
	}

	@Override
	public String toString() {
		return "NoticeView [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeCreateDate=" + noticeCreateDate + ", noticeUpdateDate=" + noticeUpdateDate + ", noticeCount="
				+ noticeCount + ", memberNo=" + memberNo + ", noticeCode=" + noticeCode + ", memberName=" + memberName
				+ ", noticeName=" + noticeName + "]";
	}

	
	

	
	
}
