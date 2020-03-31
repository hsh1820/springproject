package com.kh.ojungFinal.calender.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ojungFinal.calender.model.vo.Calendar;

@Repository
public class CalendarDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 일정 목록 조회용 DAO
	 * @param memberNo
	 * @return
	 */
	public List<Calendar> selectEventList(int memberNo) {
		return sqlSession.selectList("calendarMapper.selectEventList", memberNo);
	}

	/** 새 일정 등록용 DAO
	 * @param calendar
	 * @return result
	 * @throws Exception
	 */
	public int insertEvent(Calendar calendar) throws Exception{
		return sqlSession.insert("calendarMapper.insertEvent", calendar);
	}

	
	/** 새일정 수정용 DAO
	 * @param calendar
	 * @return result
	 * @throws Exception
	 */
	public int updateEvent(Calendar calendar) throws Exception{
		return sqlSession.update("calendarMapper.updateEvent", calendar);
	}
 
	/** 일정 삭제용 DAO
	 * @param calendar
	 * @return result
	 * @throws Exception
	 */
	public int deleteEvent(Calendar calendar) throws Exception{
		return sqlSession.delete("calendarMapper.deleteEvent", calendar);
	}

	
	/** 일정 리사이즈용 DAO
	 * @param calendar
	 * @return result
	 * @throws Exception
	 */
	public int resizeEvent(Calendar calendar) throws Exception{
		return sqlSession.update("calendarMapper.resizeEvent", calendar);
	}

	
	/** 일정 드랍용 DAO
	 * @param calendar
	 * @return result
	 * @throws Exception
	 */
	public int dropEvent(Calendar calendar) throws Exception{
		return sqlSession.update("calendarMapper.dropEvent", calendar);
	}

}
