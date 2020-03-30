package com.kh.ojungFinal.calender.model.vo;

public class Calendar {
	
	private int calendarNo;
	private String calTitle;
	private String calDescription;
	private String calStart;
	private String calEnd;
	private String calType;
	private String calRepeat;
	private String calBackColor;
	private String calTextColor;
	private String callAllDay;
	private int memberNo;
	
	public Calendar() {
		// TODO Auto-generated constructor stub
	}

	public Calendar(int calendarNo, String calTitle, String calDescription, String calStart, String calEnd,
			String calType, String calRepeat, String calBackColor, String calTextColor, String callAllDay,
			int memberNo) {
		super();
		this.calendarNo = calendarNo;
		this.calTitle = calTitle;
		this.calDescription = calDescription;
		this.calStart = calStart;
		this.calEnd = calEnd;
		this.calType = calType;
		this.calRepeat = calRepeat;
		this.calBackColor = calBackColor;
		this.calTextColor = calTextColor;
		this.callAllDay = callAllDay;
		this.memberNo = memberNo;
	}

	public int getCalendarNo() {
		return calendarNo;
	}

	public void setCalendarNo(int calendarNo) {
		this.calendarNo = calendarNo;
	}

	public String getCalTitle() {
		return calTitle;
	}

	public void setCalTitle(String calTitle) {
		this.calTitle = calTitle;
	}

	public String getCalDescription() {
		return calDescription;
	}

	public void setCalDescription(String calDescription) {
		this.calDescription = calDescription;
	}

	public String getCalStart() {
		return calStart;
	}

	public void setCalStart(String calStart) {
		this.calStart = calStart;
	}

	public String getCalEnd() {
		return calEnd;
	}

	public void setCalEnd(String calEnd) {
		this.calEnd = calEnd;
	}

	public String getCalType() {
		return calType;
	}

	public void setCalType(String calType) {
		this.calType = calType;
	}

	public String getCalRepeat() {
		return calRepeat;
	}

	public void setCalRepeat(String calRepeat) {
		this.calRepeat = calRepeat;
	}

	public String getCalBackColor() {
		return calBackColor;
	}

	public void setCalBackColor(String calBackColor) {
		this.calBackColor = calBackColor;
	}

	public String getCalTextColor() {
		return calTextColor;
	}

	public void setCalTextColor(String calTextColor) {
		this.calTextColor = calTextColor;
	}

	public String getCallAllDay() {
		return callAllDay;
	}

	public void setCallAllDay(String callAllDay) {
		this.callAllDay = callAllDay;
	}

	

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Calendar [calendarNo=" + calendarNo + ", calTitle=" + calTitle + ", calDescription=" + calDescription
				+ ", calStart=" + calStart + ", calEnd=" + calEnd + ", calType=" + calType + ", calRepeat=" + calRepeat
				+ ", calBackColor=" + calBackColor + ", calTextColor=" + calTextColor + ", callAllDay=" + callAllDay
				+ ", memberNo=" + memberNo + "]";
	}
	
	
	

}
