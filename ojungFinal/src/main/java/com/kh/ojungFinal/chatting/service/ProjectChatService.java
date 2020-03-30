package com.kh.ojungFinal.chatting.service;

import java.util.List;

import com.kh.ojungFinal.chatting.model.ChatDto;
import com.kh.ojungFinal.chatting.model.ChatMemberDto;

public interface ProjectChatService {
	public ChatDto checkRoom(String name) throws Exception;
	
	public int createChatRoom(ChatDto dto) throws Exception;
	
	public List<ChatDto> getRoomList() throws Exception;
	
	public void addRoomMember(ChatMemberDto mem) throws Exception;
	
	public ChatMemberDto getRoomMember(ChatMemberDto mem)throws Exception;
	
	public List<ChatMemberDto> sameRoomList(ChatMemberDto mem)throws Exception;
	
	public int updateRoomMember(ChatMemberDto mem) throws Exception;
	
	public void deleteRoomMember(ChatMemberDto mem)throws Exception;
	
	public void updateChatCountInc(ChatDto dto) throws Exception;
	
	public void updateChatCountDec(ChatDto dto) throws Exception;
	
	public void deleteChat() throws Exception;
	
	public List<ChatDto> searchRoomList(String name) throws Exception;

	public int selectRoomNum(String userName) throws Exception;

	public String selcetFilePath(int roomNum) throws Exception;

}
