package com.kh.dep.personManagement.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class PromotionLi {

	private int empNo;
	private String jobCode;
	private String depId;
	private String empName;
	private String jobReason;
	private String jobName;
	private String depName;
	private String jobRecordDate;
	private String day;
	private String year;
	public PromotionLi()
	{
		
	}
	public PromotionLi(String depName ,String day,String year)
	{
		super();
		this.day = day;
		this.depName = depName;
		this.year = year;
	}
	
	
	
	public PromotionLi(int empNo, String jobCode, String depId, String empName, String jobReason, String jobName,
			String depName, String jobRecordDate, String day , String year) {
		super();
		this.empNo = empNo;
		this.jobCode = jobCode;
		this.depId = depId;
		this.empName = empName;
		this.jobReason = jobReason;
		this.jobName = jobName;
		this.depName = depName;
		this.jobRecordDate = jobRecordDate;
		this.day = day;
		this.year = year;
	}
	public PromotionLi(int empNo, String jobCode, String depId, String empName, String jobReason, String jobName,
			String depName, String jobRecordDate) {
		super();
		this.empNo = empNo;
		this.jobCode = jobCode;
		this.depId = depId;
		this.empName = empName;
		this.jobReason = jobReason;
		this.jobName = jobName;
		this.depName = depName;
		this.jobRecordDate = jobRecordDate;
	}
	
	
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public String getDepId() {
		return depId;
	}
	public void setDepId(String depId) {
		this.depId = depId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getJobReason() {
		return jobReason;
	}
	public void setJobReason(String jobReason) {
		this.jobReason = jobReason;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
	}
	public String getJobRecordDate() {
		return jobRecordDate;
	}
	public void setJobRecordDate(String jobRecordDate) {
		this.jobRecordDate = jobRecordDate;
	}
	@Override
	public String toString() {
		return "PromotionLi [empNo=" + empNo + ", jobCode=" + jobCode + ", depId=" + depId + ", empName=" + empName
				+ ", jobReason=" + jobReason + ", jobName=" + jobName + ", depName=" + depName + ", jobRecordDate="
				+ jobRecordDate + ", day=" + day + ", year=" + year + "]";
	}
	
	
	
	
	

}
