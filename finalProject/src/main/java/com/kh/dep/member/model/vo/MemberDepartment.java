package com.kh.dep.member.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class MemberDepartment implements java.io.Serializable  {

	private String depId;
	private String depName;
	private String depPhone;
	private String status;
	
	public MemberDepartment(){}
	
	

	
	
	
	public MemberDepartment(String depId, String depName, String depPhone, String status) {
		super();
		this.depId = depId;
		this.depName = depName;
		this.depPhone = depPhone;
		this.status = status;
	}


	


	@Override
	public String toString() {
		return "MemberDepartment [depId=" + depId + ", depName=" + depName + ", depPhone=" + depPhone + ", status="
				+ status + "]";
	}




	public String getDepId() {
		return depId;
	}

	public void setDepId(String depId) {
		this.depId = depId;
	}

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}

	public String getDepPhone() {
		return depPhone;
	}

	public void setDepPhone(String depPhone) {
		this.depPhone = depPhone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
