package com.kh.ojungFinal.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.deptBoard.model.vo.DeptBoardReply;
import com.kh.ojungFinal.notice.model.vo.Notice;
import com.kh.ojungFinal.notice.model.vo.NoticeFile;
import com.kh.ojungFinal.notice.model.vo.NoticeReply;
import com.kh.ojungFinal.notice.model.vo.NoticeView;

public interface NoticeService {

	/**
	 * 공지사항 게시글 수 조회용 Service(검색 포함)
	 * 
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	public abstract int getListCount(Map<String, String> map) throws Exception;

	/**
	 * 공지사항 목록 조회용 Service(검색 포함, 사내공지)
	 * 
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public abstract List<NoticeView> selectList(Map<String, String> map) throws Exception;
	
	/**
	 * 공지사항 목록 조회용 Service(검색 포함, 부서공지)
	 * 
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public abstract List<NoticeView> selectNlist(Map<String, String> map, PageInfo pInf)throws Exception;


	/**
	 * 공지사항 상세조회용 Service
	 * 
	 * @param no
	 * @return notice
	 * @throws Exception
	 */
	public abstract NoticeView selectNotice(Integer no) throws Exception;

	/**
	 * 공지사항 수정화면 출력
	 * 
	 * @param no
	 * @return
	 * @throws Exception
	 */
	public abstract NoticeView updateForm(Integer no) throws Exception;


	/**
	 * 공지사항 삭제
	 * 
	 * @param no
	 * @return
	 * @throws Exception
	 */
	public abstract int deleteNotice(Integer no) throws Exception;

	/**
	 * 게시글 등록(첨부파일)
	 * 
	 * @param noticeView
	 * @param nFile
	 * @return
	 * @throws Exception
	 */
	public abstract int insertNotice(NoticeView noticeView, List<NoticeFile> files) throws Exception;

	
	/** 이미지 목록 조회
	 * @param no
	 * @return
	 * @throws Exception
	 */
	public abstract List<NoticeFile> selectFile(Integer no) throws Exception;

	
	/** 조회수 증가 
	 * @param no
	 * @return 
	 * @throws Exception
	 */
	public abstract int increaseCount(Integer no) throws Exception;

	
	/** 게시글 수정용 Service
	 * @param noticeView
	 * @param noticeFile
	 * @param category
	 * @param savePath
	 * @return result 
	 */
	public abstract int updateNotice(NoticeView noticeView, List<MultipartFile> noticeFile, String savePath) throws Exception;

	/** 댓글 등록용 Service
	 * @param noticeReply
	 * @return
	 */
	public abstract int insertReply(NoticeReply noticeReply)throws Exception;

	/** 댓글 목록용 Service
	 * @param noticeNo
	 * @return
	 * @throws Exception
	 */
	public abstract List<NoticeReply> selectReplyList(int noticeNo);

	/** 댓글 삭제
	 * @param replyNo
	 * @return
	 * @throws Exception
	 */
	public abstract int deleteReply(int replyNo) throws Exception;

	/** 댓글 수정
	 * @param reply
	 * @return
	 * @throws Exception
	 */
	public abstract int updateReply(NoticeReply reply) throws Exception;

	/** 댓글 수 카운트
	 * @param boardNo
	 * @return
	 * @throws Exception
	 */
	public abstract int replyCount(int noticeNo) throws Exception;

	public abstract int insertNotice(NoticeView noticeView) throws Exception;




}
