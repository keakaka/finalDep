package com.kh.dep.sign.model.vo;

public class MemberDep implements java.io.Serializable{
	private int empNo;
	private String empName;
	private String depName;
	private String jobName;
	private String positionName;
	
	@Override
	public String toString() {
		return "MemberDep [empNo=" + empNo + ", empName=" + empName + ", depName=" + depName + ", jobName=" + jobName
				+ ", positionName=" + positionName + "]";
	}
	
	public MemberDep(){}
	
	public MemberDep(int empNo, String empName, String depName, String jobName, String positionName) {
		super();
		this.empNo = empNo;
		this.empName = empName;
		this.depName = depName;
		this.jobName = jobName;
		this.positionName = positionName;
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

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	
	
}
