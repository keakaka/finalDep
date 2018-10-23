package com.kh.dep.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

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

public interface MemberDao {

	MemberSelect selectLoginMember(SqlSessionTemplate sqlSession, MemberSelect m);

	String selectEncpassword(SqlSessionTemplate sqlSession, MemberSelect m);


	int updateMyInfo(SqlSessionTemplate sqlSession, MemberSelect m);

	ArrayList<MemberDepartment> selectdepList(SqlSessionTemplate sqlSession);

	ArrayList<MemberJob> selectJobList(SqlSessionTemplate sqlSession);

	int insertMember(SqlSessionTemplate sqlSession, MemberSelect m);


	List<Department> selectMyDepRecordInfo(SqlSessionTemplate sqlSession, String empId) throws Exception;

	List<Job> selectMyJobRecord(SqlSessionTemplate sqlSession, int empNo) throws Exception;

	List<Position> selectMyJobPositionRecord(SqlSessionTemplate sqlSession, int empNo) throws Exception;


	String selectEncpassword(SqlSessionTemplate sqlSession, String empId);

	int insertMyVacation(SqlSessionTemplate sqlSession, Vacation myVac);

	List<Vacation> selectMyVacationRecrod(SqlSessionTemplate sqlSession, int empNo);

	List<WorkingHours> selectMyWorkingHoursRecord(SqlSessionTemplate sqlSession, int empNo);

	int selectempNumber(SqlSessionTemplate sqlSession);

	ArrayList<Position> selectposiList(SqlSessionTemplate sqlSession);

	int insertDepRecord(SqlSessionTemplate sqlSession, MemberSelect m);

	int insertPositRecord(SqlSessionTemplate sqlSession, MemberSelect m);

	int insertJobRecord(SqlSessionTemplate sqlSession, MemberSelect m);

	int updateMyImage(SqlSessionTemplate sqlSession, int empNo, String newFileName, String originFileName);

	List<SalaryExcel> xlsExcelReader(SqlSessionTemplate sqlSession, List<SalaryExcel> list);

	int insertLeaveMember(SqlSessionTemplate sqlSession, MemberSelect m);

	int insertMoveDept(SqlSessionTemplate sqlSession, MemberSelect m);

	ArrayList<MemberSelect> selectAllMember(SqlSessionTemplate sqlSession);

	List<SalaryExcel> xlsxExcelReader(SqlSessionTemplate sqlSession, List<SalaryExcel> list);

	List<SalaryExcel> selectSearchCondition(SqlSessionTemplate sqlSession, String depType, String jobType, String dateType, String nameType);

	List<Alarm> selectMyAlarmList(SqlSessionTemplate sqlSession, int empNo);

	int selectMyAlarmCount(SqlSessionTemplate sqlSession, int empNo);

	int updateMyAlarm(SqlSessionTemplate sqlSession, int alarmNo);

	List<SalaryExcel> selectMySalaryRecord(SqlSessionTemplate sqlSession, int empNo);

	int insertIdPwMember(SqlSessionTemplate sqlSession, MemberSelect m);

	int selectCheckMember(SqlSessionTemplate sqlSession, MemberSelect m);

	int selectCheckMoveDepMember(SqlSessionTemplate sqlSession, MemberSelect m);



}
