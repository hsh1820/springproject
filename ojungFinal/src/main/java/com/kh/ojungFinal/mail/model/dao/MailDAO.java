package com.kh.ojungFinal.mail.model.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.mail.model.vo.Mail;

@Repository
public class MailDAO {
	private String ns = "mailMapper.";
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int countMailList(int memberNo) {
		return sqlSession.selectOne(ns+"countMailList",memberNo);
	}
	
	public int insertMailList(Mail mail) {
		return sqlSession.insert(ns+"insertMailList",mail);
	}

	public List<Mail> selectMailList(int memberNo) {
		return sqlSession.selectList(ns+"selectMailList",memberNo);
	}

	public Mail selectMailBoard(int no) {
		return sqlSession.selectOne(ns+"selectMailBoard",no);
	}

	public int getListCount(Map<String, Object> map) {
		return sqlSession.selectOne(ns+"getListCount",map);
	}

	public List<Mail> selectList(int memberNo) {
		return sqlSession.selectList(ns+"selectList", memberNo);
	}

	public int updateMailBoard(int no) {
		return sqlSession.update(ns+"updateMailBoard",no);
	}
	
	public int selectReadMail(int no) {
		return sqlSession.selectOne(ns+"selectReadMail", no);
	}

	public int deleteThisMail(int no) {
		return sqlSession.update(ns+"deleteThisMail", no);
	}

}
