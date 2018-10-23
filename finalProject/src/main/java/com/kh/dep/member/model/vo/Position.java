package com.kh.dep.member.model.vo;

import java.sql.Date;

public class Position implements java.io.Serializable {
	private String seqNum;
	private int positionRecordNo;
	private String positionName;
	private String positionReason;
	private Date positionRecordDate;
	private String empName;
	
	public Position(){}

	public Position(String seqNum, int positionRecordNo, String positionName, String positionReason,
			Date positionRecordDate, String empName) {
		super();
		this.seqNum = seqNum;
		this.positionRecordNo = positionRecordNo;
		this.positionName = positionName;
		this.positionReason = positionReason;
		this.positionRecordDate = positionRecordDate;
		this.empName = empName;
	}

	public String getSeqNum() {
		return seqNum;
	}

	public void setSeqNum(String seqNum) {
		this.seqNum = seqNum;
	}

	public int getPositionRecordNo() {
		return positionRecordNo;
	}

	public void setPositionRecordNo(int positionRecordNo) {
		this.positionRecordNo = positionRecordNo;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getPositionReason() {
		return positionReason;
	}

	public void setPositionReason(String positionReason) {
		this.positionReason = positionReason;
	}

	public Date getPositionRecordDate() {
		return positionRecordDate;
	}

	public void setPositionRecordDate(Date positionRecordDate) {
		this.positionRecordDate = positionRecordDate;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	@Override
	public String toString() {
		return "Position [seqNum=" + seqNum + ", positionRecordNo=" + positionRecordNo + ", positionName="
				+ positionName + ", positionReason=" + positionReason + ", positionRecordDate=" + positionRecordDate
				+ ", empName=" + empName + "]";
	}
	
	
}
