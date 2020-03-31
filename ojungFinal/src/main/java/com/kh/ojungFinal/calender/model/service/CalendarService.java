package com.kh.ojungFinal.calender.model.service;

import java.util.List;

import com.kh.ojungFinal.calender.model.vo.Calendar;

public interface CalendarService {

	
	/** 일정 리스트 조회용 Service
	 * @param memberNo
	 * @return cList
	 */
	public abstract List<Calendar> selectEventList(int memberNo);

	/** 새로운 일정 추가용 Service
	 * @param calendar
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertEvent(Calendar calendar) throws Exception;

	/** 일정 수정
	 * @param calendar
	 * @return result
	 * @throws Exception
	 */
	public abstract int updateEvent(Calendar calendar) throws Exception;

	/** 일정 삭제
	 * @param calendar
	 * @return result
	 * @throws Exception
	 */
	public abstract int deleteEvent(Calendar calendar) throws Exception;

	/** 일정 리사이즈(기간변경)
	 * @param calendar
	 * @return result
	 * @throws Exception
	 */
	public abstract int resizeEvent(Calendar calendar) throws Exception;

	/** 일정 드랍(날짜 변경)
	 * @param calendar
	 * @return result
	 * @throws Exception
	 */
	public abstract int dropEvent(Calendar calendar) throws Exception;

}
