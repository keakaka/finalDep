package com.kh.dep.personManagement.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;


public class personM {

	private int empNo;
	private String empId;
	private String empName;
	private Date hireDate;
	private Date leaveDate;
	private String status;
	private String depId;
	private int depRecordNo;
	private Date depRecordDate;
	private String depReason;
	private String depName;
	private String jobCode;
	private String jobName;
	private int vacNo;
	private String vacReason;
	private String vacType;
	private String vacStartdate;
	private String vacEnddate;
	
	public personM()
	{
		
	}

	public personM(int empNo, String empId, String empName, Date hireDate, Date leaveDate, String status, String depId,
			int depRecordNo, Date depRecordDate, String depReason, String depName, String jobCode, String jobName,
			int vacNo, String vacReason, String vacType, String vacStartdate, String vacEnddate) {
		super();
		this.empNo = empNo;
		this.empId = empId;
		this.empName = empName;
		this.hireDate = hireDate;
		this.leaveDate = leaveDate;
		this.status = status;
		this.depId = depId;
		this.depRecordNo = depRecordNo;
		this.depRecordDate = depRecordDate;
		this.depReason = depReason;
		this.depName = depName;
		this.jobCode = jobCode;
		this.jobName = jobName;
		this.vacNo = vacNo;
		this.vacReason = vacReason;
		this.vacType = vacType;
		this.vacStartdate = vacStartdate;
		this.vacEnddate = vacEnddate;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public Date getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDepId() {
		return depId;
	}

	public void setDepId(String depId) {
		this.depId = depId;
	}

	public int getDepRecordNo() {
		return depRecordNo;
	}

	public void setDepRecordNo(int depRecordNo) {
		this.depRecordNo = depRecordNo;
	}

	public Date getDepRecordDate() {
		return depRecordDate;
	}

	public void setDepRecordDate(Date depRecordDate) {
		this.depRecordDate = depRecordDate;
	}

	public String getDepReason() {
		return depReason;
	}

	public void setDepReason(String depReason) {
		this.depReason = depReason;
	}

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
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

	public int getVacNo() {
		return vacNo;
	}

	public void setVacNo(int vacNo) {
		this.vacNo = vacNo;
	}

	public String getVacReason() {
		return vacReason;
	}

	public void setVacReason(String vacReason) {
		this.vacReason = vacReason;
	}

	public String getVacType() {
		return vacType;
	}

	public void setVacType(String vacType) {
		this.vacType = vacType;
	}

	public String getVacStartdate() {
		return vacStartdate;
	}

	public void setVacStartdate(String vacStartdate) {
		this.vacStartdate = vacStartdate;
	}

	public String getVacEnddate() {
		return vacEnddate;
	}

	public void setVacEnddate(String vacEnddate) {
		this.vacEnddate = vacEnddate;
	}

	@Override
	public String toString() {
		return "personM [empNo=" + empNo + ", empId=" + empId + ", empName=" + empName + ", hireDate=" + hireDate
				+ ", leaveDate=" + leaveDate + ", status=" + status + ", depId=" + depId + ", depRecordNo="
				+ depRecordNo + ", depRecordDate=" + depRecordDate + ", depReason=" + depReason + ", depName=" + depName
				+ ", jobCode=" + jobCode + ", jobName=" + jobName + ", vacNo=" + vacNo + ", vacReason=" + vacReason
				+ ", vacType=" + vacType + ", vacStartdate=" + vacStartdate + ", vacEnddate=" + vacEnddate + "]";
	}
	
	
	

}
