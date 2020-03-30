package com.kh.ojungFinal.personalMessage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.personalMessage.model.vo.PersonalMsg;

public interface PersonalMsgService {

	

	/** 쪽지함 목록 조회용 Service(검색 포함)
	 * @param personalMsg
	 * @return list 
	 * @throws Exception
	 */
	public abstract List<PersonalMsg> selectMsgList(int memberNo) throws Exception;

	
	
	
	/** 쪽지 답장용 Service
	 * @param personalMsg
	 * @return result 
	 * @throws Exception
	 */
	public abstract int sendReply(PersonalMsg personalMsg) throws Exception;



	/** 쪽지 작성 중 수신인 선택 Service
	 * @param radiovalue
	 * @return result 
	 * @throws Exception
	 */
	public abstract List<Member> selectDepartment(String radiovalue) throws Exception;



	/** 쪽지 발송용 Service
	 * @param personalMsg
	 * @return result 
	 * @throws Exception
	 */
	public abstract int sendNewMsg(PersonalMsg personalMsg) throws Exception;




	public abstract List<PersonalMsg> searchMsgList(Map<String, Object> map) throws Exception;




	
}
