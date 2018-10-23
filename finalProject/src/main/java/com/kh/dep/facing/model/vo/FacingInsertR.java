package com.kh.dep.facing.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class FacingInsertR implements java.io.Serializable {
	
	private int facingNo;
	private int receiver;
	private Date receiverDate;

	public FacingInsertR()
	{
		
	}
	
public FacingInsertR(int facingNo, int receiver, Date receiverDate) {
	super();
	this.facingNo = facingNo;
	this.receiver = receiver;
	this.receiverDate = receiverDate;
}
public int getFacingNo() {
	return facingNo;
}
public void setFacingNo(int facingNo) {
	this.facingNo = facingNo;
}
public int getReceiver() {
	return receiver;
}
public void setReceiver(int receiver) {
	this.receiver = receiver;
}
public Date getReceiverDate() {
	return receiverDate;
}
public void setReceiverDate(Date receiverDate) {
	this.receiverDate = receiverDate;
}
@Override
public String toString() {
	return "FacingInsertR [facingNo=" + facingNo + ", receiver=" + receiver + ", receiverDate=" + receiverDate + "]";
}

	




	
}
