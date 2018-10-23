package com.kh.dep.personManagement.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class PromotionIn {

	private int jobRecordNo;
	private String jobRecordDate;
	private String jobReason;
	private String jobCode;
	private int empNo;
	
	public PromotionIn()
	{
		
	}

	public PromotionIn(int jobRecordNo, String jobRecordDate, String jobReason, String jobCode, int empNo) {
		super();
		this.jobRecordNo = jobRecordNo;
		this.jobRecordDate = jobRecordDate;
		this.jobReason = jobReason;
		this.jobCode = jobCode;
		this.empNo = empNo;
	}

	public int getJobRecordNo() {
		return jobRecordNo;
	}

	public void setJobRecordNo(int jobRecordNo) {
		this.jobRecordNo = jobRecordNo;
	}

	public String getJobRecordDate() {
		return jobRecordDate;
	}

	public void setJobRecordDate(String jobRecordDate) {
		this.jobRecordDate = jobRecordDate;
	}

	public String getJobReason() {
		return jobReason;
	}

	public void setJobReason(String jobReason) {
		this.jobReason = jobReason;
	}

	public String getJobCode() {
		return jobCode;
	}

	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	@Override
	public String toString() {
		return "PromotionIn [jobRecordNo=" + jobRecordNo + ", jobRecordDate=" + jobRecordDate + ", jobReason="
				+ jobReason + ", jobCode=" + jobCode + ", empNo=" + empNo + "]";
	}
	
	
}
