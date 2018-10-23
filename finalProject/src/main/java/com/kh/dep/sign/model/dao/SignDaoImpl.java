package com.kh.dep.sign.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dep.member.model.vo.Alarm;
import com.kh.dep.sign.model.exception.SelectDocException;
import com.kh.dep.sign.model.vo.Document;
import com.kh.dep.sign.model.vo.InsertSign;
import com.kh.dep.sign.model.vo.MemberDep;
import com.kh.dep.sign.model.vo.Proceeding;

@Repository
public class SignDaoImpl implements SignDao{


	@Override
	public ArrayList<MemberDep> selectMemberDep(SqlSessionTemplate sqlSession, String depName) {
		
		return (ArrayList)sqlSession.selectList("sign.selectMemberDep", depName);
	}

	@Override
	public int insertDocApproval(SqlSessionTemplate sqlSession, InsertSign is) {
		return sqlSession.insert("sign.insertDocApproval", is);
	}

	@Override
	public int selectGetDocNoSeq(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("sign.selectGetDocNoSeq");
	}
	
	@Override
	public int insertApproval_record(SqlSessionTemplate sqlSession, InsertSign is) {
		return sqlSession.insert("sign.insertApprovalRecord", is);
	}

	@Override
	public int insertReceiving_Check(SqlSessionTemplate sqlSession, InsertSign is) {
		return sqlSession.insert("sign.insertReceivingCheck", is);
	}

	@Override
	public int insertAttachment(SqlSessionTemplate sqlSession, InsertSign is) {
		System.out.println("DAO ATTACH 들어와?");
		return sqlSession.insert("sign.insertAttachment", is);
	}

	@Override
	public ArrayList<Document> selectImWriter(SqlSessionTemplate sqlSession, Document doc) {
		return (ArrayList)sqlSession.selectList("sign.selectImWriter", doc);
	}

	@Override
	public ArrayList selectGetDocNo(SqlSessionTemplate sqlSession, int empNo) throws SelectDocException {
		
		return (ArrayList)sqlSession.selectList("sign.selectGetDocNo", empNo);
	}

	@Override
	public Document selectApprovalList(SqlSessionTemplate sqlSession, Object object) {
		
		int docNo = (Integer)object;
		return sqlSession.selectOne("sign.selectApprovalList", docNo);
	}

	@Override
	public ArrayList selectGetRecDocNo(SqlSessionTemplate sqlSession, int empNo) {
		
		return (ArrayList)sqlSession.selectList("sign.selectGetRecDocNo", empNo);
	}

	@Override
	public Document selectReceiveList(SqlSessionTemplate sqlSession, Object object) {
		int docNo = (Integer)object;
		return sqlSession.selectOne("sign.selectReceiveList", docNo);
	}

	@Override
	public ArrayList selectGetComDocNo(SqlSessionTemplate sqlSession, int empNo) {
		
		return (ArrayList)sqlSession.selectList("sign.selectGetComDocNo", empNo);
	}

	@Override
	public Document selectCompleteList(SqlSessionTemplate sqlSession, Object object) {
		int docNo = (Integer)object;
		return sqlSession.selectOne("sign.selectCompleteList", docNo);
	}

	@Override
	public ArrayList<Document> selectAppProgress(SqlSessionTemplate sqlSession, int docNo) {
		
		return (ArrayList)sqlSession.selectList("sign.selectAppProgress", docNo);
	}

	@Override
	public InsertSign selectDocDetail(SqlSessionTemplate sqlSession, int docNo) {
		
		return sqlSession.selectOne("sign.selectDocDetail", docNo);
	}

	@Override
	public int updateApprovalStatus(SqlSessionTemplate sqlSession, Document d) {
		
		return sqlSession.update("sign.updateApprovalStatus", d);
	}

	@Override
	public int insertProceeding(SqlSessionTemplate sqlSession, Proceeding p) {
		return sqlSession.insert("sign.insertProceeding", p);
	}

	@Override
	public ArrayList<Proceeding> selectProceeding(SqlSessionTemplate sqlSession, int empNo) {
		return (ArrayList)sqlSession.selectList("sign.selectProceeding", empNo);
	}

	@Override
	public int deleteProceeding(SqlSessionTemplate sqlSession, Proceeding p) {
		return sqlSession.update("sign.deleteProceeding", p);
	}

	@Override
	public int insertSignAlarm(SqlSessionTemplate sqlSession, Alarm al) {
		
		return sqlSession.insert("sign.insertSignAlarm", al);
	}

	@Override
	public int nextApprovalMember(SqlSessionTemplate sqlSession, int docNo) {
		
		return sqlSession.selectOne("sign.nextApprovalMember", docNo);
	}

	@Override
	public ArrayList<Document> selectReceiverList(SqlSessionTemplate sqlSession, int docNo) {
		return (ArrayList)sqlSession.selectList("sign.selectReceiverList", docNo);
	}


	

	
	
}
