package com.kh.ojungFinal.chatting.model;

public class ChatListDto {
	private int chatNum;
	private int chatmember;
	private String filePath;
	
	public ChatListDto() {
		// TODO Auto-generated constructor stub
	}

	public ChatListDto(int chatNum, int chatmember, String filePath) {
		super();
		this.chatNum = chatNum;
		this.chatmember = chatmember;
		this.filePath = filePath;
	}

	public int getChatNum() {
		return chatNum;
	}

	public void setChatNum(int chatNum) {
		this.chatNum = chatNum;
	}

	public int getChatmember() {
		return chatmember;
	}

	public void setChatmember(int chatmember) {
		this.chatmember = chatmember;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "ChatListDto [chatNum=" + chatNum + ", chatmember=" + chatmember + ", filePath=" + filePath + "]";
	}
	
}
