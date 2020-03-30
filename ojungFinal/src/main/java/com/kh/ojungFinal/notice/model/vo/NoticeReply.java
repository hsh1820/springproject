package com.kh.ojungFinal.notice.model.vo;

import java.sql.Timestamp;

public class NoticeReply {
	
	private int noticeReplyNo;
	private String noticeReplyContent;
	private Timestamp noticeReplyCreateDate;
	private Timestamp noticeReplyModifyDate;
	private String noticeReplyDelete;
	private int noticeNo;
	private int memberNo;
	private String memberName;
	
	public NoticeReply() {
		// TODO Auto-generated constructor stub
	}

	public NoticeReply(int noticeReplyNo, String noticeReplyContent, Timestamp noticeReplyCreateDate,
			Timestamp noticeReplyModifyDate, String noticeReplyDelete, int noticeNo, int memberNo, String memberName) {
		super();
		this.noticeReplyNo = noticeReplyNo;
		this.noticeReplyContent = noticeReplyContent;
		this.noticeReplyCreateDate = noticeReplyCreateDate;
		this.noticeReplyModifyDate = noticeReplyModifyDate;
		this.noticeReplyDelete = noticeReplyDelete;
		this.noticeNo = noticeNo;
		this.memberNo = memberNo;
		this.memberName = memberName;
	}

	public int getNoticeReplyNo() {
		return noticeReplyNo;
	}

	public void setNoticeReplyNo(int noticeReplyNo) {
		this.noticeReplyNo = noticeReplyNo;
	}

	public String getNoticeReplyContent() {
		return noticeReplyContent;
	}

	public void setNoticeReplyContent(String noticeReplyContent) {
		this.noticeReplyContent = noticeReplyContent;
	}

	public Timestamp getNoticeReplyCreateDate() {
		return noticeReplyCreateDate;
	}

	public void setNoticeReplyCreateDate(Timestamp noticeReplyCreateDate) {
		this.noticeReplyCreateDate = noticeReplyCreateDate;
	}

	public Timestamp getNoticeReplyModifyDate() {
		return noticeReplyModifyDate;
	}

	public void setNoticeReplyModifyDate(Timestamp noticeReplyModifyDate) {
		this.noticeReplyModifyDate = noticeReplyModifyDate;
	}

	public String getNoticeReplyDelete() {
		return noticeReplyDelete;
	}

	public void setNoticeReplyDelete(String noticeReplyDelete) {
		this.noticeReplyDelete = noticeReplyDelete;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
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

	@Override
	public String toString() {
		return "NoticeReply [noticeReplyNo=" + noticeReplyNo + ", noticeReplyContent=" + noticeReplyContent
				+ ", noticeReplyCreateDate=" + noticeReplyCreateDate + ", noticeReplyModifyDate="
				+ noticeReplyModifyDate + ", noticeReplyDelete=" + noticeReplyDelete + ", noticeNo=" + noticeNo
				+ ", memberNo=" + memberNo + ", memberName=" + memberName + "]";
	}

	
}
