package com.kh.ojungFinal.mail.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.mail.model.vo.Mail;

public interface MailService {

	public abstract int insertMailList(List<Mail> mList)throws Exception;

	public abstract Mail selectMailBoard(int no)throws Exception;

	public abstract int getListCount(Map<String, Object> map)throws Exception;

	public abstract List<Mail> selectList(int memberNo)throws Exception;

	public abstract List<Mail> selectMailList(int memberNo)throws Exception;

	public abstract int deleteThisMail(int no) throws Exception;

	public abstract int updateMailBoard(int no) throws Exception;
	
}
