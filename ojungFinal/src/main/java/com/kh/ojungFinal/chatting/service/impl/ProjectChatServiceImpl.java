package com.kh.ojungFinal.chatting.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ojungFinal.chatting.dao.ProjectChatDao;
import com.kh.ojungFinal.chatting.model.ChatDto;
import com.kh.ojungFinal.chatting.model.ChatMemberDto;
import com.kh.ojungFinal.chatting.service.ProjectChatService;

@Service
public class ProjectChatServiceImpl implements ProjectChatService{
	
	@Autowired
	ProjectChatDao projectChatDao;
	
	@Override
	public ChatDto checkRoom(String name) throws Exception {
		
		return projectChatDao.checkRoom(name);
	}
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int createChatRoom(ChatDto dto) throws Exception {
		return projectChatDao.createChatRoom(dto);
		
	}

	@Override
	public List<ChatDto> getRoomList() throws Exception {
		
		return projectChatDao.getRoomList();
	}

	@Override
	public void addRoomMember(ChatMemberDto mem) throws Exception {
		projectChatDao.addRoomMember(mem);
		
	}

	@Override
	public ChatMemberDto getRoomMember(ChatMemberDto mem) throws Exception {
		// TODO Auto-generated method stub
		return projectChatDao.getRoomMember(mem);
	}

	@Override
	public List<ChatMemberDto> sameRoomList(ChatMemberDto mem) throws Exception {
		// TODO Auto-generated method stub
		return projectChatDao.sameRoomList(mem);
	}

	@Override
	public int updateRoomMember(ChatMemberDto mem) throws Exception {
		// TODO Auto-generated method stub
		return projectChatDao.updateRoomMember(mem);
	}

	@Override
	public void deleteRoomMember(ChatMemberDto mem) throws Exception {
		// TODO Auto-generated method stub
		projectChatDao.deleteRoomMember(mem);
		
	}

	@Override
	public void updateChatCountInc(ChatDto dto) throws Exception {
		// TODO Auto-generated method stub
		projectChatDao.updateChatCountInc(dto);
		
	}

	@Override
	public void updateChatCountDec(ChatDto dto) throws Exception {
		// TODO Auto-generated method stub
		projectChatDao.updateChatCountDec(dto);
		
	}

	@Override
	public void deleteChat() throws Exception {
		// TODO Auto-generated method stub
		projectChatDao.deleteChat();
	}

	@Override
	public List<ChatDto> searchRoomList(String name) throws Exception {
		// TODO Auto-generated method stub
		return projectChatDao.searchRoomList(name);
	}
	@Override
	public int selectRoomNum(String userName) throws Exception {
		return projectChatDao.selectRoomNum(userName);
	}
	@Override
	public String selcetFilePath(int roomNum) throws Exception {
		return projectChatDao.selcetFilePath(roomNum);
	};
	
}