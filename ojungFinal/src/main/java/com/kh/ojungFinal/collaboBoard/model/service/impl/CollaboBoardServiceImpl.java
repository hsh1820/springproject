package com.kh.ojungFinal.collaboBoard.model.service.impl;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.swing.border.EmptyBorder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.collaboBoard.model.dao.CollaboBoardDao;
import com.kh.ojungFinal.collaboBoard.model.service.CollaboBoardService;
import com.kh.ojungFinal.collaboBoard.model.vo.CollaboBoard;
import com.kh.ojungFinal.collaboBoard.model.vo.CollaboCmmt;
import com.kh.ojungFinal.collaboBoard.model.vo.CollaboFile;
import com.kh.ojungFinal.collaboBoard.model.vo.DeptList;
import com.kh.ojungFinal.common.FileRename;
import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.mail.model.vo.Mail;

@Service("collaboBoardService")
public class CollaboBoardServiceImpl implements CollaboBoardService{

	@Autowired
	private CollaboBoardDao collaboDAO;
	
	/** 협업 게시판 게시글 수 조회용 Service(검색 포함)
	 * @param map
	 * @return listCount
	 * @throws Exception
	 */
	@Override
	public int getListCount(Map<String, Object> map) throws Exception {
		return collaboDAO.getListCount(map);
	}

	/** 협업 게시판 목록 조회용 Service(검색 포함)
	 * @param map
	 * @param pInf
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<CollaboBoard> selectList(Map<String, Object> map, PageInfo pInf) throws Exception {
		List<CollaboBoard> cList = collaboDAO.selectList(map,pInf);
		
		for(CollaboBoard cb : cList) {
			cb.setCollaboCreateDate((cb.getCollaboCreateDate()).substring(0, 10));
		}
		
		return cList;
	}

	/** 협업 게시판 상세 조회용 Service
	 *@param collaboNo
	 *@return collaboBoard
	 *@throws Exception
	 */
	@Override
	public CollaboBoard selectCollaboBoard(int no) throws Exception {
		CollaboBoard collaboBoard = collaboDAO.selectCollaboBoard(no);
		
		if(collaboBoard != null) {
			int result = collaboDAO.increaseCount(no);
			
			if(result>0) {
				collaboBoard.setCollaboCount(collaboBoard.getCollaboCount()+1);
			}else {
				collaboBoard = null;
			}
		}
		return collaboBoard;
	}

	/** 협업 게시판 상세에서 처리 부서 리스트 조회용 Service
	 *@param deptCode
	 *@return deptList
	 */
	@Override
	public List<DeptList> selectDeptList(String deptCode) throws Exception {
		return collaboDAO.selectDeptList(deptCode);
	}

	/** 협업 게시판 등록 화면에서 협업 부서 목록 조회용 Service
	 * @return deptlist
	 */
	@Override
	public List<Member> selectDept() throws Exception {
		return collaboDAO.selectDept();
	}


	/** 협업 게시판 글 등록 Service
	    * insert 성공 시 글번호 리턴
	    * @return bNo
	    *
	    */
	   @Override
	   public int insertCboard(CollaboBoard cBoard) throws Exception {
	      int boardNo = collaboDAO.selectNextNo(cBoard);
	      int result = 0;
	      
	      if (boardNo > 0) {
	         cBoard.setCollaboNo(boardNo);

	         result = collaboDAO.insertCboard(cBoard);
	      }
	   
	      if(result > 0) {// 게시글 삽입 성공 시 현재 보드 시퀀스 번호 조회해서 리턴
	         return collaboDAO.selectCurrNo();
	      }else {
	         return -1;
	      }
	   }
	
	
	

	@Override
	public int insertCollaboFile(CollaboFile cff) throws Exception {
		return collaboDAO.insertCollaboFile(cff);
	}

	@Override
	public List<CollaboFile> selectCollaboFiles(int no) throws Exception {
		return collaboDAO.selectCollaboFiles(no);
	}

	@Override
	public int updateAccept(int cNo, int memberNo, int taskConfirm) throws Exception {
		CollaboBoard cBoard = new CollaboBoard();
		cBoard.setCollaboNo(cNo);
		cBoard.setTaskAccepter(memberNo);
		int result = 0;
		if(taskConfirm == 1) result = collaboDAO.updateAccept(cBoard);
		else if(taskConfirm == 2)result = collaboDAO.updateReject(cBoard);
		return result;
	}

	@Override
	public List<CollaboFile> selectFiles(Integer no) throws Exception {
		return collaboDAO.selectFiles(no);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateDetail(CollaboBoard cBoard, List<MultipartFile> fileUpload, String filePath) throws Exception {
		
		List<CollaboFile> files = collaboDAO.selectFile(cBoard.getCollaboNo());
		List<CollaboFile> beforeFiles = new ArrayList<CollaboFile>();
		
		for(CollaboFile cff : files) {
			System.out.println("cff"+ cff.getFileNo());
			beforeFiles.add(cff);
		}
		
		List<CollaboFile> insertList = new ArrayList<CollaboFile>();
		List<CollaboFile> updateList = new ArrayList<CollaboFile>();
		
		CollaboFile file = null;
		
		int filesIndex = 0;
		
		for(int i=0; i<fileUpload.size(); i++) {
			System.out.println("fileUpload:"+fileUpload.get(i).getOriginalFilename());
			if(!fileUpload.get(i).getOriginalFilename().equals("")) {
				String changeFileName = FileRename.rename(fileUpload.get(i).getOriginalFilename());
				
				if(beforeFiles.size()>0 && i<beforeFiles.size()) {
					file = new CollaboFile(beforeFiles.get(filesIndex).getFileNo(), fileUpload.get(i).getOriginalFilename(), changeFileName);
					updateList.add(file);
					filesIndex++;
					
				} else {
					file = new CollaboFile(fileUpload.get(i).getOriginalFilename(), changeFileName, filePath);
					
					file.setCollaboNo(cBoard.getCollaboNo());
					insertList.add(file);
				}
			}
		}
		
		int result = 0;
		
		result = collaboDAO.updateDetail(cBoard);
		
		if(result > 0 && !insertList.isEmpty()) {
			result = 0;
			
			for(CollaboFile cff : insertList) {
				result = collaboDAO.insertCollaboFile(cff);
				
				if(result == 0) {
					throw new Exception("파일 삽입 과정에서 오류 발생");
				}
			}
		}
		
		if(result > 0 && !updateList.isEmpty()) {
			result = 0;
			
			for(CollaboFile cff : updateList) {
				result = collaboDAO.updateCollaboFile(cff);
				
				if(result == 0) {
					throw new Exception("파일 수정 과정에서 오류 발생");
				}
			}
		}
		if(result > 0) {
			insertList.addAll(updateList);
			
			for(CollaboFile cff : insertList) {
				for(org.springframework.web.multipart.MultipartFile mf : fileUpload) {
					if(mf.getOriginalFilename().equals(cff.getFileOriginNm())) {
						mf.transferTo(new File(filePath + "/" + cff.getFileChangeNm()));
					}
				}
			}
		}
		
		for(CollaboFile cff : files) {
			for(CollaboFile newFile : insertList) {
				if(cff.getFileNo() == newFile.getFileNo()) {
					
					File deleteFile = new File(filePath + "/" + cff.getFileChangeNm());
					deleteFile.delete();
				}
			}
		}
		
		return result;
	}



	@Override
	public int deleteDetail(Integer no) throws Exception {
		return collaboDAO.deleteDetail(no);
	}

	@Override
	public int insertReply(CollaboCmmt reply) throws Exception {
		return collaboDAO.insertReply(reply);
	}

	@Override
	public int deleteReply(int collaboCmmtNo) throws Exception {
		return collaboDAO.deleteReply(collaboCmmtNo);
	}

	@Override
	public int updateReply(CollaboCmmt reply) throws Exception {
		return collaboDAO.updateReply(reply);
	}

	@Override
	public int replyCount(int collaboNo) throws Exception {
		return collaboDAO.replyCount(collaboNo);
	}

	@Override
	public List<CollaboCmmt> selectReplyList(int collaboNo) throws Exception {
		return collaboDAO.selectReplyList(collaboNo);
	}

	@Override
	public List<CollaboBoard> selectEmailList(int bNo) throws Exception {
		return collaboDAO.selectEmailList(bNo);
	}




}
