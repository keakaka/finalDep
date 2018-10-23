package com.kh.dep.facing.model.facingService;

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

public interface FacingService {


	ArrayList<Facing> selectFacingList(int userNo) throws FacingSelectListException;

	ArrayList<Facing> selectReciveList(int empNO) throws FacingSelectListException;

	Facing selectOneFacing(int fNo) throws FacingSelectListException;

	ArrayList<Facing> updateFacing(int fNo, int fus) throws FacingSelectListException;

	int InsertWorking(int empNo);

	int insertFacing(FacingInsert fi);

	Facing selectNowFacing(int empNo);

	int insertReceiver(FacingInsertR fir);

	int insertAlram(Alram al);

	ArrayList<WorkingQr> selectWorking(int empNo);

	int selectAlarmCount(int receiverEmpNo);
	

/*	Facing selectInsertFaicng(int empNo);
*/	
	
	
	
	
	
}
