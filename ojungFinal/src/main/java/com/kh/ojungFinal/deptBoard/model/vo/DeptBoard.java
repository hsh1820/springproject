package com.kh.ojungFinal.deptBoard.model.vo;

import java.sql.Date;

public class DeptBoard {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private Date updateDate;
	private int boardCount;
	private char boardStatus;
	private String deptCode;
	private int memberNo;
	private String memberName;
	private String deptName;
	private int recnt; //게시글 댓글의 수 
	
	public DeptBoard() {
		// TODO Auto-generated constructor stub
	}

	
	
	public DeptBoard(int boardNo, String boardTitle, String boardContent) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
	}

	

	public DeptBoard(String boardTitle, String boardContent, int memberNo, String deptCode) {
		super();
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.memberNo = memberNo;
		this.deptCode = deptCode;
	}



	public DeptBoard(int boardNo, String boardTitle, String boardContent, Date createDate, Date updateDate,
			int boardCount, char boardStatus, String deptCode, int memberNo, String memberName, String deptName,
			int recnt) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.boardCount = boardCount;
		this.boardStatus = boardStatus;
		this.deptCode = deptCode;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.deptName = deptName;
		this.recnt = recnt;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public char getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(char boardStatus) {
		this.boardStatus = boardStatus;
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

	public int getRecnt() {
		return recnt;
	}

	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}

	@Override
	public String toString() {
		return "DeptBoard [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", createDate=" + createDate + ", updateDate=" + updateDate + ", boardCount=" + boardCount
				+ ", boardStatus=" + boardStatus + ", deptCode=" + deptCode + ", memberNo=" + memberNo + ", memberName="
				+ memberName + ", deptName=" + deptName + ", recnt=" + recnt + "]";
	}

	
	
	
	
}