package com.kh.dep.calendar.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dep.addressBook.model.vo.AddressBook;
import com.kh.dep.calendar.model.vo.Calendar;
import com.kh.dep.member.model.vo.Member;
  
@Repository
public class CalendarDaoImpl implements CalendarDao{
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<AddressBook> selectAttList() {
		return sqlSession.selectList("Calendar.selectAttList");
	}
	
	@Override
	public List<Member> searchAttName(String attName) {
		List<Member> list = sqlSession.selectList("Calendar.searchAttendance",attName);
		
		return list;
	}
	
	@Override
	public int insertCalendar(Calendar c) {
		System.out.println("CalendarDaoImpl c : " + c);
		return sqlSession.insert("Calendar.insertCalendar", c);
	}

	@Override
	public List<Calendar> selectCalendar(Calendar c) {
		System.out.println("CalendarDaoImpl selectCalendar c : " + c);
		if(c.getScheType().equals("null")) {
			return sqlSession.selectList("Calendar.selectCalendar", c);
		}
		else {
			return sqlSession.selectList("Calendar.selectCalendar2", c);
			
		}
		
	}

	@Override
	public int selectCurval() {
		return sqlSession.selectOne("Calendar.selectCurval");
	}

	@Override
	public int deleteCalendar(Calendar c) {
		return sqlSession.delete("Calendar.deleteCalendar", c);
	}

	@Override
	public Calendar updateModalCalendar(Calendar c) {
		return sqlSession.selectOne("Calendar.updateModalCalendar", c);
	}

	@Override
	public int updateCalendar(Calendar c) {
		System.out.println("updateCalendar DaoImpl c : " + c);
		return sqlSession.update("Calendar.updateCalendar", c);
	}

	@Override
	public int selectEmpNo(int next) {
		return sqlSession.selectOne("Calendar.selectEmpNo", next);
	}

	@Override
	public String selectEmpName(int next) {
		return sqlSession.selectOne("Calendar.selectEmpName", next);
	}

	

}
