package com.kh.dep.board.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Board implements java.io.Serializable {
	
	
	private int boardNo;
	private int empNo;
	private String boardTitle;
	private String boardContent;
	private String boardType;
	private Date boardDate;
	private int selectCount;
	private String status;
	private String empName;
	private String jobName;
	private String depName;
	
	public Board(){}




	public Board(int boardNo, int empNo, String boardTitle, String boardContent, String boardType, Date boardDate,
			int selectCount, String status, String empName, String jobName, String depName) {
		super();
		this.boardNo = boardNo;
		this.empNo = empNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardType = boardType;
		this.boardDate = boardDate;
		this.selectCount = selectCount;
		this.status = status;
		this.empName = empName;
		this.jobName = jobName;
		this.depName = depName;
	}

	
	



	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", empNo=" + empNo + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", boardType=" + boardType + ", boardDate=" + boardDate + ", selectCount="
				+ selectCount + ", status=" + status + ", empName=" + empName + ", jobName=" + jobName + ", depName="
				+ depName + "]";
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




	public Date getBoardDate() {
		return boardDate;
	}





	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}





	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getEmpNo() {
		return empNo;
	}


	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}


	public String getBoardTitle() {
		return boardTitle;
	}


	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public String getBoardContent() {
		return boardContent;
	}


	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}


	public String getBoardType() {
		return boardType;
	}


	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}


	public int getSelectCount() {
		return selectCount;
	}


	public void setSelectCount(int selectCount) {
		this.selectCount = selectCount;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getEmpName() {
		return empName;
	}


	public void setEmpName(String empName) {
		this.empName = empName;
	}





	

	
	
}
