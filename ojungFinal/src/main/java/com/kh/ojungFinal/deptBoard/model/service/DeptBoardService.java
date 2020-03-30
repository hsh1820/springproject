package com.kh.ojungFinal.deptBoard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.deptBoard.model.vo.DeptBoard;
import com.kh.ojungFinal.deptBoard.model.vo.DeptBoardFile;
import com.kh.ojungFinal.deptBoard.model.vo.DeptBoardReply;

public interface DeptBoardService {

	/** 부서명 조회용 Service
	 * @param deptCode
	 * @return deptName
	 * @throws Exception
	 */
	public abstract String selectDept(String deptCode) throws Exception;
	
	/** 게시글 수 조회용 Service
	 * @param map
	 * @return count
	 * @throws Exception
	 */
	public abstract int getListCount(Map<String, String> map)throws Exception;

	
	/** 부서 게시판 목록 조회용 Service
	 * @param deptCode
	 * @return List
	 * @throws Exception
	 */
	public abstract List<DeptBoard> selectList(Map<String, String> map, PageInfo pInf) throws Exception;

	
	/** 부서 게시판  상세 조회용 Service
	 * @param deptBoardNo
	 * @return no
	 * @throws Exception
	 */
	public abstract DeptBoard selectDeptBoard(int no) throws Exception;

	/** 게시글 상세보기 - 파일 조회
	 * @param no
	 * @return deptBoardFile
	 * @throws Exception
	 */
	public abstract List<DeptBoardFile> selectFiles(Integer no) throws Exception;
	
	/** 부서 게시판  입력동작 Service
	 * @param deptBoard
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertDeptBoard(DeptBoard deptBoard, List<DeptBoardFile> files) throws Exception;

	/** 부서게시판 수정폼 조회 Service
	 * @param no
	 * @return deptBoard
	 * @throws Exception
	 */
	public abstract DeptBoard updateForm(Integer no) throws Exception;
	
	/** 부서 게시판 수정 동작  Service
	 * @param deptBoard
	 * @return result
	 * @throws Exception
	 */
	public abstract int updateDeptBoard(DeptBoard deptBoard, List<MultipartFile> deptBoardfile, String savePath ) throws Exception;

	
	/** 부서 게시판 삭제용 Service
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public abstract int deleteDeptBaord(Integer no) throws Exception;

	/** 댓글 삽입 
	 * @param reply
	 * @return
	 * @throws Exception
	 */
	public abstract int insertReply(DeptBoardReply reply) throws Exception;

	/** 댓글 리스트 출력
	 * @param boardNo
	 * @return
	 */
	public abstract List<DeptBoardReply> selectReplyList(int boardNo);

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
	public abstract int updateReply(DeptBoardReply reply) throws Exception;

	/** 댓글 수 카운트
	 * @param boardNo
	 * @return
	 * @throws Exception
	 */
	public abstract int replyCount(int boardNo) throws Exception;



}
