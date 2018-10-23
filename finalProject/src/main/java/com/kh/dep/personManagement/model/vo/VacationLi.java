package com.kh.dep.personManagement.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class VacationLi {

	private int empNo;
	private String depId;
	private String empName;
	private String depName;
	private String vacReason;
	private String vacType;
	private String startDate;
	private String endDate;
	private String day;
	private String year;
	
	public VacationLi()
	{
		
	}
	
	public VacationLi(String depName , String day , String year)
	{
		this.day = day;
		this.year = year;
		this.depName = depName;
	}
	public VacationLi(int empNo, String depId, String empName, String depName, String vacReason, String vacType,
			String startDate, String endDate) {
		super();
		this.empNo = empNo;
		this.depId = depId;
		this.empName = empName;
		this.depName = depName;
		this.vacReason = vacReason;
		this.vacType = vacType;
		this.startDate = startDate;
		this.endDate = endDate;
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

	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
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
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "VacationLi [empNo=" + empNo + ", depId=" + depId + ", empName=" + empName + ", depName=" + depName
				+ ", vacReason=" + vacReason + ", vacType=" + vacType + ", startDate=" + startDate + ", endDate="
				+ endDate + ", day=" + day + ", year=" + year + "]";
	}
	

	
}
