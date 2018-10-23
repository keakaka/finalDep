package com.kh.dep.sign.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dep.sign.model.exception.SelectDocException;
import com.kh.dep.sign.model.vo.Document;
import com.kh.dep.sign.model.vo.InsertSign;
import com.kh.dep.sign.model.vo.MemberDep;
import com.kh.dep.sign.model.vo.Proceeding;

public interface SignDao {

	ArrayList<MemberDep> selectMemberDep(SqlSessionTemplate sqlSession, String depName);

	int insertDocApproval(SqlSessionTemplate sqlSession, InsertSign is);
	
	int insertApproval_record(SqlSessionTemplate sqlSession, InsertSign is);
	
	int insertReceiving_Check(SqlSessionTemplate sqlSession, InsertSign is);
	
	int insertAttachment(SqlSessionTemplate sqlSession, InsertSign is);

	int selectGetDocNoSeq(SqlSessionTemplate sqlSession);

	ArrayList<Document> selectImWriter(SqlSessionTemplate sqlSession, Document doc);

	ArrayList selectGetDocNo(SqlSessionTemplate sqlSession, int empNo) throws SelectDocException;

	Document selectApprovalList(SqlSessionTemplate sqlSession, Object object);

	ArrayList selectGetRecDocNo(SqlSessionTemplate sqlSession, int empNo);

	Document selectReceiveList(SqlSessionTemplate sqlSession, Object object);

	ArrayList selectGetComDocNo(SqlSessionTemplate sqlSession, int empNo);

	Document selectCompleteList(SqlSessionTemplate sqlSession, Object object);

	ArrayList<Document> selectAppProgress(SqlSessionTemplate sqlSession, int docNo);

	InsertSign selectDocDetail(SqlSessionTemplate sqlSession, int docNo);

	int updateApprovalStatus(SqlSessionTemplate sqlSession, Document d);

	int insertProceeding(SqlSessionTemplate sqlSession, Proceeding p);

	ArrayList<Proceeding> selectProceeding(SqlSessionTemplate sqlSession, int empNo);

	int deleteProceeding(SqlSessionTemplate sqlSession, Proceeding p);

	
}
