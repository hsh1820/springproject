package com.kh.ojungFinal.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.deptBoard.model.vo.DeptBoardReply;
import com.kh.ojungFinal.notice.model.vo.Notice;
import com.kh.ojungFinal.notice.model.vo.NoticeFile;
import com.kh.ojungFinal.notice.model.vo.NoticeReply;
import com.kh.ojungFinal.notice.model.vo.NoticeView;

@Repository("noticeDAO")
public class NoticeDAO {

	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	
	/** 공지사항 게시글 수 조회용 DAO(검색 포함)
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	public int getListCount(Map<String, String> map) {
		return sqlSession.selectOne("noticeMapper.getListCount", map);
	}


	/** 공지사항 목록 조회용 DAO(검색 포함, 사내공지)
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public List<NoticeView> selectList(Map<String, String> map) {
		/*
		 * int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		 * 
		 * RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		 */
		
		return sqlSession.selectList("noticeMapper.selectList", map);
	}
	
	
	/** 공지사항 목록 조회용 DAO(검색 포함, 부서공지)
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	public List<NoticeView> selectNlist(Map<String, String> map, PageInfo pInf) {
		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		
		return sqlSession.selectList("noticeMapper.selectNlist", map, rowBounds);
	}


	/** 다음 글 번호
	 * @param notice
	 * @return
	 * @throws Exception
	 */
	public int selectNextNo(NoticeView noticeView) throws Exception{
		return sqlSession.selectOne("noticeMapper.selectNextNo");
	}



	/** 공지사항 상세 조회용 DAO
	 * @param no
	 * @return
	 * @throws Exception
	 */
	public NoticeView selectNotice(Integer no) throws Exception{
		return sqlSession.selectOne("noticeMapper.selectNotice", no);
	}


	/** 공지사항 조회수용 DAO
	 * @param no
	 * @return
	 * @throws Exception
	 */
	public int increaseCount(Integer no) throws Exception{
		return sqlSession.update("noticeMapper.increaseCount", no);
	}


	/** 게시글 수정
	 * @param notice
	 * @return
	 * @throws Exception
	 */
	public int updateNotice(NoticeView noticeView) throws Exception{
		return sqlSession.update("noticeMapper.updateNotice", noticeView);
	}
	
	
	/** 공지사항 삭제
	 * @param no
	 * @return
	 * @throws Exception
	 */
	public int deleteNotice(Integer no) throws Exception {
		return sqlSession.update("noticeMapper.deleteNotice", no);
	}


	/** 게시글 등록용 DAO 첨부파일
	 * @param board
	 * @return
	 * @throws Exception
	 */
	public int insertNotice(NoticeView noticeView) throws Exception{
		return sqlSession.insert("noticeMapper.insertNotice", noticeView);
	}


	/** 파일 삽입용 DAO 첨부파일
	 * @param at
	 * @return result
	 * @throws Exception
	 */
	public int insertNoticeFile(NoticeFile nf) throws Exception{
		return sqlSession.insert("noticeMapper.insertNoticeFile", nf);
	}


	/** 이미지 목록 조회
	 * @param no
	 * @return
	 * @throws Exception
	 */
	public List<NoticeFile> selectFile(Integer no) throws Exception{
		return sqlSession.selectList("noticeMapper.selectFile", no);
	}


	/** 파일 수정용
	 * @param nf
	 * @return
	 * @throws Exception
	 */
	public int updateNoticeFile(NoticeFile nf) throws Exception{
		return sqlSession.update("noticeMapper.updateNoticeFile", nf);
	}


	/** 댓글 등록용 DAO
	 * @param noticeReply
	 * @return result
	 * @throws Exception
	 */
	public int insertReply(NoticeReply noticeReply) throws Exception{
		return sqlSession.insert("noticeMapper.insertReply", noticeReply);
	}


	/** 댓글 목록용 DAO
	 * @param noticeNo
	 * @return
	 */
	public List<NoticeReply> selectReplyList(int noticeNo) {
		return sqlSession.selectList("noticeMapper.selectReply", noticeNo);
	}


	public int deleteReply(int noticeNo) throws Exception {
		return sqlSession.update("noticeMapper.deleteReply",noticeNo);
	}


	public int updateReply(NoticeReply reply) throws Exception{
		return sqlSession.update("noticeMapper.updateReply",reply);
	}


	public int replyCount(int noticeNo) {
		return sqlSession.selectOne("noticeMapper.replyCount", noticeNo);
	}

	
	


}
