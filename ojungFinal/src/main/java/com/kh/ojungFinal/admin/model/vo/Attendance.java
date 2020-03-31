package com.kh.ojungFinal.admin.model.vo;

import java.sql.Timestamp;

public class Attendance {
	private int attendanceNo;
	private Timestamp inTime;
	private Timestamp outTime;
	private int inoutStatus;
	private int memberNo;
	private String changeDate;
	private String changeInTime;
	private String changeOutTime;
	
	public Attendance() {
		// TODO Auto-generated constructor stub
	}

	public Attendance(int attendanceNo, Timestamp inTime, Timestamp outTime, int inoutStatus, int memberNo,
			String changeDate, String changeInTime, String changeOutTime) {
		super();
		this.attendanceNo = attendanceNo;
		this.inTime = inTime;
		this.outTime = outTime;
		this.inoutStatus = inoutStatus;
		this.memberNo = memberNo;
		this.changeDate = changeDate;
		this.changeInTime = changeInTime;
		this.changeOutTime = changeOutTime;
	}

	public int getAttendanceNo() {
		return attendanceNo;
	}

	public void setAttendanceNo(int attendanceNo) {
		this.attendanceNo = attendanceNo;
	}

	public Timestamp getInTime() {
		return inTime;
	}

	public void setInTime(Timestamp inTime) {
		this.inTime = inTime;
	}

	public Timestamp getOutTime() {
		return outTime;
	}

	public void setOutTime(Timestamp outTime) {
		this.outTime = outTime;
	}

	public int getInoutStatus() {
		return inoutStatus;
	}

	public void setInoutStatus(int inoutStatus) {
		this.inoutStatus = inoutStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getChangeDate() {
		return changeDate;
	}

	public void setChangeDate(String changeDate) {
		this.changeDate = changeDate;
	}

	public String getChangeInTime() {
		return changeInTime;
	}

	public void setChangeInTime(String changeInTime) {
		this.changeInTime = changeInTime;
	}

	public String getChangeOutTime() {
		return changeOutTime;
	}

	public void setChangeOutTime(String changeOutTime) {
		this.changeOutTime = changeOutTime;
	}

	@Override
	public String toString() {
		return "Attendance [attendanceNo=" + attendanceNo + ", inTime=" + inTime + ", outTime=" + outTime
				+ ", inoutStatus=" + inoutStatus + ", memberNo=" + memberNo + ", changeDate=" + changeDate
				+ ", changeInTime=" + changeInTime + ", changeOutTime=" + changeOutTime + "]";
	}

	
	
	
}
