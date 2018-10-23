package com.kh.dep.sign.model.service;

import java.util.ArrayList;

import com.kh.dep.sign.model.exception.InsertSignException;
import com.kh.dep.sign.model.exception.SelectDocException;
import com.kh.dep.sign.model.vo.Document;
import com.kh.dep.sign.model.vo.InsertSign;
import com.kh.dep.sign.model.vo.MemberDep;
import com.kh.dep.sign.model.vo.Proceeding;

public interface SignService {

	ArrayList<MemberDep> selectMemberDep(String depName);

	int insertSign(InsertSign is) throws InsertSignException;

	ArrayList<Document> selectImWriter(Document doc) throws SelectDocException;

	ArrayList<Document> selectApprovalList(int empNo) throws SelectDocException;

	ArrayList<Document> selectReceiveList(int empNo) throws SelectDocException;

	ArrayList<Document> selectCompleteList(int empNo);

	ArrayList<Document> selectAppProgress(int docNo);

	InsertSign selectDocDetail(int docNo);

	int updateApprovalStatus(Document d);

	int insertProceeding(Proceeding p);

	ArrayList<Proceeding> selectProceeding(int empNo);

	int deleteProceeding(Proceeding p);
	
}
