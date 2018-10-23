package com.kh.dep.member.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class Alarm implements java.io.Serializable{
	private int alarmNo;
	private String alarmContents;
	private int empNo;
	private String receiveDate;
	
	public Alarm(){}
	
	public Alarm(int alarmNo, String alarmContents, int empNo, String receiveDate) {
		super();
		this.alarmNo = alarmNo;
		this.alarmContents = alarmContents;
		this.empNo = empNo;
		this.receiveDate = receiveDate;
	}

	public int getAlarmNo() {
		return alarmNo;
	}

	public void setAlarmNo(int alarmNo) {
		this.alarmNo = alarmNo;
	}

	public String getAlarmContents() {
		return alarmContents;
	}

	public void setAlarmContents(String alarmContents) {
		this.alarmContents = alarmContents;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	
	public String getReceiveDate() {
		return receiveDate;
	}
	
	public void setReceiveDate(String receiveDate) {
		this.receiveDate = receiveDate;
	}

	@Override
	public String toString() {
		return "Alarm [alarmNo=" + alarmNo + ", alarmContents=" + alarmContents + ", empNo=" + empNo + ", receiveDate="
				+ receiveDate + "]";
	}

}
