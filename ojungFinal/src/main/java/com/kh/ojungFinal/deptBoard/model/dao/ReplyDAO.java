package com.kh.ojungFinal.deptBoard.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ojungFinal.deptBoard.model.vo.DeptBoardReply;


@Repository("replyDAO")
public class ReplyDAO {

	
	@Autowired 
	private SqlSession sqlSession; 
	
	public int insertReply(DeptBoardReply reply) throws Exception {
		return sqlSession.insert("replyMapper.insertReply",reply);
	}

}
