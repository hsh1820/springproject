package com.kh.ojungFinal.admin.model.vo;

public class MainSign {
	private int docNo;
	private String docTitle;
	private int memberNo;
	
	public MainSign() {
	}

	public MainSign(int docNo, String docTitle, int memberNo) {
		super();
		this.docNo = docNo;
		this.docTitle = docTitle;
		this.memberNo = memberNo;
	}

	public int getDocNo() {
		return docNo;
	}

	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}

	public String getDocTitle() {
		return docTitle;
	}

	public void setDocTitle(String docTitle) {
		this.docTitle = docTitle;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "MainSign [docNo=" + docNo + ", docTitle=" + docTitle + ", memberNo=" + memberNo + "]";
	}
	
	
}
