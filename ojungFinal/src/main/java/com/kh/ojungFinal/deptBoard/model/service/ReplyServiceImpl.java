package com.kh.ojungFinal.deptBoard.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ojungFinal.deptBoard.model.dao.ReplyDAO;
import com.kh.ojungFinal.deptBoard.model.vo.DeptBoardReply;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired ReplyDAO replyDAO;

	@Override
	public int insertReply(DeptBoardReply reply) throws Exception {
		return replyDAO.insertReply(reply);
	}



}
