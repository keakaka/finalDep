package com.kh.dep.personManagement.model.vo;

import java.sql.Date;

public class Tdatel {

	private Date tdate;
	
	public Tdatel()
	{}
	
	public Date getTdate() {
		return tdate;
	}

	public void setTdate(Date tdate) {
		this.tdate = tdate;
	}

	public Tdatel(Date tdate) {
		super();
		this.tdate = tdate;
	}

	@Override
	public String toString() {
		return "Tdate [tdate=" + tdate + "]";
	}
	
	

	
}

	