package com.kh.dep.personManagement.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class DepMoveDepRecord implements java.io.Serializable{
	
	private String depName;
	private int empNo;
	private String empName;
	private String jobName;
	private String depRcordDate;
	private	String depReason;
	private String year;
	private String day;
	
	public DepMoveDepRecord(){}

	public DepMoveDepRecord(String depName, int empNo, String empName, String jobName, String depRcordDate,
			String depReason, String year, String day) {
		super();
		this.depName = depName;
		this.empNo = empNo;
		this.empName = empName;
		this.jobName = jobName;
		this.depRcordDate = depRcordDate;
		this.depReason = depReason;
		this.year = year;
		this.day = day;
	}

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getDepRcordDate() {
		return depRcordDate;
	}

	public void setDepRcordDate(String depRcordDate) {
		this.depRcordDate = depRcordDate;
	}

	public String getDepReason() {
		return depReason;
	}

	public void setDepReason(String depReason) {
		this.depReason = depReason;
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

	@Override
	public String toString() {
		return "DepMoveDepRecord [depName=" + depName + ", empNo=" + empNo + ", empName=" + empName + ", jobName="
				+ jobName + ", depRcordDate=" + depRcordDate + ", depReason=" + depReason + ", year=" + year + ", day="
				+ day + "]";
	}
	
	

}
