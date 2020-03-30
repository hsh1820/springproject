package com.kh.ojungFinal.chatting.model;

public class ChatMemberDto {
	private int num;
	private String name;
	private String room;
	private String priRoom;
	
	public ChatMemberDto() {
		// TODO Auto-generated constructor stub
	}

	public ChatMemberDto(int num, String name, String room, String priRoom) {
		super();
		this.num = num;
		this.name = name;
		this.room = room;
		this.priRoom = priRoom;
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

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getPriRoom() {
		return priRoom;
	}

	public void setPriRoom(String priRoom) {
		this.priRoom = priRoom;
	}

	@Override
	public String toString() {
		return "ChatMemberDto [num=" + num + ", name=" + name + ", room=" + room + ", priRoom=" + priRoom + "]";
	}
	
}