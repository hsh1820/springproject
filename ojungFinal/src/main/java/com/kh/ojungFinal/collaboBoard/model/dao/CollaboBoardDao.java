package com.kh.ojungFinal.collaboBoard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.collaboBoard.model.vo.CollaboBoard;
import com.kh.ojungFinal.collaboBoard.model.vo.CollaboCmmt;
import com.kh.ojungFinal.collaboBoard.model.vo.CollaboFile;
import com.kh.ojungFinal.collaboBoard.model.vo.DeptList;
import com.kh.ojungFinal.common.vo.PageInfo;

@Repository
public class CollaboBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String ns = "collaboMapper.";

	/** 협업 게시판 게시글 수 조회용 DAO(검색 포함)
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	public int getListCount(Map<String, Object> map)throws Exception{
		return sqlSession.selectOne(ns + "getListCount", map);
	}

	/** 협업 게시판 목록 조회용 DAO
	 * @param map
	 * @param pInf
	 * @return list<CollaboBoard>
	 */
	public List<CollaboBoard> selectList(Map<String, Object> map, PageInfo pInf) throws Exception {
		int offset = (pInf.getCurrentPage() -1) * pInf.getLimit();
		RowBounds rowbounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList(ns+"selectList", map, rowbounds);
	}

	/** 협업 게시판 상세 조회용 DAO
	 * @param collaboNo
	 * @return CollaboBoard
	 * @throws Exception
	 */
	public CollaboBoard selectCollaboBoard(int no)throws Exception {
		return sqlSession.selectOne(ns+"selectCollaboBoard",no);
	}

	/** 협업 게시판 상세글 조회수 증가 DAO
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public int increaseCount(int no) throws Exception{
		return sqlSession.update(ns+"increaseCount",no);
	}

	/** 협업 게시판 상세글 요청 부서 리스트 조회용 DAO
	 * @param deptName
	 * @return deptList
	 * @throws Exception
	 */
	public List<DeptList> selectDeptList(String deptCode) throws Exception {
		return sqlSession.selectList(ns+"selectDeptList",deptCode);
	}

	public List<Member> selectDept() throws Exception{
		return sqlSession.selectList(ns+"selectDept");
	}

	public int selectNextNo(CollaboBoard cBoard) throws Exception{
	      return sqlSession.selectOne(ns+"selectNextNo", cBoard);
   }

	public int insertCboard(CollaboBoard cBoard)throws Exception {
		return sqlSession.insert(ns+"insertCboard",cBoard);
	}

	public List<CollaboFile> selectCollaboFiles(int no) throws Exception{
		return sqlSession.selectList(ns+"selectCollaboFiles",no);
	}

	public int updateAccept(CollaboBoard cBoard) throws Exception {
		return sqlSession.update(ns+"updateAccept", cBoard);
	}

	public int updateReject(CollaboBoard cBoard) throws Exception{
		return sqlSession.update(ns+"updateReject", cBoard);
	}

	public int selectCmmtCount(int collaboNo) throws Exception{
		return sqlSession.selectOne(ns+"selectCmmtCount",collaboNo);
	}

	public List<CollaboFile> selectFiles(Integer no)throws Exception {
		return sqlSession.selectList(ns+"selectFiles",no);
	}

	public int updateDetail(CollaboBoard cBoard) throws Exception{
		return sqlSession.update(ns+"updateDetail",cBoard);
	}

	public int deleteDetail(Integer no) throws Exception{
		return sqlSession.update(ns+"deleteDetail", no);
	}

	public int insertReply(CollaboCmmt reply) throws Exception{
		return sqlSession.insert(ns+"insertReply", reply);
	}

	public int deleteReply(int collaboCmmtNo) throws Exception{
		return sqlSession.update(ns+"deleteReply", collaboCmmtNo);
	}

	public int updateReply(CollaboCmmt reply) throws Exception{
		return sqlSession.update(ns+"updateReply",reply);
	}

	public int replyCount(int collaboNo) throws Exception{
		return sqlSession.selectOne(ns+"replyCount",collaboNo);
	}

	public List<CollaboCmmt> selectReplyList(int collaboNo) throws Exception{
		return sqlSession.selectList(ns+"selectReplyList",collaboNo);
	}

	public int selectCurrNo() throws Exception{
		return sqlSession.selectOne(ns+"selectCurrNo");
	}

	public List<CollaboBoard> selectEmailList(int collaboNo) throws Exception{
		return sqlSession.selectList(ns+"selectEmailList",collaboNo);
	}

	public int updateCollaboFile(CollaboFile cff) {
		return sqlSession.update(ns+"updateCollaboFile",cff);
	}

	public int insertCollaboFile(CollaboFile cff) {
		return sqlSession.insert(ns+"insertCollaboFile",cff);
	}
	public List<CollaboFile> selectFile(int collaboNo) {
	    return sqlSession.selectList(ns+"selectFile",collaboNo);
	}
	
}
