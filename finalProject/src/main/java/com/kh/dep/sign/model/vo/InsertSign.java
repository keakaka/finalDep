package com.kh.dep.sign.model.vo;

import java.util.Arrays;

import org.springframework.stereotype.Repository;

@Repository
public class InsertSign implements java.io.Serializable{
	private int docNo;
	private String filePath;
	private String originFileName;
	private String changeName;
	private String ext;
	private String signTitle;
	private String signContent;
	private int writer;
	private int empNo;
	private int[] appList;
	private int[] recList;
	
	public InsertSign(){}
	
	public InsertSign(int docNo, String filePath, String originFileName, String changeName, String ext, String signTitle,
			String signContent, int writer, int empNo, int[] appList, int[] recList) {
		super();
		this.docNo = docNo;
		this.filePath = filePath;
		this.originFileName = originFileName;
		this.changeName = changeName;
		this.ext = ext;
		this.signTitle = signTitle;
		this.signContent = signContent;
		this.writer = writer;
		this.empNo = empNo;
		this.appList = appList;
		this.recList = recList;
	}

	@Override
	public String toString() {
		return "InsertSign [docNo=" + docNo + ", filePath=" + filePath + ", originFileName=" + originFileName + ", changeName=" + changeName
				+ ", ext=" + ext + ", signTitle=" + signTitle + ", signContent=" + signContent + ", writer=" + writer + ", empNo=" + empNo
				+ ", appList=" + Arrays.toString(appList) + ", recList=" + Arrays.toString(recList) + "]";
	}

	public int getDocNo() {
		return docNo;
	}
	
	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}
	
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	public String getSignTitle() {
		return signTitle;
	}

	public void setSignTitle(String signTitle) {
		this.signTitle = signTitle;
	}

	public String getSignContent() {
		return signContent;
	}

	public void setSignContent(String signContent) {
		this.signContent = signContent;
	}

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
	}
	
	public int getEmpNo() {
		return empNo;
	}
	
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	
	public int[] getAppList() {
		return appList;
	}

	public void setAppList(int[] appList) {
		this.appList = appList;
	}

	public int[] getRecList() {
		return recList;
	}

	public void setRecList(int[] recList) {
		this.recList = recList;
	}
	
	
	
}
