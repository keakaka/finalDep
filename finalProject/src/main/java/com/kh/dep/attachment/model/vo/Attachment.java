package com.kh.dep.attachment.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Attachment implements java.io.Serializable {

	private int fileNo;
	private String oriFileName;
	private String ModiFileName;
	private Date uploadDate;
	private int boardNo;
	private int docNo;
	private int emailNo;
	private int empNo;
	private String empType;
	
	
	public Attachment(){}


	public Attachment(int fileNo, String oriFileName, String modiFileName, Date uploadDate, int boardNo, int docNo,
			int emailNo, int empNo, String empType) {
		super();
		this.fileNo = fileNo;
		this.oriFileName = oriFileName;
		ModiFileName = modiFileName;
		this.uploadDate = uploadDate;
		this.boardNo = boardNo;
		this.docNo = docNo;
		this.emailNo = emailNo;
		this.empNo = empNo;
		this.empType = empType;
	}


	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", oriFileName=" + oriFileName + ", ModiFileName=" + ModiFileName
				+ ", uploadDate=" + uploadDate + ", boardNo=" + boardNo + ", docNo=" + docNo + ", emailNo=" + emailNo
				+ ", empNo=" + empNo + ", empType=" + empType + "]";
	}


	public int getFileNo() {
		return fileNo;
	}


	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}


	public String getOriFileName() {
		return oriFileName;
	}


	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}


	public String getModiFileName() {
		return ModiFileName;
	}


	public void setModiFileName(String modiFileName) {
		ModiFileName = modiFileName;
	}


	public Date getUploadDate() {
		return uploadDate;
	}


	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getDocNo() {
		return docNo;
	}


	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}


	public int getEmailNo() {
		return emailNo;
	}


	public void setEmailNo(int emailNo) {
		this.emailNo = emailNo;
	}


	public int getEmpNo() {
		return empNo;
	}


	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}


	public String getEmpType() {
		return empType;
	}


	public void setEmpType(String empType) {
		this.empType = empType;
	}
	
	
	
	
}
