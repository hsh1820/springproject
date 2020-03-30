package com.kh.ojungFinal.calender.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ojungFinal.calender.model.dao.CalendarDAO;
import com.kh.ojungFinal.calender.model.vo.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService{
	
	@Autowired
	private CalendarDAO calendarDAO;

	
	/** 일정 목록 조회용 Service
	 *
	 */
	@Override
	public List<Calendar> selectEventList(int memberNo) {
		return calendarDAO.selectEventList(memberNo);
	}


	/** 새로운 이벤트 등록용 Service
	 *
	 */
	@Override
	public int insertEvent(Calendar calendar) throws Exception {
		return calendarDAO.insertEvent(calendar);

	}


	/** 일정 수정용 Service
	 *
	 */
	@Override
	public int updateEvent(Calendar calendar) throws Exception {
		return calendarDAO.updateEvent(calendar);
	}


	/** 일정 삭제용 Service
	 *
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteEvent(Calendar calendar) throws Exception {
		return calendarDAO.deleteEvent(calendar);
	}


	/** 일정 리사이즈(기간변경)
	 *
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int resizeEvent(Calendar calendar) throws Exception {
		
		
		return calendarDAO.resizeEvent(calendar);
	}


	/** 일정 드랍(날짜 변경)
	 *
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int dropEvent(Calendar calendar) throws Exception {
		return calendarDAO.dropEvent(calendar);
	}

}
