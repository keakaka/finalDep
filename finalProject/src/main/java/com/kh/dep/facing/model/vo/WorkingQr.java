package com.kh.dep.facing.model.vo;


import org.springframework.stereotype.Repository;

@Repository
public class WorkingQr implements java.io.Serializable {
	
	private int workRecordNo;
	private String hours;
	private int empNo;
	private String empName;
	private String today;
	private String state;
	private int plusWork;
	
	public WorkingQr()
	{	
		
	}

	public WorkingQr(int workRecordNo, String hours, int empNo, String empName, String today, String state,
			int plusWork) {
		super();
		this.workRecordNo = workRecordNo;
		this.hours = hours;
		this.empNo = empNo;
		this.empName = empName;
		this.today = today;
		this.state = state;
		this.plusWork = plusWork;
	}

	public int getWorkRecordNo() {
		return workRecordNo;
	}

	public void setWorkRecordNo(int workRecordNo) {
		this.workRecordNo = workRecordNo;
	}

	public String getHours() {
		return hours;
	}

	public void setHours(String hours) {
		this.hours = hours;
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

	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getPlusWork() {
		return plusWork;
	}

	public void setPlusWork(int plusWork) {
		this.plusWork = plusWork;
	}

	@Override
	public String toString() {
		return "WorkingQr [workRecordNo=" + workRecordNo + ", hours=" + hours + ", empNo=" + empNo + ", empName="
				+ empName + ", today=" + today + ", state=" + state + ", plusWork=" + plusWork + "]";
	}
	

	
	
}
