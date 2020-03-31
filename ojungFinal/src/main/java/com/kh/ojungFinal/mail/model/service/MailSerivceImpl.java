package com.kh.ojungFinal.mail.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;

import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.mail.model.dao.MailDAO;
import com.kh.ojungFinal.mail.model.vo.Mail;

import oracle.net.aso.p;

@Service
public class MailSerivceImpl implements MailService {

	@Autowired
	private MailDAO mailDAO;
	
	
	
	@Override
	public int insertMailList(List<Mail> mList) {
		// 메일테이블에 있는 갯수 구하기
		int memberNo = mList.get(0).getMemberNo();
		System.out.println("memberNo : " + memberNo);
		int count =  mailDAO.countMailList(memberNo); 
		int result = 0;

		if(count > 0)
		{
			mList = mList.subList(count, mList.size());
		}

		if(!mList.isEmpty()) {
			// 리스트에서 카운트 갯수 얻어와서 해당 행에있는 메시지 넣기
			for(Mail m : mList) {
				result = mailDAO.insertMailList(m);
			}
			
		}else {
			result = -1;
		}
		
			if(result>0) {
	    		System.out.println("메일 insert 성공"); 
	    	}else if(result== -1)  {
	            System.out.println("메일 insert 할 거 없음");
	    	}else {
	    		System.out.println("메일 insert 실패");
	    		
	    	}
			
			
			
			return result;
		}

	@Override
	public Mail selectMailBoard(int no) {
		int result = mailDAO.updateMailBoard(no);
		Mail mail = new Mail();
				
		if(result >  0) {
			mail = mailDAO.selectMailBoard(no);
		}
		return mail;
	}
	
	@Override
	public int getListCount(Map<String, Object> map) {
		return mailDAO.getListCount(map);
	}

	@Override
	public List<Mail> selectList(int memberNo) {
		return mailDAO.selectList(memberNo);
	}

	@Override
	public List<Mail> selectMailList(int memberNo) {
		return mailDAO.selectMailList(memberNo);
	}

	@Override
	public int deleteThisMail(int no) throws Exception {
		return mailDAO.deleteThisMail(no);
	}

	@Override
	public int updateMailBoard(int no) throws Exception {
		return mailDAO.updateMailBoard(no);
	}
	
	}
