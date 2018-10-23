package com.kh.dep.member.model.vo;

import java.sql.Date;

public class WorkingHours implements java.io.Serializable{
	private int workingRecordNo;
	private String workingDate;
	private int empNo;
	private String attendTime;
	private String leaveTime;
	
	public WorkingHours(){}

	public WorkingHours(int workingRecordNo, String workingDate, int empNo, String attendTime, String leaveTime) {
		super();
		this.workingRecordNo = workingRecordNo;
		this.workingDate = workingDate;
		this.empNo = empNo;
		this.attendTime = attendTime;
		this.leaveTime = leaveTime;
	}

	public int getWorkingRecordNo() {
		return workingRecordNo;
	}

	public void setWorkingRecordNo(int workingRecordNo) {
		this.workingRecordNo = workingRecordNo;
	}

	public String getWorkingDate() {
		return workingDate;
	}

	public void setWorkingDate(String workingDate) {
		this.workingDate = workingDate;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getAttendTime() {
		return attendTime;
	}

	public void setAttendTime(String attendTime) {
		this.attendTime = attendTime;
	}

	public String getLeaveTime() {
		return leaveTime;
	}

	public void setLeaveTime(String leaveTime) {
		this.leaveTime = leaveTime;
	}

	@Override
	public String toString() {
		return "WorkingHours [workingRecordNo=" + workingRecordNo + ", workingDate=" + workingDate + ", empNo=" + empNo
				+ ", attendTime=" + attendTime + ", leaveTime=" + leaveTime + "]";
	}

	
}
