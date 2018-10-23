package com.kh.dep.facing.model.facingDao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dep.facing.model.exception.FacingSelectListException;
import com.kh.dep.facing.model.vo.Alram;
import com.kh.dep.facing.model.vo.Facing;
import com.kh.dep.facing.model.vo.FacingInsert;
import com.kh.dep.facing.model.vo.FacingInsertR;
import com.kh.dep.facing.model.vo.WorkingQr;
import com.kh.dep.facing.model.vo.WorkingRecord;
import com.kh.dep.member.model.vo.Member;
import com.kh.dep.member.model.vo.MemberJob;

public interface FacingDao {

/*	ArrayList<Facing> selectFacingList(SqlSessionTemplate sqlSession ,int userNo);
*/
	
	ArrayList<Facing> selectFacingList(SqlSessionTemplate sqlSession, int userNo) throws FacingSelectListException;

	ArrayList<Facing> selectReciveList(SqlSessionTemplate sqlSession, int userNo) throws FacingSelectListException;

	Facing selectOneFaicng(SqlSessionTemplate sqlSession, int fNo) throws FacingSelectListException;

	int updateFacing(SqlSessionTemplate sqlSession, int fNo);

	int insertWorking(SqlSessionTemplate sqlSession, int empNo);

	int insertFacing(SqlSessionTemplate sqlSession, FacingInsert fi);

	Facing selectNowFaicng(int empNo);

	int insertReceiver(FacingInsertR fir);

	int insertAlram(Alram al);

	ArrayList<WorkingQr> selectWorking(SqlSessionTemplate sqlSession,int empNo);

	int selectAlarmCount(SqlSessionTemplate sqlSession, int receiverEmpNo);


	

/*	int insertFacing(SqlSessionTemplate sqlSession, Facing f);

	Facing selectInsertFacing(SqlSessionTemplate sqlSession, int empNo);
*/



}
