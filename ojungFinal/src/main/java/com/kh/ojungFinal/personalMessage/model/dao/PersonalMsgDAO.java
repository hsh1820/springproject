package com.kh.ojungFinal.personalMessage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.personalMessage.model.vo.PersonalMsg;

@Repository("PersonalMsgDAO")
public class PersonalMsgDAO {
	

	@Autowired	// 의존성 주입 
	private SqlSessionTemplate sqlSession;
	
	


	public List<PersonalMsg> selectMsgList(int memberNo) throws Exception{
		return sqlSession.selectList("PersonalMsg.selectMsgList",memberNo);
	}




	public int sendReply(PersonalMsg personalMsg) throws Exception{
		return sqlSession.insert("PersonalMsg.sendReply", personalMsg);
	}




	public int msgStausUpdate(PersonalMsg personalMsg) throws Exception {
		return sqlSession.update("PersonalMsg.msgStausUpdate", personalMsg);
	}




	public List<Member> selectDepartment(String radiovalue) throws Exception {
		return sqlSession.selectList("PersonalMsg.msgSelectList",radiovalue);
	}




	public int sendNewMsg(PersonalMsg personalMsg) throws Exception {
		
		return sqlSession.insert("PersonalMsg.sendNewMsg", personalMsg);
	}




	public List<PersonalMsg> searchMsgList(Map<String, Object> map) {
		return sqlSession.selectList("PersonalMsg.searchMsgList",map);
	}
	
	

}
