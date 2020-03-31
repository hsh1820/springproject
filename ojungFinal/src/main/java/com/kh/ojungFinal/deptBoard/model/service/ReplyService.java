package com.kh.ojungFinal.deptBoard.model.service;

import com.kh.ojungFinal.deptBoard.model.vo.DeptBoard;
import com.kh.ojungFinal.deptBoard.model.vo.DeptBoardReply;

public interface ReplyService {

	/** 댓글 등록용 service
	 * @param reply
	 * @throws Exception
	 */
	public int insertReply(DeptBoardReply reply) throws Exception;

}
