package com.kh.ojungFinal.chatting.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ojungFinal.chatting.dao.ProjectChatDao;
import com.kh.ojungFinal.chatting.model.ChatDto;
import com.kh.ojungFinal.chatting.model.ChatMemberDto;

@Repository
public class ProjectChatDaoImpl implements ProjectChatDao{
	@Autowired
	SqlSession sqlSession;
	
	private String ns = "ProjectChat.";
	
	@Override
	public ChatDto checkRoom(String name) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getRoom",name);
	}

	@Override
	public int createChatRoom(ChatDto dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(ns+"createChatRoom",dto);
	}

	@Override
	public List<ChatDto> getRoomList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"getRoomList");
	}

	@Override
	public void addRoomMember(ChatMemberDto mem) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(ns+"addRoomMember",mem);
	}

	@Override
	public ChatMemberDto getRoomMember(ChatMemberDto mem) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getRoomMember",mem);
	}

	@Override
	public List<ChatMemberDto> sameRoomList(ChatMemberDto mem) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"sameRoomList",mem);
	}

	@Override
	public int updateRoomMember(ChatMemberDto mem) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(ns+"updateRoomMember",mem);
	}

	@Override
	public void deleteRoomMember(ChatMemberDto mem) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(ns+"deleteRoomMember", mem);
	}

	@Override
	public void updateChatCountInc(ChatDto dto) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(ns+"updateChatCountInc", dto);
	}

	@Override
	public void updateChatCountDec(ChatDto dto) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(ns+"updateChatCountDec",dto);
	}

	@Override
	public void deleteChat() throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(ns+"deleteChat");
	}

	@Override
	public List<ChatDto> searchRoomList(String name) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"searchRoomList", name);
	}

	@Override
	public int selectRoomNum(String userName) throws Exception {
		return sqlSession.selectOne(ns+"selectRoomNum", userName);
	}

	@Override
	public String selcetFilePath(int roomNum) throws Exception {
		return sqlSession.selectOne(ns+"selcetFilePath", roomNum);
	}

}