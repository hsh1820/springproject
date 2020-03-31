package com.kh.ojungFinal.admin.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class RecentBoard implements Comparable<RecentBoard>{
	private int rBoardNo;
	private String rBoardTitle;
	private String rDeptName;
	private String rMemberName;
	private Timestamp rBoardCreateDate;
	private int rBoardType; // 1: 부서게시판, 2: 협동게시판
	private String changeDate;
	
	public RecentBoard() {
	}


	public RecentBoard(int rBoardNo, String rBoardTitle, String rDeptName, String rMemberName,
			Timestamp rBoardCreateDate, int rBoardType, String changeDate) {
		super();
		this.rBoardNo = rBoardNo;
		this.rBoardTitle = rBoardTitle;
		this.rDeptName = rDeptName;
		this.rMemberName = rMemberName;
		this.rBoardCreateDate = rBoardCreateDate;
		this.rBoardType = rBoardType;
		this.changeDate = changeDate;
	}


	public int getrBoardNo() {
		return rBoardNo;
	}





	public void setrBoardNo(int rBoardNo) {
		this.rBoardNo = rBoardNo;
	}





	public String getrBoardTitle() {
		return rBoardTitle;
	}





	public void setrBoardTitle(String rBoardTitle) {
		this.rBoardTitle = rBoardTitle;
	}





	public String getrDeptName() {
		return rDeptName;
	}





	public void setrDeptName(String rDeptName) {
		this.rDeptName = rDeptName;
	}





	public String getrMemberName() {
		return rMemberName;
	}





	public void setrMemberName(String rMemberName) {
		this.rMemberName = rMemberName;
	}





	public Timestamp getrBoardCreateDate() {
		return rBoardCreateDate;
	}





	public void setrBoardCreateDate(Timestamp rBoardCreateDate) {
		this.rBoardCreateDate = rBoardCreateDate;
	}





	public int getrBoardType() {
		return rBoardType;
	}





	public void setrBoardType(int rBoardType) {
		this.rBoardType = rBoardType;
	}





	public String getChangeDate() {
		return changeDate;
	}





	public void setChangeDate(String changeDate) {
		this.changeDate = changeDate;
	}



	@Override
	public String toString() {
		return "RecentBoard [rBoardNo=" + rBoardNo + ", rBoardTitle=" + rBoardTitle + ", rDeptName=" + rDeptName
				+ ", rMemberName=" + rMemberName + ", rBoardCreateDate=" + rBoardCreateDate + ", rBoardType="
				+ rBoardType + ", changeDate=" + changeDate + "]";
	}


	@Override
	public int compareTo(RecentBoard o) {
		return rBoardCreateDate.compareTo(o.getrBoardCreateDate()); 
	}

	
}
