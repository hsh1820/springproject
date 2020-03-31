package com.kh.ojungFinal.elec.model.vo;

public class Sgn_docType {
	
	private int dtNo;
	private String dtTitle;
	private String dtContents;
	private String deleteFlag;

	
	public Sgn_docType() {
		// TODO Auto-generated constructor stub
	}


	public Sgn_docType(int dtNo, String dtTitle, String dtContents, String deleteFlag) {
		super();
		this.dtNo = dtNo;
		this.dtTitle = dtTitle;
		this.dtContents = dtContents;
		this.deleteFlag = deleteFlag;
	}


	public int getDtNo() {
		return dtNo;
	}


	public void setDtNo(int dtNo) {
		this.dtNo = dtNo;
	}


	public String getDtTitle() {
		return dtTitle;
	}


	public void setDtTitle(String dtTitle) {
		this.dtTitle = dtTitle;
	}


	public String getDtContents() {
		return dtContents;
	}


	public void setDtContents(String dtContents) {
		this.dtContents = dtContents;
	}


	public String getDeleteFlag() {
		return deleteFlag;
	}


	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}


	@Override
	public String toString() {
		return "Sgn_docType [dtNo=" + dtNo + ", dtTitle=" + dtTitle + ", dtContents=" + dtContents + ", deleteFlag="
				+ deleteFlag + "]";
	}
	
	
	
	
	
	
	
}


