package com.kh.ojungFinal.deptBoard.model.vo;

import java.sql.Timestamp;

public class DeptBoardReply {
	private int replyNo;
	private String replyContent;
	private Timestamp createDate;
	private Timestamp modifyDate;
	private char deleteYN;
	private int boardNo;
	private int memberNo;
	private String memberName;
	
	public DeptBoardReply() {
		// TODO Auto-generated constructor stub
	}

	public DeptBoardReply(int replyNo, String replyContent, Timestamp createDate, Timestamp modifyDate, char deleteYN,
			int boardNo, int memberNo, String memberName) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.deleteYN = deleteYN;
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.memberName = memberName;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Timestamp getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Timestamp modifyDate) {
		this.modifyDate = modifyDate;
	}

	public char getDeleteYN() {
		return deleteYN;
	}

	public void setDeleteYN(char deleteYN) {
		this.deleteYN = deleteYN;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
		return "DeptBoardReply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", createDate=" + createDate
				+ ", modifyDate=" + modifyDate + ", deleteYN=" + deleteYN + ", boardNo=" + boardNo + ", memberNo="
				+ memberNo + ", memberName=" + memberName + "]";
	}
	
	
	
	
}
