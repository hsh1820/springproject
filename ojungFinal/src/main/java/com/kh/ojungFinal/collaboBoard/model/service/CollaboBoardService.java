package com.kh.ojungFinal.collaboBoard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.collaboBoard.model.vo.CollaboBoard;
import com.kh.ojungFinal.collaboBoard.model.vo.CollaboCmmt;
import com.kh.ojungFinal.collaboBoard.model.vo.CollaboFile;
import com.kh.ojungFinal.collaboBoard.model.vo.DeptList;
import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.mail.model.vo.Mail;

public interface CollaboBoardService {

	public abstract int getListCount(Map<String, Object> map) throws Exception;

	public abstract List<CollaboBoard> selectList(Map<String, Object> map, PageInfo pInf) throws Exception;

	public abstract CollaboBoard selectCollaboBoard(int no)throws Exception;

	public abstract List<DeptList> selectDeptList(String deptName) throws Exception;

	public abstract List<Member> selectDept()throws Exception;

	//public abstract int selectNextNo() throws Exception;

	public abstract int insertCboard(CollaboBoard cBoard) throws Exception;

	public abstract int insertCollaboFile(CollaboFile cff) throws Exception;

	public abstract List<CollaboFile> selectCollaboFiles(int no) throws Exception;

	public abstract int updateAccept(int cNo, int memberNo, int taskConfirm)throws Exception;

	public abstract List<CollaboFile> selectFiles(Integer no)throws Exception;

	public abstract int updateDetail(CollaboBoard cBoard, List<MultipartFile> fileUpload, String filePath)throws Exception;

	public abstract int deleteDetail(Integer no)throws Exception;

	public abstract int insertReply(CollaboCmmt reply)throws Exception;

	public abstract int deleteReply(int replyNo)throws Exception;

	public abstract int updateReply(CollaboCmmt reply)throws Exception;

	public abstract int replyCount(int collaboNo)throws Exception;

	public abstract List<CollaboCmmt> selectReplyList(int collaboNo)throws Exception;

	public abstract List<CollaboBoard> selectEmailList(int bNo)throws Exception;



}
