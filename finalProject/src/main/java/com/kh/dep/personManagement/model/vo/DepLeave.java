package com.kh.dep.personManagement.model.vo;



import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class DepLeave implements java.io.Serializable {
	
	private String depName;
	private int empNo;
	private String empName;
	private String jobName;
	private String hireDate;
	private String leaveDate;
	private String day;
	private String year;
	
	
	public DepLeave(){}


	


	












	public DepLeave(String depName, int empNo, String empName, String jobName, String hireDate, String leaveDate,
			String day, String year) {
		super();
		this.depName = depName;
		this.empNo = empNo;
		this.empName = empName;
		this.jobName = jobName;
		this.hireDate = hireDate;
		this.leaveDate = leaveDate;
		this.day = day;
		this.year = year;
	}











	@Override
	public String toString() {
		return "DepLeave [depName=" + depName + ", empNo=" + empNo + ", empName=" + empName + ", jobName=" + jobName
				+ ", hireDate=" + hireDate + ", leaveDate=" + leaveDate + "]";
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





	public String getHireDate() {
		return hireDate;
	}





	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}





	public String getLeaveDate() {
		return leaveDate;
	}





	public void setLeaveDate(String leaveDate) {
		this.leaveDate = leaveDate;
	}
	
	




	public String getDay() {
		return day;
	}











	public void setDay(String day) {
		this.day = day;
	}











	public String getYear() {
		return year;
	}











	public void setYear(String year) {
		this.year = year;
	}




	
	
	

}
