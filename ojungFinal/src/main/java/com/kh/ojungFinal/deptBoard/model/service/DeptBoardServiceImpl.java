package com.kh.ojungFinal.deptBoard.model.service;

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
import com.kh.ojungFinal.deptBoard.model.dao.DeptBoardDAO;
import com.kh.ojungFinal.deptBoard.model.vo.DeptBoard;
import com.kh.ojungFinal.deptBoard.model.vo.DeptBoardFile;
import com.kh.ojungFinal.deptBoard.model.vo.DeptBoardReply;

@Service("deptBoardService")
public class DeptBoardServiceImpl implements DeptBoardService {

	@Autowired
	private DeptBoardDAO deptBoardDAO;

	/**
	 * 부서명 조회용 Service
	 * 
	 * @param deptCode
	 * @return deptName
	 * @throws Exception
	 */
	@Override
	public String selectDept(String deptCode) throws Exception {
		return deptBoardDAO.selectDept(deptCode);
	}

	/**
	 * 게시글 수 조회용 Service
	 * 
	 * @param map
	 * @return count
	 * @throws Exception
	 */
	@Override
	public int getListCount(Map<String, String> map) throws Exception {
		return deptBoardDAO.getListCount(map);
	}

	/**
	 * 부서 게시판 목록 조회용 Service
	 * 
	 * @param deptCode
	 * @return List
	 * @throws Exception
	 */
	@Override
	public List<DeptBoard> selectList(Map<String, String> map, PageInfo pInf) throws Exception {
		return deptBoardDAO.selectList(map, pInf);
	}

	/**
	 * 부서 게시판 상세 조회용 Service
	 * 
	 * @param deptBoardNo
	 * @return no
	 * @throws Exception
	 */
	@Override
	public DeptBoard selectDeptBoard(int no) throws Exception {
		DeptBoard deptBoard = deptBoardDAO.selectDeptBoard(no);
		if (deptBoard != null) {
			// 정상적으로 조회된 경우 조회수 증가
			int result = deptBoardDAO.increaseCount(no);

			if (result > 0) {
				deptBoard.setBoardCount(deptBoard.getBoardCount() + 1);
			} else {
				deptBoard = null;
			}

		}
		return deptBoard;

	}

	/**
	 * 부서 게시판 입력동작 Service
	 * 
	 * @param deptBoard
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertDeptBoard(DeptBoard deptBoard, List<DeptBoardFile> files) throws Exception {
		int result = 0;

		int boardNo = deptBoardDAO.selectNextNo();
		System.out.println(boardNo);

		if (boardNo > 0) {

			deptBoard.setBoardNo(boardNo);
			deptBoard.setBoardTitle(deptBoard.getBoardTitle());
			deptBoard.setBoardContent(deptBoard.getBoardContent());
			deptBoard.setMemberNo(deptBoard.getMemberNo());
			deptBoard.setDeptCode(deptBoard.getDeptCode());
			/*
			 * System.out.println( "[세팅된 deptBoard ]" + "boardNo :"+ boardNo + "/" +
			 * "boardTitle :" + deptBoard.getBoardTitle() + "/" + "boardContent :"
			 * +deptBoard.getBoardContent() + "/" + "memberNo :"+deptBoard.getMemberNo() +
			 * "/" + "deptCode :"+deptBoard.getDeptCode() );
			 */
			result = deptBoardDAO.insertDeptBoard(deptBoard); // 게시글 삽입 결과
		}
		
		if (result > 0  && files.isEmpty()) { // 게시판 삽입을 성공하고 파일이 없으면  게시글 번호 바로 반환
			result = boardNo;
		}
		if (result > 0 && !files.isEmpty()) { // 게시판 글 내용 삽입 성공했고 파일이 있으면

			for (DeptBoardFile df : files) {

				df.setBoardNo(boardNo); // 게시글 번호 set 
				result = deptBoardDAO.insertDeptBoardFile(df);
				// 해당 게시글에 파일을 삽입하고
				if (result == 0) { // 파일 삽입을 실패했을 경우
					throw new Exception(); // 강제로 예외 발생 시킨 후 던지기
				}
			}
			result = boardNo;
		}


		return result;
	}

	/**
	 * 부서게시판 수정폼 조회 Service
	 * 
	 * @param no
	 * @return deptBoard
	 * @throws Exception
	 */
	@Override
	public DeptBoard updateForm(Integer no) throws Exception {
		return deptBoardDAO.updateForm(no);
	}

	/**
	 * 부서 게시판 수정 동작 Service
	 * 
	 * @param deptBoard
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateDeptBoard(DeptBoard deptBoard, 
			List<MultipartFile> deptBoardfile,
			String savePath) throws Exception {
		// 기존 게시글 파일 정보를 DB에서 조회
				List<DeptBoardFile> files = deptBoardDAO.selectFiles(deptBoard.getBoardNo());
				
				List<DeptBoardFile> beforeFiles = new ArrayList<DeptBoardFile>();

				for (DeptBoardFile df : files) {
						beforeFiles.add(df);
				}

				// 새롭게 삽입할 파일 목록
				List<DeptBoardFile> insertList = new ArrayList<DeptBoardFile>();

				// 기존 행을 수정할 파일 목록
				List<DeptBoardFile> updateList = new ArrayList<DeptBoardFile>();

				DeptBoardFile file = null; // 리스트에 추가될 DeptBoardFile 객체를 참조할 변수 선언

				// 일반 이미지 비교
				int filesIndex = 0;
				// 기존 파일 목록(beforeFiles)에 얻어올 인덱스 값을 저장할 변수 선언

				for (int i = 0; i < files.size(); i++) {
					// 일반 파일 신규 0

					if (!files.get(i).getFileOriginName().equals("")) {
						// rename 처리
						String changeFileName = FileRename.rename(files.get(i).getFileOriginName());

						// 일반 파일 기존에 존재 -> update
						if (beforeFiles.size() > 0 && i < beforeFiles.size()) {
							file = new DeptBoardFile(beforeFiles.get(filesIndex).getFileNo(), files.get(i).getFileOriginName(),
									changeFileName);

							updateList.add(file);
							filesIndex++;
						}

						// 일반 이미지가 기존에 없는 경우 -> insert
						else {
							file = new DeptBoardFile(files.get(i).getFileOriginName(), changeFileName, savePath);
							file.setBoardNo(deptBoard.getBoardNo());
							insertList.add(file);
						}
					}
				}

				int result = 0;

				result = deptBoardDAO.updateDeptBoard(deptBoard);

				// 2) 게시글 수정 성공 & 새로 삽입할 파일(insertList)가 있을 경우
				if (result > 0 && !insertList.isEmpty()) {
					result = 0; // result 재활용

					for (DeptBoardFile df : insertList) {
						result = deptBoardDAO.insertDeptBoardFile(df);

						if (result == 0) {
							throw new Exception("파일 삽입 과정에서 오류 발생"); // 콘솔에 오류 메세지가 뜨게 됨
						}
					}
				}

				// 3) 기존 DeptBoardFile 테이블 수정할 파일 정보(updateList)가 있을 경우
				if (result > 0 && !updateList.isEmpty()) {
					result = 0; // result 재활용

					for (DeptBoardFile df : updateList) {
						result = deptBoardDAO.updateDeptBoardFile(df);

						if (result == 0) {
							throw new Exception("파일 수정 과정에서 오류 발생");
						}
					}

				}

				// 4) DB 수정이 정상적으로 처리된 경우 파일 저장
				if (result > 0) {
					// insertList, updateList 합치기
					insertList.addAll(updateList);

					for (DeptBoardFile df : insertList) {
							for (MultipartFile mf : deptBoardfile) {
								if (mf.getOriginalFilename().equals(df.getFileOriginName())) {
									// 진짜 파일 file Info
									mf.transferTo(new File(savePath + "/" + df.getFileChangeName()));
									break;
								}
							}
					}
				}

				// 수정 전 이미지를 서버에서 삭제
				for (DeptBoardFile df : files) { // 수정 전 이미지 목록 반복 접근
					for (DeptBoardFile newImage : insertList) { // 수정 후 이미지 목록 반복 접근
						// 수정 전 fileNo와 수정 후 fileNo가 같은 객체가 존재하는 경우
						// -> 수정 전 파일에서 changeFileName을 얻어와 서버에서 삭제를 시켜야 함
						if (df.getFileNo() == newImage.getFileNo()) {
							// 이미지 삭제
							File deleteFile = new File(savePath + "/" + df.getFileChangeName());
							deleteFile.delete();
						}
					}
				}
				return result;
	}

	@Override
	public int deleteDeptBaord(Integer no) throws Exception {
		return deptBoardDAO.deleteDeptBaord(no);
	}

	/**
	 * 게시글 상세보기 - 파일 조회
	 * 
	 * @param no
	 * @return deptBoardFile
	 * @throws Exception
	 */
	@Override
	public List<DeptBoardFile> selectFiles(Integer no) throws Exception {
		return deptBoardDAO.selectFiles(no);
	}

	@Transactional(rollbackFor=Exception.class)
	@Override
	public int insertReply(DeptBoardReply reply) throws Exception {
		//reply.setReplyContent(reply.getReplyContent().replace("\r\n", "<br>"));
		return deptBoardDAO.insertReply(reply);
	}

	@Override
	public List<DeptBoardReply> selectReplyList(int boardNo) {
		return deptBoardDAO.selectReplyList(boardNo);
	}

	@Override
	public int deleteReply(int replyNo) throws Exception {
		return deptBoardDAO.deleteReply(replyNo);
	}

	@Override
	public int updateReply(DeptBoardReply reply) throws Exception {
		return deptBoardDAO.updateReply(reply);
	}

	@Override
	public int replyCount(int boardNo) throws Exception {
		return deptBoardDAO.replyCount(boardNo);
	}

	
	
}
