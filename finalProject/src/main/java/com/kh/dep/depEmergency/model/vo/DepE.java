package com.kh.dep.depEmergency.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class DepE {
	private int empNo;
	private String jobCode;
	private String depId;
	private String empName;
	private String jobName;
	private String depName;
	private String emergencyPhone;
	
public DepE()
{
	
}

public DepE(int empNo, String jobCode, String depId, String empName, String jobName, String depName,
		String emergencyPhone) {
	super();
	this.empNo = empNo;
	this.jobCode = jobCode;
	this.depId = depId;
	this.empName = empName;
	this.jobName = jobName;
	this.depName = depName;
	this.emergencyPhone = emergencyPhone;
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

public String getEmergencyPhone() {
	return emergencyPhone;
}

public void setEmergencyPhone(String emergencyPhone) {
	this.emergencyPhone = emergencyPhone;
}

@Override
public String toString() {
	return "DepE [empNo=" + empNo + ", jobCode=" + jobCode + ", depId=" + depId + ", empName=" + empName + ", jobName="
			+ jobName + ", depName=" + depName + ", emergencyPhone=" + emergencyPhone + "]";
}



}
