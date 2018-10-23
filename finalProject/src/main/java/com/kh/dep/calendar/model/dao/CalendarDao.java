package com.kh.dep.calendar.model.dao;

import java.util.List;

import com.kh.dep.addressBook.model.vo.AddressBook;
import com.kh.dep.calendar.model.vo.Calendar;
import com.kh.dep.member.model.vo.Member;
  
public interface CalendarDao {
	
	List<AddressBook> selectAttList();

	List<Member> searchAttName(String attName);
	

	int insertCalendar(Calendar c);

	List<Calendar> selectCalendar(Calendar c);

	int selectCurval();

	int deleteCalendar(Calendar c);

	Calendar updateModalCalendar(Calendar c);

	int updateCalendar(Calendar c);

	int selectEmpNo(int next);

	String selectEmpName(int next);


}
