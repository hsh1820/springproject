package com.kh.ojungFinal.personalMessage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.personalMessage.model.dao.PersonalMsgDAO;
import com.kh.ojungFinal.personalMessage.model.vo.PersonalMsg;

@Service("personalMsgService")
public class PersonalMsgServiceImpl implements PersonalMsgService {
	
	@Autowired
	private PersonalMsgDAO personalMsgDAO;

	
	
	/** 쪽지 목록 조회용 Service(검색 포함)
	 * @param map
	 * @param pInf
	 * @return list 
	 * @throws Exception
	 */
	@Override
	public List<PersonalMsg> selectMsgList(int memberNo) throws Exception {
		
		
		return personalMsgDAO.selectMsgList(memberNo);
	}



	/** 쪽지 답장용 Service
	 * @param personalMsg
	 * @return result 
	 * @throws Exception
	 */
	@Override
	public int sendReply(PersonalMsg personalMsg) throws Exception {
		
		int sendReply = personalMsgDAO.sendReply(personalMsg);
		
		if (sendReply > 0) {
			int statusUpdate = personalMsgDAO.msgStausUpdate(personalMsg);
		}
		return personalMsgDAO.msgStausUpdate(personalMsg);
	}



	/** 쪽지 작성 중 수신인 선택 Service
	 * @param radiovalue
	 * @return result 
	 * @throws Exception
	 */
	@Override
	public List<Member> selectDepartment(String radiovalue) throws Exception {
		List<Member> mList = personalMsgDAO.selectDepartment(radiovalue);
		
		return mList;
	}


	/** 쪽지 발송용 Service
	 * @param personalMsg
	 * @return result 
	 * @throws Exception
	 */
	@Override
	public int sendNewMsg(PersonalMsg personalMsg) throws Exception {
		return  personalMsgDAO.sendNewMsg(personalMsg);
	}



	@Override
	public List<PersonalMsg> searchMsgList(Map<String, Object> map) throws Exception {
		return personalMsgDAO.searchMsgList(map);
	}



	
	
	
	
}
