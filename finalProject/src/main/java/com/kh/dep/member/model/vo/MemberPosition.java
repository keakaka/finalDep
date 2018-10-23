package com.kh.dep.member.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class MemberPosition implements java.io.Serializable{
	
	private String positionNo;
	private String positionName;
	private String status;
	
	
	public MemberPosition(){}


	public MemberPosition(String positionNo, String positionName, String status) {
		super();
		this.positionNo = positionNo;
		this.positionName = positionName;
		this.status = status;
	}


	public String getPositionNo() {
		return positionNo;
	}


	public void setPositionNo(String positionNo) {
		this.positionNo = positionNo;
	}


	public String getPositionName() {
		return positionName;
	}


	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "MemberPosition [positionNo=" + positionNo + ", positionName=" + positionName + ", status=" + status
				+ "]";
	}
	
	

}
