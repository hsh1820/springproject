package com.kh.ojungFinal.chatting.model;

public class ChatDto {
	private int num;
	private String name;
	private String pwd;
	private int totalCount;
	private int remainCount;
	private String content;
	private String filePath;
	
	public ChatDto() {
		// TODO Auto-generated constructor stub
	}

	public ChatDto(int num, String name, String pwd, int totalCount, int remainCount, String content) {
		super();
		this.num = num;
		this.name = name;
		this.pwd = pwd;
		this.totalCount = totalCount;
		this.remainCount = remainCount;
		this.content = content;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getRemainCount() {
		return remainCount;
	}

	public void setRemainCount(int remainCount) {
		this.remainCount = remainCount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "ChatDto [num=" + num + ", name=" + name + ", pwd=" + pwd + ", totalCount=" + totalCount
				+ ", remainCount=" + remainCount + ", content=" + content + ", filePath=" + filePath + "]";
	}

	

}
