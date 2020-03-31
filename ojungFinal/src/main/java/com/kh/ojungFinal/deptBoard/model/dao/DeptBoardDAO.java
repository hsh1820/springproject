package com.kh.ojungFinal.deptBoard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.deptBoard.model.vo.DeptBoard;
import com.kh.ojungFinal.deptBoard.model.vo.DeptBoardFile;
import com.kh.ojungFinal.deptBoard.model.vo.DeptBoardReply;

@Repository("deptBoardDAO")
public class DeptBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 부서명 조회용 DAO
	 * @param deptCode
	 * @return deptName
	 * @throws Exception
	 */
	public String selectDept(String deptCode) throws Exception {
		return sqlSession.selectOne("deptBoardMapper.selectDept",deptCode);
	}


	/** 게시글 수 조회용DAO
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getListCount(Map<String, String> map) throws Exception {
		return sqlSession.selectOne("deptBoardMapper.getListCount",map);
	}
	
	/** 부서게시판 목록 조회용  DAO
	 * @param deptCode
	 * @return selectList
	 * @throws Exception
	 */
	public List<DeptBoard> selectList(Map<String, String> map, PageInfo pInf) throws Exception{
		int offset = (pInf.getCurrentPage() -1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("deptBoardMapper.selectList",map, rowBounds);
	}
	
	
	/** 부서게시판 상세조회용 DAO
	 * @param no
	 * @return Notice
	 * @throws Exception
	 */
	public DeptBoard selectDeptBoard(int no) throws Exception{
		return sqlSession.selectOne("deptBoardMapper.selectDeptBoard", no);
	}
	
	/** 부서게시판 조회수 DAO
	 * @param no
	 * @return increaseCount
	 * @throws Exception
	 */
	public int increaseCount(int no) throws Exception{
		return sqlSession.update("deptBoardMapper.increaseCount", no);
	}


	public int selectNextNo() throws Exception {
		return sqlSession.selectOne("deptBoardMapper.selectNextNo");
	}


	public int insertDeptBoard(DeptBoard deptBoard) throws Exception{
		return sqlSession.insert("deptBoardMapper.insertBoard", deptBoard);
	}
	
	public int insertDeptBoardFile(DeptBoardFile files) throws Exception{
		return sqlSession.insert("deptBoardMapper.insertDeptBoardFile",files);
	}

	public DeptBoard updateForm(Integer no)throws Exception {
		return sqlSession.selectOne("deptBoardMapper.selectDeptBoard", no);
	}
	
	public int updateDeptBoard(DeptBoard deptBoard) throws Exception{
		return sqlSession.update("deptBoardMapper.updateBoard",deptBoard);
	}


	public int deleteDeptBaord(Integer no)throws Exception {
		return sqlSession.update("deptBoardMapper.deleteBoard",no);
	}


	/** 게시글 상세보기 - 파일 조회
	 * @param no
	 * @return deptBoardFile
	 * @throws Exception
	 */
	public List<DeptBoardFile> selectFiles(Integer no)throws Exception {
		return sqlSession.selectList("deptBoardMapper.selectFiles",no);
	}


	public int updateDeptBoardFile(DeptBoardFile df)throws Exception {
		return sqlSession.update("deptBoardMapper.updateDeptBoardFile",df);
	}


	public int insertReply(DeptBoardReply reply) throws Exception {
		return sqlSession.insert("deptBoardMapper.insertReply",reply);
	}


	public List<DeptBoardReply> selectReplyList(int boardNo){
		return sqlSession.selectList("deptBoardMapper.selectReply",boardNo);
	}


	public int deleteReply(int replyNo) throws Exception {
		return sqlSession.update("deptBoardMapper.deleteReply",replyNo);
	}


	public int updateReply(DeptBoardReply reply) throws Exception{
		return sqlSession.update("deptBoardMapper.updateReply",reply);
	}


	public int replyCount(int boardNo) {
		return sqlSession.selectOne("deptBoardMapper.replyCount", boardNo);
	}



}
