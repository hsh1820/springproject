package com.kh.ojungFinal.elec.model.vo;

import java.sql.Date;

public class Sgn_path {
	
	private int spNo;
	private String spTitle;
	private Date insertDate;
	private String spSignPath;
	private int memberNo;
	
	public Sgn_path() {
		// TODO Auto-generated constructor stub
	}
	
	public Sgn_path(int spNo, String spTitle, Date insertDate, String spSignPath, int memberNo) {
		super();
		this.spNo = spNo;
		this.spTitle = spTitle;
		this.insertDate = insertDate;
		this.spSignPath = spSignPath;
		this.memberNo = memberNo;
	}

	public int getSpNo() {
		return spNo;
	}

	public void setSpNo(int spNo) {
		this.spNo = spNo;
	}

	public String getSpTitle() {
		return spTitle;
	}

	public void setSpTitle(String spTitle) {
		this.spTitle = spTitle;
	}

	public Date getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}

	public String getSpSignPath() {
		return spSignPath;
	}

	public void setSpSignPath(String spSignPath) {
		this.spSignPath = spSignPath;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Sgn_path [spNo=" + spNo + ", spTitle=" + spTitle + ", insertDate=" + insertDate + ", spSignPath="
				+ spSignPath + ", memberNo=" + memberNo + "]";
	}
	
	
	
	
	
	
}
