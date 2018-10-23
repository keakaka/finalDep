package com.kh.dep.sign.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Document implements java.io.Serializable{
	private int docNo;
	private String docTitle;
	private String docContent;
	private int docformNo;
	private Date writeDate;
	private int empNo;
	private String writer;
	private int appStatus;
	private int appReject;
	private String approvalStatus;
	private String appReason;
	private String approvalDate;
	
	public Document(){}

	public Document(int docNo, String docTitle, String docContent, int docformNo, Date writeDate, int empNo, String writer, 
			int appStatus, int appReject, String approvalStatus, String appReason, String approvalDate) {
		super();
		this.docNo = docNo;
		this.docTitle = docTitle;
		this.docContent = docContent;
		this.docformNo = docformNo;
		this.writeDate = writeDate;
		this.empNo = empNo;
		this.writer = writer;
		this.appStatus = appStatus;
		this.appReject = appReject;
		this.approvalStatus = approvalStatus;
		this.appReason = appReason;
		this.approvalDate = approvalDate;
	}

	@Override
	public String toString() {
		return "Document [docNo=" + docNo + ", docTitle=" + docTitle + ", docContent=" + docContent + ", docformNo=" + docformNo + ", writeDate="
				+ writeDate + ", empNo=" + empNo + ", writer=" + writer + ", appStatus=" + appStatus + ", approvalStatus=" + approvalStatus + 
				", appReason=" + appReason + ", appReject=" + appReject + ", approvalDate=" + approvalDate + "]";
	}

	public int getDocNo() {
		return docNo;
	}

	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}

	public String getDocTitle() {
		return docTitle;
	}

	public void setDocTitle(String docTitle) {
		this.docTitle = docTitle;
	}
	
	public String getDocContent() {
		return docContent;
	}

	public void setDocContent(String docContent) {
		this.docContent = docContent;
	}

	public int getDocformNo() {
		return docformNo;
	}

	public void setDocformNo(int docformNo) {
		this.docformNo = docformNo;
	}
	
	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	
	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getAppStatus() {
		return appStatus;
	}

	public void setAppStatus(int appStatus) {
		this.appStatus = appStatus;
	}
	
	public int getAppReject() {
		return appReject;
	}
	
	public void setAppReject(int appReject) {
		this.appReject = appReject;
	}
	
	public String getApprovalStatus() {
		return approvalStatus;
	}
	
	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public String getAppReason() {
		return appReason;
	}

	public void setAppReason(String appReason) {
		this.appReason = appReason;
	}

	public String getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(String approvalDate) {
		this.approvalDate = approvalDate;
	}
	
	
}
