package com.kh.dep.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.dep.member.exception.InsertRecordException;
import com.kh.dep.member.exception.LoginException;
import com.kh.dep.member.model.vo.Alarm;
import com.kh.dep.member.model.vo.Department;
import com.kh.dep.member.model.vo.Job;
import com.kh.dep.member.model.vo.Member;
import com.kh.dep.member.model.vo.MemberDepartment;
import com.kh.dep.member.model.vo.MemberJob;
import com.kh.dep.member.model.vo.MemberSelect;
import com.kh.dep.member.model.vo.Position;
import com.kh.dep.member.model.vo.SalaryExcel;
import com.kh.dep.member.model.vo.Vacation;
import com.kh.dep.member.model.vo.WorkingHours;

public interface MemberService {

	MemberSelect selectLoginMember(MemberSelect m) throws LoginException;


	int updateMyInfo(MemberSelect m);

	ArrayList<MemberDepartment> selectDepList();

	ArrayList<MemberJob> selectJobList();
	
	public List<Department> selectMyDepRecordInfo(String empId) throws Exception;


	List<Job> selectMyJobRecord(int empNo) throws Exception;


	List<Position> selectMyJobPositionRecord(int empNo) throws Exception;


	MemberSelect selectUpdateMember(MemberSelect m) throws Exception;


	int insertMember(MemberSelect m);


	boolean checkPw(String empId, String empPwd);


	int insertMyVacation(Vacation myVac);


	List<Vacation> selectMyVacationRecord(int empNo);

	List<WorkingHours> selectMyWorkingHoursRecord(int empNo);

	int selectempNumber();

	ArrayList<Position> selectpositList();


	int insertRecord(MemberSelect m) throws InsertRecordException;

	int updateMyImage(int empNo, String newFileName, String originFileName);


	List<SalaryExcel> xlsxExcelReader(MultipartHttpServletRequest req);


	List<SalaryExcel> xlsExcelReader(MultipartHttpServletRequest req);


	int insertLeaveMember(MemberSelect m) throws InsertRecordException;


	int insertMoveDept(MemberSelect m) throws InsertRecordException;


	ArrayList<MemberSelect> selectAllMember();


	List<SalaryExcel> selectSearchCondition(String depType, String jobType, String dateType, String nameType);


	List<Alarm> selectMyAlarmList(int empNo);


	int selectMyAlarmCount(int empNo);


	int updateMyAlarm(int alarmNo);


	List<SalaryExcel> selectMySalaryRecord(int empNo);


	int insertIdPwMember(int empNo);


}
