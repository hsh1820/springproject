package com.kh.ojungFinal.collaboBoard.model.vo;

public class CollaboFile {
	private int fileNo;
	private String fileOriginNm;
	private String fileChangeNm;
	private String filePath;
	private String fileStatus;
	private int collaboNo;
	
	
	
	public CollaboFile() {
		// TODO Auto-generated constructor stub
	}

	public CollaboFile(int fileNo, String fileOriginNm, String fileChangeNm, String filePath, String fileStatus,
			int collaboNo) {
		super();
		this.fileNo = fileNo;
		this.fileOriginNm = fileOriginNm;
		this.fileChangeNm = fileChangeNm;
		this.filePath = filePath;
		this.fileStatus = fileStatus;
		this.collaboNo = collaboNo;
	}

	public CollaboFile(String originalFilename, String changeFileName, String filePath2) {
		this.fileOriginNm = originalFilename;
		this.fileChangeNm = changeFileName;
		this.filePath = filePath2;
	}

	public CollaboFile(int fileNo,String originalFilename, String changeFileName) {
		this.fileOriginNm = originalFilename;
		this.fileChangeNm = changeFileName;
		this.fileNo = fileNo;
	}
	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileOriginNm() {
		return fileOriginNm;
	}

	public void setFileOriginNm(String fileOriginNm) {
		this.fileOriginNm = fileOriginNm;
	}

	public String getFileChangeNm() {
		return fileChangeNm;
	}

	public void setFileChangeNm(String fileChangeNm) {
		this.fileChangeNm = fileChangeNm;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileStatus() {
		return fileStatus;
	}

	public void setFileStatus(String fileStatus) {
		this.fileStatus = fileStatus;
	}

	public int getCollaboNo() {
		return collaboNo;
	}

	public void setCollaboNo(int collaboNo) {
		this.collaboNo = collaboNo;
	}

	@Override
	public String toString() {
		return "CollaboFile [fileNo=" + fileNo + ", fileOriginNm=" + fileOriginNm + ", fileChangeNm=" + fileChangeNm
				+ ", filePath=" + filePath + ", fileStatus=" + fileStatus + ", collaboNo=" + collaboNo + "]";
	}
	
	
}
