package com.kh.dep.main;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dep.member.model.vo.MemberSelect;

@Controller
public class MainController {
	
	@RequestMapping(value="mainPage.mn")
	public String mainPage(@RequestParam(name="m") String m, Model model, HttpServletRequest request){
		int empNo = Integer.parseInt(m);
		MemberSelect member = (MemberSelect) request.getSession().getAttribute("loginUser");
		
		System.out.println(member);
		
		
		
		return "main/main";
	}
	
}
