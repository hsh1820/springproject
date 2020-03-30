package com.kh.ojungFinal.notice.model.vo;

public class NoticeCategory {

	private int noticeCode;
	private String noticeName;
	
	public NoticeCategory() {
		// TODO Auto-generated constructor stub
	}

	public NoticeCategory(int noticeCode, String noticeName) {
		super();
		this.noticeCode = noticeCode;
		this.noticeName = noticeName;
	}

	public int getNoticeCode() {
		return noticeCode;
	}

	public void setNoticeCode(int noticeCode) {
		this.noticeCode = noticeCode;
	}

	public String getNoticeName() {
		return noticeName;
	}

	public void setNoticeName(String noticeName) {
		this.noticeName = noticeName;
	}

	@Override
	public String toString() {
		return "NoticeCategory [noticeCode=" + noticeCode + ", noticeName=" + noticeName + "]";
	}
	
	
	
}
