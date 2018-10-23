package com.kh.dep.facing.model.facingDao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dep.facing.model.exception.FacingSelectListException;
import com.kh.dep.facing.model.vo.Alram;
import com.kh.dep.facing.model.vo.Facing;
import com.kh.dep.facing.model.vo.FacingInsert;
import com.kh.dep.facing.model.vo.FacingInsertR;
import com.kh.dep.facing.model.vo.WorkingQr;
import com.kh.dep.facing.model.vo.WorkingRecord;
import com.kh.dep.member.model.vo.Member;

@Repository
public class FacingDaoImpl implements FacingDao {
	@Inject
	SqlSession sqlSession;
	private ArrayList<Object> FaicngList;
	
	@Override
	public ArrayList<Facing> selectFacingList(SqlSessionTemplate sqlSession, int empNo ) throws FacingSelectListException   {
		// TODO Auto-generated method stub
		
		System.out.println("다오 입장");
		ArrayList FacingList = (ArrayList) sqlSession.selectList("Facing.selectFacing", empNo);
		
		System.out.println("FacingList : " + FacingList );
		if(FacingList == null)
		{
			throw new FacingSelectListException("리스트 조회 실패");
		}
		System.out.println("FacingList : " + FacingList );
		
		
		return FacingList;
		
	}

	@Override
	public ArrayList<Facing> selectReciveList(SqlSessionTemplate sqlSession, int receiver) throws FacingSelectListException {
		// TODO Auto-generated method stub
		
		System.out.println("다오입장");
		
		ArrayList FacingReciverList = (ArrayList) sqlSession.selectList("Facing.reciveFacing",receiver);
		
		System.out.println("수신자 돌아온 리스트 값" + FacingReciverList);
		
		if(FacingReciverList == null)
		{
			throw new FacingSelectListException("리스트 조회 실패");
		}
		return FacingReciverList;
		
	}

	@Override
	public Facing selectOneFaicng(SqlSessionTemplate sqlSession, int facingNo) throws FacingSelectListException {
		// TODO Auto-generated method stub
		System.out.println("상세보기 다오입장!");
		
		Facing f = (Facing) sqlSession.selectOne("Facing.selectOneFacing" , facingNo);
		System.out.println("dao eno : " + f.getEmailNo());
		if(f == null)
		{
			throw new FacingSelectListException("리스트 조회 실패");
		}

		System.out.println("돌아온 상세보기 :" + f);
		
		
		return f;
	}

	@Override
	public int updateFacing(SqlSessionTemplate sqlSession, int facingNo) {
		// TODO Auto-generated method stub
		
		int result = sqlSession.update("Facing.updateFacing", facingNo);
		
		System.out.println("돌아온 업데이트 리절트 값" + result);
		return result;
	}

	@Override
	public int insertWorking(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		
		System.out.println("인설트 다오 ");
		
		int reuselt = sqlSession.insert("Facing.insertWorking",empNo);  
		
		return reuselt;
		
	}

	@Override
	public int insertFacing(SqlSessionTemplate sqlSession, FacingInsert fi) {
		// TODO Auto-generated method stub
		
		System.out.println("페이징 인설트 다오");
		
		int result = sqlSession.insert("Facing.insertFacing",fi);
		System.out.println("인서트완료 : " + result);
		return result;
	}

	@Override
	public Facing selectNowFaicng(int empNo) {
		// TODO Auto-generated method stub
		
		Facing nowFacing = (Facing) sqlSession.selectOne("Facing.selectNowFaicng",empNo);
		System.out.println("돌아온 최근 데이터" + nowFacing);
		return nowFacing;
	}

	@Override
	public int insertReceiver(FacingInsertR fir) {
		// TODO Auto-generated method stub
		System.out.println("수신자 등록 다오도착");
		int resultR = sqlSession.insert("Facing.insertFaicngR",fir);
		System.out.println("수신자 인서트완료 : " + resultR);
		return resultR;
	}

	@Override
	public int insertAlram(Alram al) {
		// TODO Auto-generated method stub
		int alram = sqlSession.insert("Facing.insertAlram",al);
		System.out.println("알람 인설트완료");
		return alram;
	}

	@Override
	public ArrayList<WorkingQr> selectWorking(SqlSessionTemplate sqlSession,int empNo) {
		// TODO Auto-generated method stub
		
		ArrayList qrList = (ArrayList) sqlSession.selectList("Facing.selectQrList" , empNo);
	
		System.out.println("돌아온 qr 리스트" + qrList);
		
		return qrList;
	}

	@Override
	public int selectAlarmCount(SqlSessionTemplate sqlSession, int receiverEmpNo) {
		int alarmCount = sqlSession.selectOne("Facing.selectAlarmCount", receiverEmpNo);
		System.out.println("alarmCount(dao) : " + alarmCount);
		return alarmCount;
	}

	

	

/*	@Override
	public int insertFacing(SqlSessionTemplate sqlSession, Facing f) {
		// TODO Auto-generated method stub
		
		System.out.println("인설트 다오 도착 ");
		
		return sqlSession.insert("Facing.insertFacing" , f);
	}

	@Override
	public Facing selectInsertFacing(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return null;
	}*/

	

}
