package com.kh.ojungFinal.chatting.dao;

import java.util.List;

import com.kh.ojungFinal.chatting.model.ChatDto;
import com.kh.ojungFinal.chatting.model.ChatMemberDto;

public interface ProjectChatDao {
	// 중복확인
	public ChatDto checkRoom(String name) throws Exception;
	// 방만들기
	public int createChatRoom(ChatDto dto) throws Exception;
	// 방정보리스트
	public List<ChatDto> getRoomList() throws Exception;
	
	// 현재 유저 지정한 방에 입장
	public void addRoomMember(ChatMemberDto mem)throws Exception;
	
	// 현재 유저가 어떤방에 있는지 확인
	public ChatMemberDto getRoomMember(ChatMemberDto mem) throws Exception;
	
	// 같은방에 존재하는 사람저보 모두 가져오기
	public List<ChatMemberDto> sameRoomList(ChatMemberDto mem)throws Exception;
	// 유저의 방정보 수정
	public int updateRoomMember(ChatMemberDto mem)throws Exception;
	
	// 유저의 방정보 삭제
	public void deleteRoomMember(ChatMemberDto mem)throws Exception;
	// remainCount 증가
	public void updateChatCountInc(ChatDto dto)throws Exception;
	
	// remainCount 감소
	public void updateChatCountDec(ChatDto dto)throws Exception;
	// 방삭제
	public void deleteChat() throws Exception;
	// 방검색
	public List<ChatDto> searchRoomList(String name) throws Exception;
	// 현재 유저 방 번호 검색
	public int selectRoomNum(String userName) throws Exception;
	// 현재 유저의 방의 파일 경로 얻어오기
	public String selcetFilePath(int roomNum) throws Exception;
}
