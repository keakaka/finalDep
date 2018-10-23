package com.kh.dep.member.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Member implements java.io.Serializable {

	private int empNo;
	private String empId;
	private String empPwd;
	private String empName;
	private String birthDate;
	private String email;
	private String phone;
	private String emergencyPhone;
	private String address;
	private int salary;
	private Date hireDate;
	private Date leaveDate;
	private String phoneReveal;
	private String status;
	
	
	public Member(){}


	public Member(int empNo, String empId, String empPwd, String empName, String birthDate, String email, String phone,
			String emergencyPhone, String address, int salary, Date hireDate, Date leaveDate, String phoneReveal,
			String status) {
		super();
		this.empNo = empNo;
		this.empId = empId;
		this.empPwd = empPwd;
		this.empName = empName;
		this.birthDate = birthDate;
		this.email = email;
		this.phone = phone;
		this.emergencyPhone = emergencyPhone;
		this.address = address;
		this.salary = salary;
		this.hireDate = hireDate;
		this.leaveDate = leaveDate;
		this.phoneReveal = phoneReveal;
		this.status = status;
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


	public String getEmpPwd() {
		return empPwd;
	}


	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}


	public String getEmpName() {
		return empName;
	}


	public void setEmpName(String empName) {
		this.empName = empName;
	}


	public String getBirthDate() {
		return birthDate;
	}


	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmergencyPhone() {
		return emergencyPhone;
	}


	public void setEmergencyPhone(String emergencyPhone) {
		this.emergencyPhone = emergencyPhone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public int getSalary() {
		return salary;
	}


	public void setSalary(int salary) {
		this.salary = salary;
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


	public String getPhoneReveal() {
		return phoneReveal;
	}


	public void setPhoneReveal(String phoneReveal) {
		this.phoneReveal = phoneReveal;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Member [empNo=" + empNo + ", empId=" + empId + ", empPwd=" + empPwd + ", empName=" + empName
				+ ", birthDate=" + birthDate + ", email=" + email + ", phone=" + phone + ", emergencyPhone="
				+ emergencyPhone + ", address=" + address + ", salary=" + salary + ", hireDate=" + hireDate
				+ ", leaveDate=" + leaveDate + ", phoneReveal=" + phoneReveal + ", status=" + status + "]";
	}
	
	
	
	
	
	
	
	

}
