package com.kh.dep.member.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

public class Department implements java.io.Serializable {
	private String seqNum;
	private String depRecordNo;
	private String depName;
	private String depPhone;
	private Date depRecordDate;
	private String depReason;
	private String empName;
	
	public Department(){}

	public Department(String seqNum, String depRecordNo, String depName, String depPhone, Date depRecordDate,
			String depReason, String empName) {
		super();
		this.seqNum = seqNum;
		this.depRecordNo = depRecordNo;
		this.depName = depName;
		this.depPhone = depPhone;
		this.depRecordDate = depRecordDate;
		this.depReason = depReason;
		this.empName = empName;
	}

	public String getSeqNum() {
		return seqNum;
	}

	public void setSeqNum(String seqNum) {
		this.seqNum = seqNum;
	}

	public String getDepRecordNo() {
		return depRecordNo;
	}

	public void setDepRecordNo(String depRecordNo) {
		this.depRecordNo = depRecordNo;
	}

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}

	public String getDepPhone() {
		return depPhone;
	}

	public void setDepPhone(String depPhone) {
		this.depPhone = depPhone;
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

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	@Override
	public String toString() {
		return "Department [seqNum=" + seqNum + ", depRecordNo=" + depRecordNo + ", depName=" + depName + ", depPhone="
				+ depPhone + ", depRecordDate=" + depRecordDate + ", depReason=" + depReason + ", empName=" + empName
				+ "]";
	}

	
}
