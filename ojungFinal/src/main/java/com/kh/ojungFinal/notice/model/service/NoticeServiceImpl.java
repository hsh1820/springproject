package com.kh.ojungFinal.notice.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ojungFinal.common.FileRename;
import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.notice.model.dao.NoticeDAO;
import com.kh.ojungFinal.notice.model.vo.NoticeFile;
import com.kh.ojungFinal.notice.model.vo.NoticeReply;
import com.kh.ojungFinal.notice.model.vo.NoticeView;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;

	/**
	 * 공지사항 게시글 수 조회용 Service(검색 포함)
	 * 
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	@Override
	public int getListCount(Map<String, String> map) throws Exception {
		return noticeDAO.getListCount(map);
	}

	/**
	 * 공지사항 목록 조회용 Service(검색 포함, 사내공지)
	 * 
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<NoticeView> selectList(Map<String, String> map) throws Exception {
		return noticeDAO.selectList(map);
	}

	/**
	 * 공지사항 목록 조회용 Service(검색 포함, 부서공지)
	 * 
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<NoticeView> selectNlist(Map<String, String> map, PageInfo pInf) throws Exception {
		return noticeDAO.selectNlist(map, pInf);
	}
	

	/**
	 * 공지사항 수정화면 출력
	 * 
	 * @param no
	 * @return
	 * @throws Exception
	 */
	@Override
	public NoticeView updateForm(Integer no) throws Exception {

		NoticeView noticeView = noticeDAO.selectNotice(no);

		noticeView.setNoticeContent(noticeView.getNoticeContent().replace("<br>", "\r\n"));

		return noticeView;
	}


	/**
	 * 공지사항 삭제
	 * 
	 * @param no
	 * @return
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteNotice(Integer no) throws Exception {

		int result = noticeDAO.deleteNotice(no);

		return result;
	}

	/**
	 * 게시글 등록용 Service (첨부파일)
	 * @param board
	 * @param files
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertNotice(NoticeView noticeView, List<NoticeFile> files) throws Exception {

		int result = 0;

		// 1) 다음 SEQ_BNO 얻어오기
		int noticeNo = noticeDAO.selectNextNo(noticeView);

		// 2) 게시글(board) DB 삽입
		if (noticeNo > 0) {
			// DB에 Content 저장 시 개행문자를 <br>로 변경
			noticeView.setNoticeContent(noticeView.getNoticeContent().replace("\r\n", "<br>"));

			// 조회한 boardNo를 board에 set
			noticeView.setNoticeNo(noticeNo);
			// title, content, writer, boardNo

			// 게시글 DB 등록
			result = noticeDAO.insertNotice(noticeView);
		}

		// 3) 이미지(attachment) DB 삽입
		if (result > 0 && !files.isEmpty()) {
			result = 0;
			
			for(NoticeFile nf : files) {
				nf.setNoticeNo(noticeNo);
				result = noticeDAO.insertNoticeFile(nf);
				
				if(result == 0) {
					throw new Exception();
				}
			}
		} if (result > 0) {
			// result에 글번호 저장
			result = noticeNo;
		}

		return result;
	}

	/**
	 * 이미지 목록 조회
	 * @param no
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<NoticeFile> selectFile(Integer no) throws Exception {
		return noticeDAO.selectFile(no);
	}

	/**
	 * 조회수
	 * 
	 * @param no
	 * @return
	 * @throws Exception
	 */
	@Override
	public int increaseCount(Integer no) throws Exception {
		return noticeDAO.increaseCount(no);
	}

	/** 게시글 상세조회
	 * @param no
	 * @return board
	 * @throws Exception
	 */
	@Override
	public NoticeView selectNotice(Integer no) throws Exception {
		return noticeDAO.selectNotice(no);
	}

	/** 게시글 수정용 Service
	 * @param noticeView
	 * @param noticeFile
	 * @param category
	 * @param savePath
	 * @return result 
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateNotice(NoticeView noticeView, List<MultipartFile> noticeFile, String savePath) throws Exception {
		
		List<NoticeFile> files = noticeDAO.selectFile(noticeView.getNoticeNo());
		
		List<NoticeFile> beforeFiles = new ArrayList<NoticeFile>();
		
		for(NoticeFile nf : files) {
			beforeFiles.add(nf);
		}
		
		// 새롭게 삽입할 파일 목록 
		List<NoticeFile> insertList = new ArrayList<NoticeFile>();
		
		// 기존 행을 수정할 파일 목록
		List<NoticeFile> updateList = new ArrayList<NoticeFile>();
		
		NoticeFile file = null;
		
		int filesIndex = 0;
		
		for(int i=0; i<noticeFile.size(); i++) {
			
			if(!noticeFile.get(i).getOriginalFilename().equals("")) {
				
				String changeFileName = FileRename.rename(noticeFile.get(i).getOriginalFilename());
				
				// 일반 이미지가 기존에 있을 경우 -> update
				if(beforeFiles.size() > 0 && i<beforeFiles.size()) {
					file = new NoticeFile(beforeFiles.get(filesIndex).getFileNo(), noticeFile.get(i).getOriginalFilename(),changeFileName);
					
					updateList.add(file);
					filesIndex++;
					
				} else { // 일반 이미지가 기존에 없을 경우 -> insert 
					file = new NoticeFile(noticeFile.get(i).getOriginalFilename(), changeFileName, savePath);
					
					file.setNoticeNo(noticeView.getNoticeNo());
					// 신규 파일은 boardId가 없으므로 추가
					insertList.add(file);
				}
			}
		}
		
		int result = 0;
		
		result = noticeDAO.updateNotice(noticeView);
		
		// 2) 게시글 수정 성공 & 새로 삽입할 파일(insertList)가 있을 경우
		if(result > 0 && !insertList.isEmpty()) {
			result = 0; // result 재활용
			
			for(NoticeFile nf : insertList) {
				result = noticeDAO.insertNoticeFile(nf);
				
				if(result == 0) {
					throw new Exception("파일 삽입 과정에서 오류 발생");
				}
			}
		}
		
		// 3) 기존 Attachment 테이블 수정할 파일정보(updateList)가 있을 경우
		if(result > 0 && !updateList.isEmpty()) {
			result = 0; // result 재활용
			
			for(NoticeFile nf : updateList) {
				result = noticeDAO.updateNoticeFile(nf);
				
				if(result == 0) {
					throw new Exception("파일 수정 과정에서 오류 발생");
				}
			}
		}
		
		// 4) DB 수정이 정상적으로 처리된 경우 파일 저장
		if(result > 0) {
			// insertList, updateList를 하나의 List로 합치기
			insertList.addAll(updateList);
			
			for(NoticeFile nf : insertList) {
					for(MultipartFile mf : noticeFile) {
						
						if(mf.getOriginalFilename().equals(nf.getFileOriginName())) {
							//    진짜 파일                                                      파일 정보
							// Attachment쪽의 원래 이름과 바뀐 이름(파일 정보)을 갖고와서 진짜 파일의 이름과 같으면 매핑
							
							mf.transferTo(new File(savePath + "/" + nf.getFileChangeName()));
							break;
						}
					}
				}
			}
		
		// 수정 전 이미지를 서버에서 삭제
		for(NoticeFile nf : files) {
			for(NoticeFile newFile : insertList) {
				
				if(nf.getFileNo() == newFile.getFileNo()) {
					
					File deleteFile = new File(savePath + "/" + nf.getFileChangeName());
					deleteFile.delete();
				}
			}
		}
		
		return result;
	}

	
	/** 댓글 등록용 Service
	 * @param reply
	 * @return result 
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReply(NoticeReply noticeReply) throws Exception{
		
		//noticeReply.setNoticeReplyContent(noticeReply.getNoticeReplyContent().replace("\r\n", "<br>"));
		
		return noticeDAO.insertReply(noticeReply);
	}

	/** 댓글 목록용 Service
	 * @param noticeNo
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<NoticeReply> selectReplyList(int noticeNo){
		return noticeDAO.selectReplyList(noticeNo);
	}
	
	@Override
	public int deleteReply(int replyNo) throws Exception {
		return noticeDAO.deleteReply(replyNo);
	}

	@Override
	public int updateReply(NoticeReply reply) throws Exception {
		return noticeDAO.updateReply(reply);
	}

	@Override
	public int replyCount(int noticeNo) throws Exception {
		return noticeDAO.replyCount(noticeNo);
	}

	@Override
	public int insertNotice(NoticeView noticeView) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	
	

	


	/*
	 * @Override public int deleteReply(int replyNo) throws Exception { return
	 * deptBoardDAO.deleteReply(replyNo); }
	 * 
	 * @Override public int updateReply(DeptBoardReply reply) throws Exception {
	 * return deptBoardDAO.updateReply(reply); }
	 * 
	 * @Override public int replyCount(int boardNo) throws Exception { return
	 * deptBoardDAO.replyCount(boardNo); }
	 */
	

}
