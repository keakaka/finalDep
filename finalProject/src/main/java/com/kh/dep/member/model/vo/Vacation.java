package com.kh.dep.member.model.vo;

import java.sql.Date;

public class Vacation implements java.io.Serializable{
	private int vacNo;
	private int empNo;
	private String vacReason;
	private String vacType;
	private String vacStartdate;
	private String vacEnddate;
	
	public Vacation(){}

	public Vacation(int vacNo, int empNo, String vacReason, String vacType, String vacStartdate, String vacEnddate) {
		super();
		this.vacNo = vacNo;
		this.empNo = empNo;
		this.vacReason = vacReason;
		this.vacType = vacType;
		this.vacStartdate = vacStartdate;
		this.vacEnddate = vacEnddate;
	}

	public int getVacNo() {
		return vacNo;
	}

	public void setVacNo(int vacNo) {
		this.vacNo = vacNo;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
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
		return "Vacation [vacNo=" + vacNo + ", empNo=" + empNo + ", vacReason=" + vacReason + ", vacType=" + vacType
				+ ", vacStartdate=" + vacStartdate + ", vacEnddate=" + vacEnddate + "]";
	}

	
}
