package com.kh.dep.member.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class MemberJob implements java.io.Serializable{
	
	private String jobCode;
	private String jobName;
	
	
	
	public MemberJob(){}



	public MemberJob(String jobCode, String jobName) {
		super();
		this.jobCode = jobCode;
		this.jobName = jobName;
	}



	public String getJobCode() {
		return jobCode;
	}



	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}



	public String getJobName() {
		return jobName;
	}



	public void setJobName(String jobName) {
		this.jobName = jobName;
	}



	@Override
	public String toString() {
		return "MemberJob [jobCode=" + jobCode + ", jobName=" + jobName + "]";
	}
	
	
	
	

}
