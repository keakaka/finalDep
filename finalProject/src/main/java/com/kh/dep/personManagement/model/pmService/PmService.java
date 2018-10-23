package com.kh.dep.personManagement.model.pmService;

import java.util.ArrayList;

import com.kh.dep.personManagement.model.vo.DepLeave;
import com.kh.dep.personManagement.model.vo.DepMoveDepRecord;
import com.kh.dep.personManagement.model.vo.PromotionIn;
import com.kh.dep.personManagement.model.vo.PromotionLi;
import com.kh.dep.personManagement.model.vo.VacationIn;
import com.kh.dep.personManagement.model.vo.VacationLi;
import com.kh.dep.personManagement.model.vo.Working;


public interface PmService {

	ArrayList<Working> depMgtList(String depName);

	ArrayList<Working> depMgtdayList(String day ,String depName , String year);

	ArrayList<VacationLi> vacationDayList(String day);
	
	ArrayList<VacationLi> vacationDepList(String depName);

	ArrayList<PromotionLi> selectPromotionList(String depName);

	ArrayList<PromotionLi> selectPromotiondayList(String day,String depName ,String year);


	ArrayList<DepLeave> selectDepLeaveList(String depName);

	ArrayList<DepLeave> selectDepLeavedayList(String day, String depName, String year);

	ArrayList<DepMoveDepRecord> selectDepmoveList(String depName);

	ArrayList<DepMoveDepRecord> selectDepMovedayList(String day, String depName, String year);

	ArrayList<DepMoveDepRecord> selectDepMoveEmpNoList(int empNo);

	int insertvacation(VacationIn v);

	int insertpromotion(PromotionIn p);

	ArrayList<Working> depNameList(String name);

	
	
	

}
