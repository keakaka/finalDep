package com.kh.dep.facing.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;


@Repository
public class WorkingRecord {
	
	private int workRecordNo;
	private Date hours;
	private int empNo;

	public WorkingRecord()
	{
		
	}
	public WorkingRecord(int workRecordNo, Date hours, int empNo) {
		super();
		this.workRecordNo = workRecordNo;
		this.hours = hours;
		this.empNo = empNo;
	}
	

	
	public int getWorkRecordNo() {
		return workRecordNo;
	}
	public void setWorkRecordNo(int workRecordNo) {
		this.workRecordNo = workRecordNo;
	}
	public Date getHours() {
		return hours;
	}
	public void setHours(Date hours) {
		this.hours = hours;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	@Override
	public String toString() {
		return "WorkingRecord [workRecordNo=" + workRecordNo + ", hours=" + hours + ", empNo=" + empNo + "]";
	}

	
	
	
	
}
