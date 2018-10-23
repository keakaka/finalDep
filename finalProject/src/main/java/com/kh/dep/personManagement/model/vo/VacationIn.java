package com.kh.dep.personManagement.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class VacationIn {

	private int vacNo;
	private int empNo;
	private String vacReason;
	private String vacType;
	private String vacStartDate;
	private String vacEndDate;
	
	public VacationIn()
	{
		
	}
	

	public VacationIn(int vacNo, int empNo, String vacReason, String vacType, String vacStartDate, String vacEndDate) {
		super();
		this.vacNo = vacNo;
		this.empNo = empNo;
		this.vacReason = vacReason;
		this.vacType = vacType;
		this.vacStartDate = vacStartDate;
		this.vacEndDate = vacEndDate;
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


	public String getVacStartDate() {
		return vacStartDate;
	}


	public void setVacStartDate(String vacStartDate) {
		this.vacStartDate = vacStartDate;
	}


	public String getVacEndDate() {
		return vacEndDate;
	}


	public void setVacEndDate(String vacEndDate) {
		this.vacEndDate = vacEndDate;
	}


	@Override
	public String toString() {
		return "VacationIn [vacNo=" + vacNo + ", empNo=" + empNo + ", vacReason=" + vacReason + ", vacType=" + vacType
				+ ", vacStartDate=" + vacStartDate + ", vacEndDate=" + vacEndDate + "]";
	}
	
	
	
	
}
