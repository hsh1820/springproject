package com.kh.ojungFinal.elec.model.vo;

public class Sgn_docFile {

	private int fileNo;
	private String fileName; // 변경된 파일명 
	private String realName; // 원본 파일명 
	private int fileSize;
	private int docNo;
	private String filePath;
	
	public Sgn_docFile() {
		// TODO Auto-generated constructor stub
	}
	
	
	

	public Sgn_docFile(String fileName, String realName, String filePath) {
		super();
		this.fileName = fileName;
		this.realName = realName;
		this.filePath = filePath;
	}

	public Sgn_docFile(int fileNo, String fileName, String realName, int fileSize, int docNo, String filePath) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.realName = realName;
		this.fileSize = fileSize;
		this.docNo = docNo;
		this.filePath = filePath;
	}



	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public int getDocNo() {
		return docNo;
	}

	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "Sgn_docFile [fileNo=" + fileNo + ", fileName=" + fileName + ", realName=" + realName + ", fileSize="
				+ fileSize + ", docNo=" + docNo + ", filePath=" + filePath + "]";
	}
	
	
}
