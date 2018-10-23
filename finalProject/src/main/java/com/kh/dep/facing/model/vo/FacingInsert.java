package com.kh.dep.facing.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class FacingInsert implements java.io.Serializable {

	private int empNo;
	private String empName;
	private int facingNo;
	private String facingTitle;
	private String facingContents;
	private String writeDate;
	private int receiver;
	private String status;
	private String reciverDate;
	
	public FacingInsert()
	{
		
	}
	public FacingInsert(int empNo, String empName, int facingNo, String facingTitle, String facingContents,
			String writeDate, int receiver, String status, String reciverDate) {
		super();
		this.empNo = empNo;
		this.empName = empName;
		this.facingNo = facingNo;
		this.facingTitle = facingTitle;
		this.facingContents = facingContents;
		this.writeDate = writeDate;
		this.receiver = receiver;
		this.status = status;
		this.reciverDate = reciverDate;
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
	public int getFacingNo() {
		return facingNo;
	}
	public void setFacingNo(int facingNo) {
		this.facingNo = facingNo;
	}
	public String getFacingTitle() {
		return facingTitle;
	}
	public void setFacingTitle(String facingTitle) {
		this.facingTitle = facingTitle;
	}
	public String getFacingContents() {
		return facingContents;
	}
	public void setFacingContents(String facingContents) {
		this.facingContents = facingContents;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public int getReceiver() {
		return receiver;
	}
	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReciverDate() {
		return reciverDate;
	}
	public void setReciverDate(String reciverDate) {
		this.reciverDate = reciverDate;
	}
	@Override
	public String toString() {
		return "FacingInsert [empNo=" + empNo + ", empName=" + empName + ", facingNo=" + facingNo + ", facingTitle="
				+ facingTitle + ", facingContents=" + facingContents + ", writeDate=" + writeDate + ", receiver="
				+ receiver + ", status=" + status + ", reciverDate=" + reciverDate + "]";
	}
	
	
}
