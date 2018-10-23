package com.kh.dep.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository
public class MemberDaoImpl implements MemberDao {

	// 로그인 메소드
	@Override
	public MemberSelect selectLoginMember(SqlSessionTemplate sqlSession, MemberSelect m) {
			
			return sqlSession.selectOne("Member.selectLoginUser", m);
	
	}	

	//암호화 패스워드 조회
	@Override
	public String selectEncpassword(SqlSessionTemplate sqlSession, MemberSelect m) {
		
		
		return sqlSession.selectOne("Member.selectPwd", m.getEmpId());
	}

	// 부서 목록 조회
	@Override
	public ArrayList<MemberDepartment> selectdepList(SqlSessionTemplate sqlSession) {
		
	
		return (ArrayList)sqlSession.selectList("Member.selectDep");
	}

	@Override
	public int updateMyInfo(SqlSessionTemplate sqlSession, MemberSelect m){
		
		
		return sqlSession.update("Member.updateMyInfo", m);
	}

	// 직급 목록 조회
	public ArrayList<MemberJob> selectJobList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("Member.selectJob");
	}

	@Override
	public List<Department> selectMyDepRecordInfo(SqlSessionTemplate sqlSession, String empId) throws Exception {
		List<Department> list = sqlSession.selectList("Member.selectMyDepRecord", empId);
		/*System.out.println(list);*/
		return list;
	}

	// 사원 정보 입력
	public int insertMember(SqlSessionTemplate sqlSession, MemberSelect m) {
		
		return sqlSession.insert("Member.insertMember", m);
	}



	@Override
	public List<Job> selectMyJobRecord(SqlSessionTemplate sqlSession, int empNo) throws Exception {
		List<Job> list = sqlSession.selectList("Member.selectMyJobRecord", empNo);
		/*System.out.println(list);*/
		return list;
	}

	@Override
	public List<Position> selectMyJobPositionRecord(SqlSessionTemplate sqlSession, int empNo) throws Exception {
		List<Position> list = sqlSession.selectList("Member.selectMyJobPositionRecord", empNo);
		return list;
	}


	@Override
	public String selectEncpassword(SqlSessionTemplate sqlSession, String empId) {
		
		return sqlSession.selectOne("Member.selectPwd2", empId);
	}

	@Override
	public int insertMyVacation(SqlSessionTemplate sqlSession, Vacation myVac) {
		
		
		return sqlSession.insert("Member.insertMyVaction", myVac);
	}

	@Override
	public List<Vacation> selectMyVacationRecrod(SqlSessionTemplate sqlSession, int empNo) {
		List<Vacation> list = sqlSession.selectList("Member.selectMyVacationRecord", empNo);
		System.out.println("나의 휴가이력(dao) : " + list);
		return list;
	}

	@Override
	public List<WorkingHours> selectMyWorkingHoursRecord(SqlSessionTemplate sqlSession, int empNo) {
		System.out.println(empNo);
		List<WorkingHours> list = sqlSession.selectList("Member.selectMyWorkingHoursRecord", empNo);
		System.out.println("나의 출퇴근이력(dao) : " + list);
		return list;
	}

	// 사원정보 입력 시 사원 번호 조회
	@Override
	public int selectempNumber(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Member.selectempNumber");
	}

	// 직책 목록 조회
	@Override
	public ArrayList<Position> selectposiList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("Member.selectPosition");
	}

	// 부서이동 이력 입력
	@Override
	public int insertDepRecord(SqlSessionTemplate sqlSession, MemberSelect m) {
		
		
		return sqlSession.insert("Member.insertDepRecord", m);
	}

	// 직책변경 이력 입력
	@Override
	public int insertPositRecord(SqlSessionTemplate sqlSession, MemberSelect m) {
		
		
		return sqlSession.insert("Member.insertPositRecord", m);
	}

	// 직급변경 이력 입력
	@Override
	public int insertJobRecord(SqlSessionTemplate sqlSession, MemberSelect m) {
		
		return sqlSession.insert("Member.insertJobRecord", m);
	}



	@Override
	public int updateMyImage(SqlSessionTemplate sqlSession, int empNo, String newFileName, String originFileName) {
		ArrayList<Object> list = new ArrayList<Object>();
		list.add(empNo);
		list.add(newFileName);
		list.add(originFileName);
		
		return sqlSession.update("Member.updateMyImageFile", list);
	}

	@Override
	public List<SalaryExcel> xlsExcelReader(SqlSessionTemplate sqlSession, List<SalaryExcel> list) {
		System.out.println("급여 엑셀(xls) 업로드파일 다오 호출");
		int result = sqlSession.insert("Member.insertSalaryExcel", list); 
		System.out.println(result);
		List<SalaryExcel> result2 = new ArrayList<SalaryExcel>();
		
		if(result > 0){
			
			result2 = sqlSession.selectList("Member.selectSalaryList");
			
		}
		
		return result2;
	}

	@Override
	public List<SalaryExcel> xlsxExcelReader(SqlSessionTemplate sqlSession, List<SalaryExcel> list) {
		System.out.println("급여 엑셀(xlsx) 업로드파일 다오 호출");
		System.out.println("00"+list);
		
		int salaryCount=0;
		int delResult=0;
		int insertResult=0;

		salaryCount = sqlSession.selectOne("Member.selectSalaryCount");
		System.out.println("급여 테이블에 데이터가 있나욤? " + salaryCount);
		
		if(salaryCount > 0){	//SALARY 테이블에 값이 있을 경우
			delResult = sqlSession.delete("Member.deleteAllEmpSalaryData");
			System.out.println("급여 테이블 삭제완료 되면 ? : " + delResult);
			
			if(delResult > 0){	//SALARY 테이블의 값을 성공적으로 삭제 한 경우
				for(int i=0;i<list.size();i++){
					System.out.println(list.get(i));
					insertResult = sqlSession.insert("Member.insertSalaryExcel", list.get(i));
				}
			}
			else{	//SALARY 테이블의 값 삭제 에러
				System.out.println("delete error");
			}
		}
		else{	//SALARY 테이블에 값이 없을 경우
			for(int i=0;i<list.size();i++){
				System.out.println(list.get(i));
				insertResult = sqlSession.insert("Member.insertSalaryExcel", list.get(i));
			}
		}
		
		System.out.println("급여 테이블에 값이 성공적으로 들어가면 1 : " + insertResult);
		List<SalaryExcel> returnList = new ArrayList<SalaryExcel>();
		
		if(insertResult > 0){
			returnList = sqlSession.selectList("Member.selectSalaryList");
		}
		
		int totalSalary = 0;
		for(int i=0;i<list.size();i++){
			totalSalary = (returnList.get(i).getBasePay() + returnList.get(i).getRegularBonus() + returnList.get(i).getTaxFreeAlw()) 
		             - (returnList.get(i).getNationalPension() + returnList.get(i).getHealthIns() + returnList.get(i).getLongtermcareIns() + returnList.get(i).getEmployeeIns());
			returnList.get(i).setTotalSalary(totalSalary);
			/*for(int j=0;j<returnList.size();j++){
				
				if(list.get(i).getEmpName() == returnList.get(j).getEmpName()){
					returnList.get(j).setTotalSalary(list.get(i).getTotalSalary());
					break;
				}
			}*/
		}
		
		System.out.println(returnList);
		
		return returnList;
	}

	// 퇴사 승인 처리
	@Override
	public int insertLeaveMember(SqlSessionTemplate sqlSession, MemberSelect m) {
		
		return sqlSession.update("Member.updateLeaveMember", m);
	}

	// 부서 이동 처리
	@Override
	public int insertMoveDept(SqlSessionTemplate sqlSession, MemberSelect m) {
		
		return sqlSession.insert("Member.insertMoveDept", m);
	}

	//모든 사원 조회
	@Override
	public ArrayList<MemberSelect> selectAllMember(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("Member.selectAllMember");
	}

	@Override
	public List<SalaryExcel> selectSearchCondition(SqlSessionTemplate sqlSession, String depType, String jobType, String dateType, String nameType) {
		System.out.println("부서코드 : " + depType + " 직급코드 : " + jobType + " 년도 : " + dateType + " 사원이름 : " + nameType);
		List<SalaryExcel> list = new ArrayList<SalaryExcel>();
		
		/*if(depType.equals("D0")){
			
			list = sqlSession.selectList("Member.selectSearchCondition", jobType);
			
		}else if(jobType.equals("JOB_CODE")){
			
			list = sqlSession.selectList("Member.selectSearchCondition", depType);
		}else{
			ArrayList<Object> arr = new ArrayList<Object>();
			arr.add(depType);
			arr.add(jobType);
			
			list = sqlSession.selectList("Member.selectSearchCondition", arr);
		}*/
		
		
		ArrayList<Object> arr = new ArrayList<Object>();
		
		arr = new ArrayList<Object>();
		arr.add(depType);
		arr.add(jobType);
		arr.add(dateType);
		arr.add(nameType);
		
		list = sqlSession.selectList("Member.selectSearchCondition", arr);
		
		System.out.println("급여(부서/직급조건) : " + list);
		
		for(int i=0;i<list.size();i++){
			list.get(i).setTotalSalary((list.get(i).getBasePay() + list.get(i).getRegularBonus() + list.get(i).getTaxFreeAlw())-(list.get(i).getNationalPension()
					                      + list.get(i).getHealthIns() + list.get(i).getLongtermcareIns() + list.get(i).getEmployeeIns()));
		}
			
		return list;
	}

	@Override
	public List<Alarm> selectMyAlarmList(SqlSessionTemplate sqlSession, int empNo) {
		List<Alarm> alarmList = new ArrayList<Alarm>();
		
		alarmList = sqlSession.selectList("Member.selectMyAlarmList", empNo);
		
		System.out.println("나의 알람 목록(dao) : " + alarmList);
		
		return alarmList;
	}

	@Override
	public int selectMyAlarmCount(SqlSessionTemplate sqlSession, int empNo) {
		int alarmCount = sqlSession.selectOne("Member.selectMyAlarmCount", empNo);
		System.out.println("나의 알람 갯수 : " + alarmCount);
		
		return alarmCount;
	}

	@Override
	public int updateMyAlarm(SqlSessionTemplate sqlSession, int alarmNo) {
		int result = sqlSession.update("Member.updateMyAlarm", alarmNo);
		System.out.println("내 알람 삭제되었으면 1 : " + result);
		
		return result;
	}

	@Override
	public List<SalaryExcel> selectMySalaryRecord(SqlSessionTemplate sqlSession, int empNo) {
		List<SalaryExcel> list = new ArrayList<SalaryExcel>();
		list = sqlSession.selectList("Member.selectMySalaryRecord", empNo);
		
		System.out.println("내 급여이력 조회(dao) : " + list);
		
		int totalSalary = 0;
		for(int i=0;i<list.size();i++){
			
			totalSalary = (list.get(i).getBasePay() + list.get(i).getRegularBonus() + list.get(i).getTaxFreeAlw()) 
		             - (list.get(i).getNationalPension() + list.get(i).getHealthIns() + list.get(i).getLongtermcareIns() + list.get(i).getEmployeeIns());
			list.get(i).setTotalSalary(totalSalary);
			
		}
		
		return list;
	}

	@Override
	public int insertIdPwMember(SqlSessionTemplate sqlSession, MemberSelect m) {
		
		return sqlSession.update("Member.insertIdPwMember", m);
	}

	@Override
	public int selectCheckMember(SqlSessionTemplate sqlSession, MemberSelect m) {
		
		return sqlSession.selectOne("Member.selectCheckMember", m);
	}

	@Override
	public int selectCheckMoveDepMember(SqlSessionTemplate sqlSession, MemberSelect m) {
		
		
		return 0;
	}
	
	

}
