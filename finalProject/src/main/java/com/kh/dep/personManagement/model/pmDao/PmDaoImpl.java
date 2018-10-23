package com.kh.dep.personManagement.model.pmDao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.dep.personManagement.model.vo.DepLeave;
import com.kh.dep.personManagement.model.vo.DepMoveDepRecord;
import com.kh.dep.personManagement.model.vo.PromotionIn;
import com.kh.dep.personManagement.model.vo.PromotionLi;
import com.kh.dep.personManagement.model.vo.VacationIn;
import com.kh.dep.personManagement.model.vo.VacationLi;
import com.kh.dep.personManagement.model.vo.Working;


@Repository
public class PmDaoImpl implements PmDao {

	
	@Override
	public ArrayList<Working> depMgtList(SqlSessionTemplate sqlSession, String depName) {
		// TODO Auto-generated method stub
		
		System.out.println("근태 다오 입장");
		Working w = new Working();
		ArrayList<Working> list = (ArrayList) sqlSession.selectList("Working.workingSelectList" , depName);
		
	


		for(int i = 0; i<list.size(); i++)
		{
			System.out.println("출근시간 : " + list.get(i).gettTime());
			String sysdate = list.get(i).gettTime();
			String sibal = sysdate.substring(0,2);
			
			System.out.println("시발 : " + sibal);
			int sibalint = Integer.parseInt(sibal);
			String jigak ="지각" ;
			String chul ="정상출근";
			if(sibalint > 10)
			{
			
				list.get(i).setState(jigak);;
				System.out.println("리스트 출력1 :" + list);
			}else
			{
				
		
				list.get(i).setState(chul);
				
			}
		
			
		}
		
		System.out.println("다오 상태" + list);
		return list;
	}

	@Override
	public ArrayList<Working> depMgtdayList(SqlSessionTemplate sqlSession, String day,String depName , String year) {
		// TODO Auto-generated method stub
		System.out.println("근태 다오 입장");
		Working workingLi = new Working();
		workingLi.setDay(day);
		workingLi.setYear(year);
		workingLi.setDepName(depName);
		ArrayList<Working> list = (ArrayList) sqlSession.selectList("Working.workingdaySelectList",workingLi);
		for(int i = 0; i<list.size(); i++)
		{
			System.out.println("출근시간 : " + list.get(i).gettTime());
			String sysdate = list.get(i).gettTime();
			String sibal = sysdate.substring(0,2);
			
			System.out.println("시발 : " + sibal);
			int sibalint = Integer.parseInt(sibal);
			String jigak ="지각" ;
			String chul ="정상출근";
			if(sibalint > 10)
			{
				//w.setState(jigak);
				//System.out.println(w.getState());
				list.get(i).setState(jigak);;
				System.out.println("리스트 출력1 :" + list);
			}else
			{
				
				//w.setState(chul);
				//System.out.println(w.getState());
				//list.add(w);
				list.get(i).setState(chul);
				
				//System.out.println("리스트 출력2 :" + list);
			}
			
			//System.out.println("포문 리스트 출력 :" + list);
			
		
		}
		return list;
	}

	@Override
	public ArrayList<VacationLi> vacationDayList(SqlSessionTemplate sqlSession, String day) {
		// TODO Auto-generated method stub
		System.out.println("휴가 월별 다오 입장");
		ArrayList<VacationLi> list = (ArrayList) sqlSession.selectList("Working.vacationDaySelectList",day);
		System.out.println("월별 돌아온 리스트값" + list);
		return list;
	}

	@Override
	public ArrayList<VacationLi> vacationDepList(SqlSessionTemplate sqlSession, String depName) {
		// TODO Auto-generated method stub
		System.out.println("휴가 부서별 다오 입장");
		ArrayList<VacationLi> list = (ArrayList) sqlSession.selectList("Working.vacationDepSelectList",depName);
		System.out.println("부서별 돌아온 리스트값" + list);
		return list;
	}

	@Override
	public ArrayList<PromotionLi> selectPromotionList(SqlSessionTemplate sqlSession, String depName) {
		// TODO Auto-generated method stub
		System.out.println("진급 부서별 다오 입장");
		ArrayList<PromotionLi> list = (ArrayList) sqlSession.selectList("Working.promotionDepSelectList",depName);
		System.out.println("부서별 돌아온 리스트값" + list);
		return list;
	}

	@Override
	public ArrayList<PromotionLi> selectPromotiondayList(SqlSessionTemplate sqlSession, String day ,String depName ,String year) {
		// TODO Auto-generated method stub
		System.out.println("진급 날짜 부서별 다오 입장");
		
		PromotionLi Promotion = new PromotionLi();
		
		Promotion.setDay(day);
		Promotion.setDepName(depName);
		Promotion.setYear(year);
		ArrayList<PromotionLi> list = (ArrayList) sqlSession.selectList("Working.promotionDaySelectList",Promotion);
		
		System.out.println("부서별 돌아온 리스트값" + list);
		
		return list;
	}


	// 부서별 퇴사자 조회
	@Override
	public ArrayList<DepLeave> selectDepLeaveList(SqlSessionTemplate sqlSession, String depName) {
		
		
		
		return (ArrayList)sqlSession.selectList("Working.selectDepLeaveList", depName);
	}

	// 부서별 월별 퇴사자 조회
	@Override
	public ArrayList<DepLeave> selectDepLeavedayList(SqlSessionTemplate sqlSession, String depName, String day,
			String year) {
		
		DepLeave dl = new DepLeave();
		
		dl.setDepName(depName);
		dl.setDay(day);
		dl.setYear(year);
		
		return (ArrayList)sqlSession.selectList("Working.selectDepLeavedayList" , dl);
	}
	// 부서이동 이력 조회
	@Override
	public ArrayList<DepMoveDepRecord> selectDepmoveList(SqlSessionTemplate sqlSession, String depName) {
		
		return (ArrayList)sqlSession.selectList("Working.selectDepMoveList", depName);
	}
	// 월별 부서이동 이력 조회
	@Override
	public ArrayList<DepMoveDepRecord> selectDepmovedayList(SqlSessionTemplate sqlSession, String depName, String day,
			String year) {
		DepMoveDepRecord dm = new DepMoveDepRecord();
		
		dm.setDepName(depName);
		dm.setDay(day);
		dm.setYear(year);
		
		return (ArrayList)sqlSession.selectList("Working.selectDepMoveDayList", dm);
	}
	//
	@Override
	public ArrayList<DepMoveDepRecord> selectDepmoveEmpNoList(SqlSessionTemplate sqlSession, int empNo) {
		
		return (ArrayList)sqlSession.selectList("Working.selectDepMoveEmpNoList", empNo);
	}

	@Override
	public int insertVacation(SqlSessionTemplate sqlSession, VacationIn v) {
		// TODO Auto-generated method stub
		System.out.println("휴가 인설트 도착");
		
		int result = sqlSession.insert("Working.insertVacation", v);
		
		System.out.println("result " + result );
		
		return result;
	}

	@Override
	public int insertProomotion(SqlSessionTemplate sqlSession, PromotionIn p) {
		// TODO Auto-generated method stub
		System.out.println("진급 인설트 도착");
		
		int result = sqlSession.insert("Working.insertPromotion" , p);
		
		System.out.println("result" + result);
		
		return result;
	}

	@Override
	public ArrayList<Working> depNameList(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		
		ArrayList<Working> list = (ArrayList) sqlSession.selectList("Working.workingNameSelectList",empNo);
		
		for(int i = 0; i<list.size(); i++)
		{
			System.out.println("출근시간 : " + list.get(i).gettTime());
			String sysdate = list.get(i).gettTime();
			String sibal = sysdate.substring(0,2);
			
			System.out.println("시발 : " + sibal);
			int sibalint = Integer.parseInt(sibal);
			String jigak ="지각" ;
			String chul ="정상출근";
			if(sibalint > 10)
			{
			
				list.get(i).setState(jigak);;
				System.out.println("리스트 출력1 :" + list);
			}else
			{
				
		
				list.get(i).setState(chul);
				
			}
		
			
		}
		return list;
	}

	

}
