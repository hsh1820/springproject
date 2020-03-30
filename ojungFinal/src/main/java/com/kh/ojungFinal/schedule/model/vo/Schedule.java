package com.kh.ojungFinal.schedule.model.vo;

import java.sql.Date;

public class Schedule {
	private int ssNo;
	private String ssTitle;
	private String ssType;
	private String ssStartDate;
	private String ssStartHour;
	private String ssStartMinute;
	private String ssEndDate;
	private String ssEndHour;
	private String ssEndMinute;
	private char ssRepeatType;
	private String ssRepeatOption;
	private String ssRepeatEnd;
	private String ssContents;
	private char ssIsOpen;
	private Date updateDate;
	private Date insertDate;
	private String deleteFlag;
	private int memberNo;
	
	
	public Schedule() {
		// TODO Auto-generated constructor stub
	}


	public Schedule(int ssNo, String ssTitle, String ssType, String ssStartDate, String ssStartHour,
			String ssStartMinute, String ssEndDate, String ssEndHour, String ssEndMinute, char ssRepeatType,
			String ssRepeatOption, String ssRepeatEnd, String ssContents, char ssIsOpen, Date updateDate,
			Date insertDate, String deleteFlag, int memberNo) {
		super();
		this.ssNo = ssNo;
		this.ssTitle = ssTitle;
		this.ssType = ssType;
		this.ssStartDate = ssStartDate;
		this.ssStartHour = ssStartHour;
		this.ssStartMinute = ssStartMinute;
		this.ssEndDate = ssEndDate;
		this.ssEndHour = ssEndHour;
		this.ssEndMinute = ssEndMinute;
		this.ssRepeatType = ssRepeatType;
		this.ssRepeatOption = ssRepeatOption;
		this.ssRepeatEnd = ssRepeatEnd;
		this.ssContents = ssContents;
		this.ssIsOpen = ssIsOpen;
		this.updateDate = updateDate;
		this.insertDate = insertDate;
		this.deleteFlag = deleteFlag;
		this.memberNo = memberNo;
	}
	
	public int getSsNo() {
		return ssNo;
	}


	public void setSsNo(int ssNo) {
		this.ssNo = ssNo;
	}


	public String getSsTitle() {
		return ssTitle;
	}


	public void setSsTitle(String ssTitle) {
		this.ssTitle = ssTitle;
	}


	public String getSsType() {
		return ssType;
	}


	public void setSsType(String ssType) {
		this.ssType = ssType;
	}


	public String getSsStartDate() {
		return ssStartDate;
	}


	public void setSsStartDate(String ssStartDate) {
		this.ssStartDate = ssStartDate;
	}


	public String getSsStartHour() {
		return ssStartHour;
	}


	public void setSsStartHour(String ssStartHour) {
		this.ssStartHour = ssStartHour;
	}


	public String getSsStartMinute() {
		return ssStartMinute;
	}


	public void setSsStartMinute(String ssStartMinute) {
		this.ssStartMinute = ssStartMinute;
	}


	public String getSsEndDate() {
		return ssEndDate;
	}


	public void setSsEndDate(String ssEndDate) {
		this.ssEndDate = ssEndDate;
	}


	public String getSsEndHour() {
		return ssEndHour;
	}


	public void setSsEndHour(String ssEndHour) {
		this.ssEndHour = ssEndHour;
	}


	public String getSsEndMinute() {
		return ssEndMinute;
	}


	public void setSsEndMinute(String ssEndMinute) {
		this.ssEndMinute = ssEndMinute;
	}


	public char getSsRepeatType() {
		return ssRepeatType;
	}


	public void setSsRepeatType(char ssRepeatType) {
		this.ssRepeatType = ssRepeatType;
	}


	public String getSsRepeatOption() {
		return ssRepeatOption;
	}


	public void setSsRepeatOption(String ssRepeatOption) {
		this.ssRepeatOption = ssRepeatOption;
	}


	public String getSsRepeatEnd() {
		return ssRepeatEnd;
	}


	public void setSsRepeatEnd(String ssRepeatEnd) {
		this.ssRepeatEnd = ssRepeatEnd;
	}


	public String getSsContents() {
		return ssContents;
	}


	public void setSsContents(String ssContents) {
		this.ssContents = ssContents;
	}


	public char getSsIsOpen() {
		return ssIsOpen;
	}


	public void setSsIsOpen(char ssIsOpen) {
		this.ssIsOpen = ssIsOpen;
	}


	public Date getUpdateDate() {
		return updateDate;
	}


	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}


	public Date getInsertDate() {
		return insertDate;
	}


	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}


	public String getDeleteFlag() {
		return deleteFlag;
	}


	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String dateToNewDate(String date,String h, String m) {
		String str = "new Date(";
		
		String[] newDate = date.split("-");
		
		str+=newDate[0]+","+newDate[1]+","+newDate[2];
		
		if(h != null) {
			str += h+",";
			if(m != null)
				str += m+")";
			else
				str+="0";
		}
		str+=")";
		
		return str;
	}
	
	public String toJsonString() { 
		
		String str="{";
	
//		{
//          title          : 'Birthday Party',
//          start          : new Date(y, m, d + 1, 19, 0),
//          end            : new Date(y, m, d + 1, 22, 30),
//          allDay         : false,
//          backgroundColor: '#00a65a', //Success (green)
//          borderColor    : '#00a65a' //Success (green)
//      }
		/* str+="\"title\" : \"" + ssTitle + "\",\"start\" : \"" */
		
		return str;
	}
	

	@Override
	public String toString() {
		return "Schedule [ssNo=" + ssNo + ", ssTitle=" + ssTitle + ", ssType=" + ssType + ", ssStartDate=" + ssStartDate
				+ ", ssStartHour=" + ssStartHour + ", ssStartMinute=" + ssStartMinute + ", ssEndDate=" + ssEndDate
				+ ", ssEndHour=" + ssEndHour + ", ssEndMinute=" + ssEndMinute + ", ssRepeatType=" + ssRepeatType
				+ ", ssRepeatOption=" + ssRepeatOption + ", ssRepeatEnd=" + ssRepeatEnd + ", ssContents=" + ssContents
				+ ", ssIsOpen=" + ssIsOpen + ", updateDate=" + updateDate + ", insertDate=" + insertDate
				+ ", deleteFlag=" + deleteFlag + ", memberNo=" + memberNo + "]";
	}
	
	
	
	
	
}
