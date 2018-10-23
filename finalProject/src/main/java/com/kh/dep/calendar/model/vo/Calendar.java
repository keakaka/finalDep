package com.kh.dep.calendar.model.vo;

import java.sql.Date;
  
public class Calendar {
	private int scheduleNo;
	private int empNo;
	private String empName;
	private String scheduleTitle;
	private String scheduleContent;
	private String scheStartDate;
	private String scheEndDate;
	private String scheType;
	private String dayNum;
	private String dayWeek;
	
	public Calendar() {}

	public Calendar(int scheduleNo, int empNo, String empName, String scheduleTitle, String scheduleContent,
			String scheStartDate, String scheEndDate, String scheType, String dayNum, String dayWeek) {
		super();
		this.scheduleNo = scheduleNo;
		this.empNo = empNo;
		this.empName = empName;
		this.scheduleTitle = scheduleTitle;
		this.scheduleContent = scheduleContent;
		this.scheStartDate = scheStartDate;
		this.scheEndDate = scheEndDate;
		this.scheType = scheType;
		this.dayNum = dayNum;
		this.dayWeek = dayWeek;
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public int getEmpNo() {
		return empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public String getScheduleTitle() {
		return scheduleTitle;
	}

	public String getScheduleContent() {
		return scheduleContent;
	}

	public String getScheStartDate() {
		return scheStartDate;
	}

	public String getScheEndDate() {
		return scheEndDate;
	}

	public String getScheType() {
		return scheType;
	}

	public String getDayNum() {
		return dayNum;
	}

	public String getDayWeek() {
		return dayWeek;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}

	public void setScheduleContent(String scheduleContent) {
		this.scheduleContent = scheduleContent;
	}

	public void setScheStartDate(String scheStartDate) {
		this.scheStartDate = scheStartDate;
	}

	public void setScheEndDate(String scheEndDate) {
		this.scheEndDate = scheEndDate;
	}

	public void setScheType(String scheType) {
		this.scheType = scheType;
	}

	public void setDayNum(String dayNum) {
		this.dayNum = dayNum;
	}

	public void setDayWeek(String dayWeek) {
		this.dayWeek = dayWeek;
	}

	@Override
	public String toString() {
		return "Calendar [scheduleNo=" + scheduleNo + ", empNo=" + empNo + ", empName=" + empName + ", scheduleTitle="
				+ scheduleTitle + ", scheduleContent=" + scheduleContent + ", scheStartDate=" + scheStartDate
				+ ", scheEndDate=" + scheEndDate + ", scheType=" + scheType + ", dayNum=" + dayNum + ", dayWeek="
				+ dayWeek + "]";
	}

	
}


