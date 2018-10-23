package com.kh.dep.member.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

public class Job implements java.io.Serializable{
	private String seqNum;
	private String jobRecordNo;
	private String jobName;
	private Date jobRecordDate;
	private String jobReason;
	private int empNo;
	
	public Job(){}

	public Job(String seqNum, String jobRecordNo, String jobName, Date jobRecordDate, String jobReason, int empNo) {
		super();
		this.seqNum = seqNum;
		this.jobRecordNo = jobRecordNo;
		this.jobName = jobName;
		this.jobRecordDate = jobRecordDate;
		this.jobReason = jobReason;
		this.empNo = empNo;
	}

	public String getSeqNum() {
		return seqNum;
	}

	public void setSeqNum(String seqNum) {
		this.seqNum = seqNum;
	}

	public String getJobRecordNo() {
		return jobRecordNo;
	}

	public void setJobRecordNo(String jobRecordNo) {
		this.jobRecordNo = jobRecordNo;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public Date getJobRecordDate() {
		return jobRecordDate;
	}

	public void setJobRecordDate(Date jobRecordDate) {
		this.jobRecordDate = jobRecordDate;
	}

	public String getJobReason() {
		return jobReason;
	}

	public void setJobReason(String jobReason) {
		this.jobReason = jobReason;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	@Override
	public String toString() {
		return "Job [seqNum=" + seqNum + ", jobRecordNo=" + jobRecordNo + ", jobName=" + jobName + ", jobRecordDate="
				+ jobRecordDate + ", jobReason=" + jobReason + ", empNo=" + empNo + "]";
	}

	
	
	
}
