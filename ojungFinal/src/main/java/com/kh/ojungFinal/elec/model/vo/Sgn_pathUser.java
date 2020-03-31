package com.kh.ojungFinal.elec.model.vo;

public class Sgn_pathUser {
	
	private int spUser;
	private int spNo;
	private String ssType;
	private int memberNo;
	
	public Sgn_pathUser() {
		// TODO Auto-generated constructor stub
	}

	public Sgn_pathUser(int spUser, int spNo, String ssType, int memberNo) {
		super();
		this.spUser = spUser;
		this.spNo = spNo;
		this.ssType = ssType;
		this.memberNo = memberNo;
	}

	public int getSpUser() {
		return spUser;
	}

	public void setSpUser(int spUser) {
		this.spUser = spUser;
	}

	public int getSpNo() {
		return spNo;
	}

	public void setSpNo(int spNo) {
		this.spNo = spNo;
	}

	public String getSsType() {
		return ssType;
	}

	public void setSsType(String ssType) {
		this.ssType = ssType;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Sgn_pathUser [spUser=" + spUser + ", spNo=" + spNo + ", ssType=" + ssType + ", memberNo=" + memberNo
				+ "]";
	}
	
	
	
	
	
}
