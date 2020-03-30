package com.kh.ojungFinal.admin.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class MainDeptBoard {
	private int boardNo;
	private String boardTitle;
	private Timestamp createDate;
	private String deptCode;
	private String deptName;
	private int memberNo;
	private String memberName;

	public MainDeptBoard() {
		// TODO Auto-generated constructor stub
	}

	public MainDeptBoard(int boardNo, String boardTitle, Timestamp createDate, String deptCode, String deptName,
			int memberNo, String memberName) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.createDate = createDate;
		this.deptCode = deptCode;
		this.deptName = deptName;
		this.memberNo = memberNo;
		this.memberName = memberName;
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

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
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
		return "MainDeptBoard [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", createDate=" + createDate
				+ ", deptCode=" + deptCode + ", deptName=" + deptName + ", memberNo=" + memberNo + ", memberName="
				+ memberName + "]";
	}

	
	
	
	

}