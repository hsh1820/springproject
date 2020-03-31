package com.kh.ojungFinal.notice.model.vo;



public class NoticeFile {
	
	private int fileNo;
	private String fileOriginName;
	private String fileChangeName;
	private String filePath;
	private String fileStatus;
	private int noticeNo;
	
	public NoticeFile() {
	}
	
	public NoticeFile(int fileNo, String fileChangeName, int noticeNo) {
		super();
		this.fileNo = fileNo;
		this.fileChangeName = fileChangeName;
		this.noticeNo = noticeNo;
	}

	



	public NoticeFile(int fileNo, String fileOriginName, String fileChangeName) {
		super();
		this.fileNo = fileNo;
		this.fileOriginName = fileOriginName;
		this.fileChangeName = fileChangeName;
	}

	public NoticeFile(String fileOriginName, String fileChangeName, String filePath) {
		super();
		this.fileOriginName = fileOriginName;
		this.fileChangeName = fileChangeName;
		this.filePath = filePath;
	}



	public NoticeFile(int fileNo, String fileOriginName, String fileChangeName, String filePath, String fileStatus,
			int noticeNo) {
		super();
		this.fileNo = fileNo;
		this.fileOriginName = fileOriginName;
		this.fileChangeName = fileChangeName;
		this.filePath = filePath;
		this.fileStatus = fileStatus;
		this.noticeNo = noticeNo;
	}



	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileOriginName() {
		return fileOriginName;
	}

	public void setFileOriginName(String fileOriginName) {
		this.fileOriginName = fileOriginName;
	}

	public String getFileChangeName() {
		return fileChangeName;
	}

	public void setFileChangeName(String fileChangeName) {
		this.fileChangeName = fileChangeName;
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

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	@Override
	public String toString() {
		return "Notice_File [fileNo=" + fileNo + ", fileOriginName=" + fileOriginName + ", fileChangeName="
				+ fileChangeName + ", filePath=" + filePath + ", fileStatus=" + fileStatus + ", noticeNo=" + noticeNo
				+ "]";
	}

	
	
	
}
