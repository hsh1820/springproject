package com.kh.ojungFinal.deptBoard.model.vo;

public class DeptBoardFile {
	private int fileNo;
	private String fileOriginName;
	private String fileChangeName;
	private String filePath;
	private char fileStatus;
	private int boardNo;
	
	public DeptBoardFile() {
		// TODO Auto-generated constructor stub
	}

	public DeptBoardFile(int fileNo, String fileOriginName, String fileChangeName, String filePath, char fileStatus,
			int boardNo) {
		super();
		this.fileNo = fileNo;
		this.fileOriginName = fileOriginName;
		this.fileChangeName = fileChangeName;
		this.filePath = filePath;
		this.fileStatus = fileStatus;
		this.boardNo = boardNo;
	}
	
	
	

	public DeptBoardFile(int fileNo, String fileOriginName, String fileChangeName) {
		super();
		this.fileNo = fileNo;
		this.fileOriginName = fileOriginName;
		this.fileChangeName = fileChangeName;
	}

	public DeptBoardFile(String fileOriginName, String fileChangeName, String filePath) {
		super();
		this.fileOriginName = fileOriginName;
		this.fileChangeName = fileChangeName;
		this.filePath = filePath;
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

	public char getFileStatus() {
		return fileStatus;
	}

	public void setFileStatus(char fileStatus) {
		this.fileStatus = fileStatus;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "DeptBoardFile [fileNo=" + fileNo + ", fileOriginName=" + fileOriginName + ", fileChangeName="
				+ fileChangeName + ", filePath=" + filePath + ", fileStatus=" + fileStatus + ", boardNo=" + boardNo
				+ "]";
	}
	
	
}
