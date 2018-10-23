package com.kh.dep.main;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dep.board.exception.BoardException;
import com.kh.dep.board.model.service.BoardService;
import com.kh.dep.board.model.vo.Board;
import com.kh.dep.calendar.model.service.CalendarService;
import com.kh.dep.calendar.model.vo.Calendar;
import com.kh.dep.member.model.vo.MemberSelect;
import com.kh.dep.sign.model.exception.SelectDocException;
import com.kh.dep.sign.model.service.SignService;
import com.kh.dep.sign.model.vo.Document;

@Controller
public class MainController {
	
	@Autowired 
	private BoardService bs;
	@Autowired
	private CalendarService cs;
	@Autowired
	private SignService ss;
	
	@RequestMapping(value="mainPage.mn")
	public String mainPage(@RequestParam(name="m") String m, Model model, HttpServletRequest request){
		MemberSelect member = (MemberSelect) request.getSession().getAttribute("loginUser");
		
		try {
			ArrayList<Board> boardList = bs.selectBoardList(member.getDepName());
			Calendar c = new Calendar();
			c.setEmpNo(member.getEmpNo());
			c.setScheType("null");
			ArrayList<Calendar> myCalendar = (ArrayList<Calendar>) cs.selectCalendar(c);
			Calendar c2 = new Calendar();
			c2.setEmpNo(member.getEmpNo());
			c2.setScheType(member.getDepId());
			ArrayList<Calendar> depCalendar = (ArrayList<Calendar>) cs.selectCalendar(c2);
			
			ArrayList<Document> signAppList = ss.selectApprovalList(member.getEmpNo());
			ArrayList<Document> signRecList = ss.selectReceiveList(member.getEmpNo());
			int appSize = signAppList.size();
			int recSize = signRecList.size();
			ArrayList signCount = new ArrayList();
			signCount.add(appSize);
			signCount.add(recSize);
			model.addAttribute("boardList", boardList);
			model.addAttribute("myCalendar", myCalendar);
			model.addAttribute("depCalendar", depCalendar);
			model.addAttribute("signCount", signCount);
			
		} catch (BoardException e) {
			
		} catch (SelectDocException e) {
			
		}
		
		
		System.out.println(member);
		
		
		
		return "main/main";
	}
	
}
