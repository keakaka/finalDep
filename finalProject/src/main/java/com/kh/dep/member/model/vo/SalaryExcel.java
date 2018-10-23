package com.kh.dep.member.model.vo;

public class SalaryExcel {
	private String depName;
	private String jobName;
	private String empName;
	private String incomeDate;
	private int basePay;
	private int regularBonus;
	private int taxFreeAlw;
	private int nationalPension;
	private int healthIns;
	private int longtermcareIns;
	private int employeeIns;
	private int totalSalary;
	
	public SalaryExcel(){}

	public SalaryExcel(String depName, String jobName, String empName, String incomeDate, int basePay, int regularBonus,
			int taxFreeAlw, int nationalPension, int healthIns, int longtermcareIns, int employeeIns, int totalSalary) {
		super();
		this.depName = depName;
		this.jobName = jobName;
		this.empName = empName;
		this.incomeDate = incomeDate;
		this.basePay = basePay;
		this.regularBonus = regularBonus;
		this.taxFreeAlw = taxFreeAlw;
		this.nationalPension = nationalPension;
		this.healthIns = healthIns;
		this.longtermcareIns = longtermcareIns;
		this.employeeIns = employeeIns;
		this.totalSalary = totalSalary;
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

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getIncomeDate() {
		return incomeDate;
	}

	public void setIncomeDate(String incomeDate) {
		this.incomeDate = incomeDate;
	}

	public int getBasePay() {
		return basePay;
	}

	public void setBasePay(int basePay) {
		this.basePay = basePay;
	}

	public int getRegularBonus() {
		return regularBonus;
	}

	public void setRegularBonus(int regularBonus) {
		this.regularBonus = regularBonus;
	}

	public int getTaxFreeAlw() {
		return taxFreeAlw;
	}

	public void setTaxFreeAlw(int taxFreeAlw) {
		this.taxFreeAlw = taxFreeAlw;
	}

	public int getNationalPension() {
		return nationalPension;
	}

	public void setNationalPension(int nationalPension) {
		this.nationalPension = nationalPension;
	}

	public int getHealthIns() {
		return healthIns;
	}

	public void setHealthIns(int healthIns) {
		this.healthIns = healthIns;
	}

	public int getLongtermcareIns() {
		return longtermcareIns;
	}

	public void setLongtermcareIns(int longtermcareIns) {
		this.longtermcareIns = longtermcareIns;
	}

	public int getEmployeeIns() {
		return employeeIns;
	}

	public void setEmployeeIns(int employeeIns) {
		this.employeeIns = employeeIns;
	}

	public int getTotalSalary() {
		return totalSalary;
	}

	public void setTotalSalary(int totalSalary) {
		this.totalSalary = totalSalary;
	}

	@Override
	public String toString() {
		return "SalaryExcel [depName=" + depName + ", jobName=" + jobName + ", empName=" + empName + ", incomeDate="
				+ incomeDate + ", basePay=" + basePay + ", regularBonus=" + regularBonus + ", taxFreeAlw=" + taxFreeAlw
				+ ", nationalPension=" + nationalPension + ", healthIns=" + healthIns + ", longtermcareIns="
				+ longtermcareIns + ", employeeIns=" + employeeIns + ", totalSalary=" + totalSalary + "]";
	}

	
}
