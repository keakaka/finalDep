package com.kh.dep.calendar.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.dep.addressBook.model.vo.AddressBook;
import com.kh.dep.calendar.model.service.CalendarService;
import com.kh.dep.calendar.model.vo.Calendar;
import com.kh.dep.calendar.model.vo.DayWeek;
import com.kh.dep.member.model.service.MemberService;
import com.kh.dep.member.model.vo.Member;
import com.kh.dep.member.model.vo.MemberDepartment;
import com.kh.dep.member.model.vo.MemberSelect;
  
@Controller
@SessionAttributes("loginUser")
public class CalendarController {
	
	@Autowired
	private CalendarService cs;
	@Autowired
	private MemberService mservice;
	
	@RequestMapping(value="calendarMy.ca")
	public String showCalendarView(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		/*MemberSelect ms = (MemberSelect)request.getSession().getAttribute("loginUser");
		int empNo = ms.getEmpNo();
		
		List<Calendar> list = cs.selectCalendar(empNo);
		System.out.println("CalendarController list : " + list);
		
		model.addAttribute("list", list);
		
		*/
		ArrayList<MemberDepartment> depList = mservice.selectDepList();
		model.addAttribute("depList", depList);
		
		return "calendar/calendar";
	}
	
	@RequestMapping(value="calendarDep.ca")
	public String showCalendarView2(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		/*MemberSelect ms = (MemberSelect)request.getSession().getAttribute("loginUser");
		int empNo = ms.getEmpNo();
		
		List<Calendar> list = cs.selectCalendar(empNo);
		System.out.println("CalendarController list : " + list);
		
		model.addAttribute("list", list);
		
		*/
		ArrayList<MemberDepartment> depList = mservice.selectDepList();
		model.addAttribute("depList", depList);
		
		return "calendar/calendarDep";
	}
	
	@RequestMapping(value = "calendarList.ca", method=RequestMethod.POST)
	@ResponseBody 
	public Object calendarList(@RequestParam String title, String depNo, Map<String, Object> map,
								HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CalendarController calendarList에 왔음");
		
		System.out.println("calendarList.ca title : " + title);
		System.out.println("calendarList.ca depNo : " + depNo);
		
		MemberSelect ms = (MemberSelect)request.getSession().getAttribute("loginUser");
		int empNo = ms.getEmpNo();
		
		Calendar c = new Calendar();
		c.setEmpNo(empNo);
		c.setScheType(depNo);
		
		List<Calendar> list = cs.selectCalendar(c);
		System.out.println("CalendarController2222 list : " + list);
		
	    
	      for(int i=0; i<list.size(); i++){
	         String str = ((Calendar) list.get(i)).getScheStartDate();
	         /*System.out.println(str.substring(8, 10));*/
	         ((Calendar) list.get(i)).setDayNum(str.substring(5, 10));
	         
	         String day;
			
	         
			 day = DayWeek.getDateDay(((Calendar) list.get(i)).getScheStartDate().substring(0, 11), "yyyy-MM-dd");
				((Calendar) list.get(i)).setDayWeek(day);
			
			
	         
	    }
		
	     for(int i=0; i<list.size(); i++) {
	    	 System.out.println(i + " : " + list.get(i).toString());
	     }
	      
		Map<String, Object> ret = new HashMap<String, Object>();
	    
	    ret.put("cList", list);
	    
	    return ret;
	}
	
	@RequestMapping("insertAttendance.ca")
	public String insertAttenance() {
		return "calendar/insertAttendance";
	}
	
	
	@RequestMapping(value = "searchAttName.ca", produces = "application/text; charset=utf-8")
	public void searchAttName(@RequestParam String attName, HttpServletResponse response) {
		System.out.println("searchAttName name : " + attName);
		
		List<AddressBook> list = cs.selectAttList();
		System.out.println("calendar controller list : " + list);
		
		List<Member> list2 = cs.searchAttName(attName);
		System.out.println("searchAttName list : " + list2);
		
		try {
			response.getWriter().print(list2);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		/*try {
			PrintWriter out = response.getWriter();
			
	        JSONObject json = new JSONObject();
	        json.put("data", list2);
	        
		} catch (IOException e) {
			e.printStackTrace();
		}*/
	}
	
	@RequestMapping("insertCalendar.ca")
	public @ResponseBody HashMap<String, Object> insertCalendar(String title, String content, String sDate, String eDate, String depNo, HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("insertCalendar title : " + title);
		System.out.println("insertCalendar content : " + content);
		System.out.println("insertCalendar depNo : " + depNo);
		
		MemberSelect ms = (MemberSelect)request.getSession().getAttribute("loginUser");
		int loginNo = ms.getEmpNo();
		System.out.println("Calendar loginNo : " + loginNo);
		
		Calendar c = new Calendar();
		c.setScheType(depNo);
		c.setEmpNo(loginNo);
		c.setScheduleTitle(title);
		c.setScheduleContent(content);
		c.setScheStartDate(sDate);
		c.setScheEndDate(eDate);
		
		System.out.println("CalendarController Insert c : " + c);
		
		
		Calendar ca2 = cs.insertCalendar(c);
		System.out.println("insert ca2 : " + ca2);
		
		int next = cs.selectCurval();
		String empName2 = cs.selectEmpName(next);
		int empNo2 = cs.selectEmpNo(next);
		System.out.println("CalendarController insert next : " + next);
		System.out.println("CalendarController insert empName2 : " + empName2);
		System.out.println("CalendarController insert empNo2 : " + empNo2);
		
		MemberSelect ms2 = (MemberSelect)request.getSession().getAttribute("loginUser");
		int empNo = ms2.getEmpNo();
		
		Calendar c22 = new Calendar();
		c22.setEmpNo(empNo);
		c22.setScheType(depNo);
		List<Calendar> list = cs.selectCalendar(c22);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		/*model.addAttribute("list2", list);
		model.addAttribute("next", next);*/
		hmap.put("next", next);
		hmap.put("empNo2", empNo2);
		hmap.put("empName2", empName2);
		
		return hmap;
	
	}
	
	@RequestMapping(value="deleteCalendar.ca")
	public void deleteCalendar(int id, HttpServletRequest request, HttpServletResponse response) {
		MemberSelect ms2 = (MemberSelect)request.getSession().getAttribute("loginUser");
		int empNo = ms2.getEmpNo();
		
		Calendar c = new Calendar();
		c.setEmpNo(empNo);
		c.setScheduleNo(id);
		
		
		int deleteC = cs.deleteCalendar(c);
	
	}
	
	@RequestMapping("updateModalCalendar.ca")
	public @ResponseBody HashMap<String, Object> updateModalCalendar(int id, HttpServletRequest request, HttpServletResponse response) {
		MemberSelect ms2 = (MemberSelect)request.getSession().getAttribute("loginUser");
		int empNo = ms2.getEmpNo();
		
		Calendar c = new Calendar();
		c.setEmpNo(empNo);
		c.setScheduleNo(id);
		
		Calendar c2 = cs.updateModelCalendar(c);
		System.out.println("updateModalCalendar c2 : " + c2);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("c2", c2);
		
		return hmap;
		
	}
	
	@RequestMapping("updateCalendar")
	public void updateCalendar(int updateId, String title, String content, HttpServletRequest request, HttpServletResponse response) {
		
		
		Calendar c = new Calendar();
		c.setScheduleNo(updateId);
		c.setScheduleTitle(title);
		c.setScheduleContent(content);
		System.out.println("updateCalendar c : " + c);
		
		int c2 = cs.updateCalendar(c);
		System.out.println("updateCalendar c2 : " + c2);
		
	}
	
	
	
	
}
