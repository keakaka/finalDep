package com.kh.dep.personManagement.model.pmDao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;


import com.kh.dep.personManagement.model.vo.DepLeave;
import com.kh.dep.personManagement.model.vo.DepMoveDepRecord;
import com.kh.dep.personManagement.model.vo.PromotionIn;
import com.kh.dep.personManagement.model.vo.PromotionLi;
import com.kh.dep.personManagement.model.vo.VacationIn;
import com.kh.dep.personManagement.model.vo.VacationLi;
import com.kh.dep.personManagement.model.vo.Working;

public interface PmDao {

	ArrayList<Working> depMgtList(SqlSessionTemplate sqlSession, String depName);

	ArrayList<Working> depMgtdayList(SqlSessionTemplate sqlSession, String day ,String depName , String year);

	ArrayList<VacationLi> vacationDayList(SqlSessionTemplate sqlSession, String day);

	ArrayList<VacationLi> vacationDepList(SqlSessionTemplate sqlSession, String depName);

	ArrayList<PromotionLi> selectPromotionList(SqlSessionTemplate sqlSession, String depName);

	ArrayList<PromotionLi> selectPromotiondayList(SqlSessionTemplate sqlSession, String day , String depName , String year);

	ArrayList<DepLeave> selectDepLeaveList(SqlSessionTemplate sqlSession, String depName);

	ArrayList<DepLeave> selectDepLeavedayList(SqlSessionTemplate sqlSession, String depName, String day, String year);

	ArrayList<DepMoveDepRecord> selectDepmoveList(SqlSessionTemplate sqlSession, String depName);

	ArrayList<DepMoveDepRecord> selectDepmovedayList(SqlSessionTemplate sqlSession, String depName, String day,
			String year);

	ArrayList<DepMoveDepRecord> selectDepmoveEmpNoList(SqlSessionTemplate sqlSession, int empNo);

	int insertVacation(SqlSessionTemplate sqlSession, VacationIn v);

	int insertProomotion(SqlSessionTemplate sqlSession, PromotionIn p);

	ArrayList<Working> depNameList(SqlSessionTemplate sqlSession, int empNo);


}
