package com.kh.dep.member.model.service;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.dep.member.exception.InsertRecordException;
import com.kh.dep.member.exception.LoginException;
import com.kh.dep.member.model.dao.MemberDao;
import com.kh.dep.member.model.vo.Alarm;
import com.kh.dep.member.model.vo.Department;
import com.kh.dep.member.model.vo.Job;
import com.kh.dep.member.model.vo.MemberDepartment;
import com.kh.dep.member.model.vo.MemberJob;
import com.kh.dep.member.model.vo.MemberSelect;
import com.kh.dep.member.model.vo.Position;
import com.kh.dep.member.model.vo.SalaryExcel;
import com.kh.dep.member.model.vo.Vacation;
import com.kh.dep.member.model.vo.WorkingHours;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MemberDao md;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	// 로그인 메소드
	@Override
	public MemberSelect selectLoginMember(MemberSelect m) throws LoginException {


		MemberSelect loginUser = null;

		String encPassword = md.selectEncpassword(sqlSession, m);


		if(!passwordEncoder.matches(m.getEmpPwd(), encPassword)){
			throw new LoginException("로그인 실패");
		}else{
			loginUser = md.selectLoginMember(sqlSession, m);
		}


		return loginUser;
	}

	@Override
	public int updateMyInfo(MemberSelect m){

		return md.updateMyInfo(sqlSession, m);
	}

	// 부서목록 조회
	public ArrayList<MemberDepartment> selectDepList() {

		ArrayList<MemberDepartment> deplist = md.selectdepList(sqlSession);


		return deplist;
	}

	// 직급 목록 조회
	@Override
	public ArrayList<MemberJob> selectJobList() {

		ArrayList<MemberJob> joblist = md.selectJobList(sqlSession);

		return joblist;
	}

	@Override
	public List<Department> selectMyDepRecordInfo(String empId) throws Exception {
		return md.selectMyDepRecordInfo(sqlSession, empId);
	}

	@Override
	public List<Job> selectMyJobRecord(int empNo) throws Exception {
		return md.selectMyJobRecord(sqlSession, empNo);
	}

	@Override
	public List<Position> selectMyJobPositionRecord(int empNo) throws Exception {

		return md.selectMyJobPositionRecord(sqlSession, empNo);
	}

	@Override
	public MemberSelect selectUpdateMember(MemberSelect m) throws Exception {
		MemberSelect loginUser = null;

		loginUser = md.selectLoginMember(sqlSession, m);

		return loginUser;
	}

	@Override
	public boolean checkPw(String empId, String empPwd) {
		boolean result = false;

		/*암호화된 비밀번호*/
		String encPwd = md.selectEncpassword(sqlSession, empId);

		if(!passwordEncoder.matches(empPwd, encPwd)){
			System.out.println("비밀번호 불일치!!");
		}else{
			result = true;

		}
		return result;
	}

	// 사원 정보 입력
	public int insertMember(MemberSelect m) {

		int result = md.insertMember(sqlSession, m);

		return result;
	}

	// 사원정보 입력 시 사원번호 조회
	@Override
	public int selectempNumber() {



		return md.selectempNumber(sqlSession);
	}

	// 직책 목록 조회
	@Override
	public ArrayList<Position> selectpositList() {

		ArrayList<Position> polist = null;

		polist = md.selectposiList(sqlSession);

		return polist;
	}

	@Override
	public int insertMyVacation(Vacation myVac) {
		int result = md.insertMyVacation(sqlSession, myVac);

		return result;
	}

	@Override
	public List<Vacation> selectMyVacationRecord(int empNo) {


		return md.selectMyVacationRecrod(sqlSession, empNo);
	}

	@Override
	public List<WorkingHours> selectMyWorkingHoursRecord(int empNo) {


		return md.selectMyWorkingHoursRecord(sqlSession, empNo);
	}

	@Override
	public int insertRecord(MemberSelect m) throws InsertRecordException {

		int result = 0;

		int depRc = md.insertDepRecord(sqlSession, m);

		int positRc = md.insertPositRecord(sqlSession, m);

		int jobRc = md.insertJobRecord(sqlSession, m);

		if(depRc == 0){
			throw new InsertRecordException("부서이력 입력 실패");
		}else if(positRc == 0){
			throw new InsertRecordException("직책이력 입력 실패");
		}else if(jobRc == 0){
			throw new InsertRecordException("직책이력 입력 실패");
		}else{
			result++;
		}

		return result;

	}

	public int updateMyImage(int empNo, String newFileName, String originFileName) {


		return md.updateMyImage(sqlSession, empNo, newFileName, originFileName);

	}

	/*@SuppressWarnings("deprecation")*/
	@Override
	public List<SalaryExcel> xlsxExcelReader(MultipartHttpServletRequest req) {
		System.out.println("급여 엑셀 업로드파일 서비스 호출");
		List<SalaryExcel> list = new ArrayList<SalaryExcel>();

		MultipartFile file = req.getFile("excelFile");
		XSSFWorkbook workbook = null;

		try {
			workbook = new XSSFWorkbook(file.getInputStream());

			XSSFSheet curSheet;
			XSSFRow curRow;
			XSSFCell curCell;
			SalaryExcel vo;

			// Sheet 탐색 for문
			for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
				// 현재 sheet 반환
				curSheet = workbook.getSheetAt(sheetIndex);
				// row 탐색 for문
				for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
					// row 0은 헤더정보이기 때문에 무시
					if (rowIndex != 0) {
						curRow = curSheet.getRow(rowIndex);
						vo = new SalaryExcel();
						String value;

						// row의 첫번째 cell값이 비어있지 않는 경우만 cell탐색
						if (curRow.getCell(0) != null) {
							if (!"".equals(curRow.getCell(0).getStringCellValue())) {
								// cell 탐색 for문
								for (int cellIndex = 0; cellIndex < curRow.getPhysicalNumberOfCells(); cellIndex++) {
									curCell = curRow.getCell(cellIndex);
									
									if (true) {
										value = "";
										// cell 스타일이 다르더라도 String으로 반환 받음
										switch (curCell.getCellTypeEnum()) {
										case FORMULA:
											value = curCell.getCellFormula();
											break;
											case NUMERIC:
												if(DateUtil.isCellDateFormatted(curCell)) {
													SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
													value = sdf.format(curCell.getDateCellValue());
												} else {
													value = String.valueOf(curCell.getNumericCellValue());
												}
												break;
											case STRING:
											value = curCell.getStringCellValue() + "";
											break;
											case BLANK:
											value = curCell.getBooleanCellValue() + "";
											break;
											case ERROR:
											value = curCell.getErrorCellValue() + "";
											break;
											default:
											value = new String();
											break;
										}
										switch (cellIndex) {
										case 0: vo.setDepName(value);
										break;
										case 1: vo.setJobName(value);
										break;
										case 2: vo.setEmpName(value);
										break;
										case 3: vo.setIncomeDate(value);
										break;
										case 4: 
											int value1 = (int)Double.parseDouble(value);
											vo.setBasePay(value1);
										break;
										case 5: 
											int value2 = (int) Double.parseDouble(value);
											vo.setRegularBonus(value2);
										break;
										case 6:
											int value3 = (int) Double.parseDouble(value);
											vo.setTaxFreeAlw(value3);
											break;
										case 7:
											int value4 = (int) (vo.getBasePay() * 0.045);
											vo.setNationalPension(value4);
											/*int value4 = (int) Double.parseDouble(value);
											vo.setNationalPension(value4);*/
											break;
										case 8:
											int value5 = (int) (vo.getBasePay() * 0.0312);
											vo.setHealthIns(value5);
											/*int value5 = (int) Double.parseDouble(value);
											vo.setHealthIns(value5);*/
											break;
										case 9:
											int value6 = (int) (vo.getBasePay() * 0.0023025);
											vo.setLongtermcareIns(value6);
											/*int value6 = (int) Double.parseDouble(value);
											vo.setLongtermcareIns(value6);*/
											break;
										case 10:
											int value7 = (int) (vo.getBasePay() * 0.0065);
											vo.setEmployeeIns(value7);
											/*int value7 = (int) Double.parseDouble(value);
											vo.setEmployeeIns(value7);*/
											break;
										/*case 11:
											int value8 = (vo.getBasePay() + vo.getRegularBonus() + vo.getTaxFreeAlw()) 
											             - (vo.getNationalPension() + vo.getHealthIns() + vo.getLongtermcareIns() + vo.getEmployeeIns());
											vo.setTotalSalary(value8);
											break;*/
										default:
										break;
										}
									}
								}
								list.add(vo);
							}
						}
					}
					
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return md.xlsxExcelReader(sqlSession, list);

	}

	@Override
	public List<SalaryExcel> xlsExcelReader(MultipartHttpServletRequest req) {
		System.out.println("급여 엑셀 업로드파일 서비스 호출");

		List<SalaryExcel> list = new ArrayList<SalaryExcel>();

		MultipartFile file = req.getFile("excelFile");
		HSSFWorkbook workbook = null;

		try {
			workbook = new HSSFWorkbook(file.getInputStream());

			HSSFSheet curSheet;
			HSSFRow curRow;
			HSSFCell curCell;
			SalaryExcel vo;

			for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
				// 현재 sheet 반환
				curSheet = workbook.getSheetAt(sheetIndex);
				// row 탐색 for문
				for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
					// row 0은 헤더정보이기 때문에 무시
					if (rowIndex != 0) {
						curRow = curSheet.getRow(rowIndex);
						vo = new SalaryExcel();
						String value;

						// row의 첫번째 cell값이 비어있지 않는 경우만 cell탐색
						if (curRow.getCell(0) != null) {
							if (!"".equals(curRow.getCell(0).getStringCellValue())) {
								for (int cellIndex = 0; cellIndex < curRow.getPhysicalNumberOfCells(); cellIndex++) {
									curCell = curRow.getCell(cellIndex);

									if (true) {
										value = "";
										String cellString = "";
										// cell 스타일이 다르더라도 String으로 반환 받음
										switch (curCell.getCellTypeEnum()) {
										case FORMULA:
											value = curCell.getCellFormula();
											break;
										case NUMERIC:
											if(DateUtil.isCellDateFormatted(curCell)) {
												SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
												value = sdf.format(curCell.getDateCellValue());
											} else {
												value = String.valueOf(curCell.getNumericCellValue());
											}
											break;
										case STRING:
											value = curCell.getStringCellValue() + "";
											break;
										case BLANK:
											value = curCell.getBooleanCellValue() + "";
											break;
										case ERROR:
											value = curCell.getErrorCellValue() + "";
											break;
										default:
											value = new String();
											break;
										}

										switch(cellIndex) {
										case 0: vo.setDepName(value);
										break;
										case 1: vo.setJobName(value);
										break;
										case 2: vo.setEmpName(value);
										break;
										case 3: vo.setIncomeDate(value);
										break;
										case 4: 
											int value1 = (int)Double.parseDouble(value);
											vo.setBasePay(value1);
											break;
										case 5: 
											int value2 = (int) Double.parseDouble(value);
											vo.setRegularBonus(value2);
											break;
										case 6:
											int value3 = (int) Double.parseDouble(value);
											vo.setTaxFreeAlw(value3);
											break;
										case 7:
											int value4 = (int) (vo.getBasePay() * 0.045);
											vo.setNationalPension(value4);
											/*int value4 = (int) Double.parseDouble(value);
											vo.setNationalPension(value4);*/
											break;
										case 8:
											int value5 = (int) (vo.getBasePay() * 0.0312);
											vo.setHealthIns(value5);
											/*int value5 = (int) Double.parseDouble(value);
											vo.setHealthIns(value5);*/
											break;
										case 9:
											int value6 = (int) (vo.getBasePay() * 0.0023025);
											vo.setLongtermcareIns(value6);
											/*int value6 = (int) Double.parseDouble(value);
											vo.setLongtermcareIns(value6);*/
											break;
										case 10:
											int value7 = (int) (vo.getBasePay() * 0.0065);
											vo.setEmployeeIns(value7);
											/*int value7 = (int) Double.parseDouble(value);
											vo.setEmployeeIns(value7);*/
											break;
										/*case 11:
											int value8 = (vo.getBasePay() + vo.getRegularBonus() + vo.getTaxFreeAlw()) 
											             - (vo.getNationalPension() + vo.getHealthIns() + vo.getLongtermcareIns() + vo.getEmployeeIns());
											vo.setTotalSalary(value8);
											break;*/
										default:
										break;
										}
									}
								}
								// cell 탐색 이후 vo 추가
								list.add(vo);
							}
						}
					}

				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("00"+list);
		return md.xlsExcelReader(sqlSession, list);
	}

	// 퇴사자승인처리
	@Override
	public int insertLeaveMember(MemberSelect m) throws InsertRecordException {
		
		int result = md.insertLeaveMember(sqlSession, m);
		
		if(result > 0){
			return result;
		}else{
			throw new InsertRecordException("퇴사승인 실패");
		}
		
		
		
	}

	// 부서이동 승인 처리
	@Override
	public int insertMoveDept(MemberSelect m) throws InsertRecordException {
		
		int result = md.insertMoveDept(sqlSession, m);
		
		if(result > 0){
			return result;
		}else{
			throw new InsertRecordException("부서이동 승인 실패");
		}
		
		
	
	}

	//모든 사원 조회
	@Override
	public ArrayList<MemberSelect> selectAllMember() {
		
		ArrayList<MemberSelect> mlist = null;
		
		mlist = md.selectAllMember(sqlSession);
		
		return mlist;
	}

	@Override
	public List<SalaryExcel> selectSearchCondition(String depType, String jobType, String dateType, String nameType) {
		
		return md.selectSearchCondition(sqlSession, depType, jobType, dateType, nameType);
	}

	@Override
	public List<Alarm> selectMyAlarmList(int empNo) {
		
		return md.selectMyAlarmList(sqlSession, empNo);
	}

	@Override
	public int selectMyAlarmCount(int empNo) {
		
		return md.selectMyAlarmCount(sqlSession, empNo);
	}

	@Override
	public int updateMyAlarm(int alarmNo) {
		
		
		return md.updateMyAlarm(sqlSession, alarmNo);
	}

	@Override
	public List<SalaryExcel> selectMySalaryRecord(int empNo) {
		
		return md.selectMySalaryRecord(sqlSession, empNo);
	}

	@Override
	public int insertIdPwMember(int empNo) {
		
		MemberSelect m = new MemberSelect();
		
		m.setEmpPwd(passwordEncoder.encode(Integer.toString(empNo)));
		m.setEmpNo(empNo);
		
		int result = md.insertIdPwMember(sqlSession, m);
		
		return result;
	}

	@Override
	public int selectCheckMember(MemberSelect m) {
		
		int result = 0;
		
		if(m.getDepId() != ""){
			result = md.selectCheckMember(sqlSession, m);
		}else{
			result = md.selectCheckMoveDepMember(sqlSession, m);
		}
			
		return result;
	}

}
