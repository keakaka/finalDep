package com.kh.dep.sign.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dep.member.model.vo.Alarm;
import com.kh.dep.sign.model.dao.SignDao;
import com.kh.dep.sign.model.exception.InsertSignException;
import com.kh.dep.sign.model.exception.SelectDocException;
import com.kh.dep.sign.model.vo.Document;
import com.kh.dep.sign.model.vo.InsertSign;
import com.kh.dep.sign.model.vo.MemberDep;
import com.kh.dep.sign.model.vo.Proceeding;

@Service
public class SignServiceImpl implements SignService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SignDao sd;
	
	@Override
	public ArrayList<MemberDep> selectMemberDep(String depName) {
		
		return sd.selectMemberDep(sqlSession, depName);
	}

	@Override
	public int insertSign(InsertSign is) throws InsertSignException{
		if(is.getOriginFileName() != null){
		int result = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		int result5 = 0;
		int result1 = sd.insertDocApproval(sqlSession, is);
		
		int getDocNo = sd.selectGetDocNoSeq(sqlSession);
		is.setDocNo(getDocNo);
		
		for(int i = 0; i < is.getAppList().length; i++){
			
			is.setEmpNo(is.getAppList()[i]);
			result2 = sd.insertApproval_record(sqlSession, is);
			
		}
		
		Alarm al = new Alarm();
		al.setEmpNo(is.getAppList()[0]);
		al.setAlarmContents("새로운 문서 결재가 있습니다.");
		System.out.println("al empNo : " + al.getEmpNo());
		System.out.println("app 0 : " + is.getAppList()[0]);
		result5 = sd.insertSignAlarm(sqlSession, al);
		
		for(int i = 0; i < is.getRecList().length; i++){
			is.setEmpNo(is.getRecList()[i]);
			result3 = sd.insertReceiving_Check(sqlSession, is);
		}
		
		result4 = sd.insertAttachment(sqlSession, is);
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0 && result5 > 0){
			result = 1;
			return result;
		}else{
			throw new InsertSignException("전자문서 기안 실패");
		}
		}else{
			int result = 0;
			int result2 = 0;
			int result3 = 0;
			int result4 = 0;
			int result5 = 0;
			int result1 = sd.insertDocApproval(sqlSession, is);
			
			int getDocNo = sd.selectGetDocNoSeq(sqlSession);
			is.setDocNo(getDocNo);
			
			for(int i = 0; i < is.getAppList().length; i++){
				if(i == 0){
					Alarm al = new Alarm();
					al.setEmpNo(is.getAppList()[i]);
					al.setAlarmContents("새로운 문서 결재가 있습니다.");
					result5 = sd.insertSignAlarm(sqlSession, al);
				}
				is.setEmpNo(is.getAppList()[i]);
				result2 = sd.insertApproval_record(sqlSession, is);
				
			}
			
			for(int i = 0; i < is.getRecList().length; i++){
				is.setEmpNo(is.getRecList()[i]);
				result3 = sd.insertReceiving_Check(sqlSession, is);
			}
			if(result1 > 0 && result2 > 0 && result3 > 0){
				result = 1;
				return result;
			}else{
				throw new InsertSignException("전자문서 기안 실패");
			}
		}
		
	}

	@Override
	public ArrayList<Document> selectImWriter(Document doc) throws SelectDocException {
		ArrayList<Document> list = sd.selectImWriter(sqlSession, doc);
		
		if(list != null){
			return list;
		}else{
			throw new SelectDocException("기안한 문서 조회 실패");
		}
		
	}

	@Override
	public ArrayList<Document> selectApprovalList(int empNo) throws SelectDocException{
		ArrayList docList = sd.selectGetDocNo(sqlSession, empNo);
		
		ArrayList<Document> list = null;
		
		if(docList != null){
			list = new ArrayList();
			for(int i = 0; i < docList.size(); i++){
				Document d = new Document();
				d = sd.selectApprovalList(sqlSession, docList.get(i));
				if(d != null){
					list.add(d);
				}
			}
		}
		return list;
	}

	@Override
	public ArrayList<Document> selectReceiveList(int empNo) throws SelectDocException {
		ArrayList docList = sd.selectGetRecDocNo(sqlSession, empNo);
		ArrayList<Document> list = new ArrayList<Document>();
		for(int i = 0; i < docList.size(); i++){
			Document d = new Document();
			d = sd.selectReceiveList(sqlSession, docList.get(i));
			if(d != null){
				if(d.getAppStatus() == 0){
					list.add(d);
				}
			}
		}
		
		return list;
	}

	@Override
	public ArrayList<Document> selectCompleteList(int empNo) {
		ArrayList docList = sd.selectGetComDocNo(sqlSession, empNo);
		ArrayList<Document> list = new ArrayList<Document>();
		
		for(int i = 0; i < docList.size(); i++){
			Document d = new Document();
			d = sd.selectCompleteList(sqlSession, docList.get(i));
			if(d != null){
				if(d.getAppStatus() == 0){
					list.add(d);
				}
			}
		}
		return list;
	}

	@Override
	public ArrayList<Document> selectAppProgress(int docNo) {
		
		return sd.selectAppProgress(sqlSession, docNo);
	}

	@Override
	public InsertSign selectDocDetail(int docNo) {
		
		return sd.selectDocDetail(sqlSession, docNo);
	}

	@Override
	public int updateApprovalStatus(Document d) {
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		if(d.getApprovalStatus() != "AP3"){
			result1 = sd.updateApprovalStatus(sqlSession, d);
			int appNo = sd.nextApprovalMember(sqlSession, d.getDocNo());
			System.out.println("appNo : " + appNo);
			if(appNo > 0){
				Alarm al = new Alarm();
				al.setAlarmContents("새로운 결재문서가 있습니다.");
				al.setEmpNo(appNo);
				result2 = sd.insertSignAlarm(sqlSession, al);
				
				if(result1 > 0 && result2 > 0){
					result = 1;
				}else{
					result = 0;
				}
			}else{
				ArrayList<Document> list = sd.selectReceiverList(sqlSession, d.getDocNo());
				for(int i = 0; i < list.size(); i++){
					Alarm al = new Alarm();
					al.setAlarmContents("새로운 결재문서가 있습니다.");
					al.setEmpNo(list.get(i).getEmpNo());
					result1 = sd.insertSignAlarm(sqlSession, al);
					if(result1 <= 0){
						break;
					}
				}
				if(result1 > 0){
					result = 1;
				}else{
					result = 0;
				}
			}
		}else{
			result1 = sd.updateApprovalStatus(sqlSession, d);
			if(result1 > 0){
				result = 1;
			}else{
				result = 0;
			}
		}
		return result;
	}

	@Override
	public int insertProceeding(Proceeding p) {
		
		return sd.insertProceeding(sqlSession, p);
	}

	@Override
	public ArrayList<Proceeding> selectProceeding(int empNo) {
		
		return sd.selectProceeding(sqlSession, empNo);
	}

	@Override
	public int deleteProceeding(Proceeding p) {
		return sd.deleteProceeding(sqlSession, p);
	}
	
	
	
}
