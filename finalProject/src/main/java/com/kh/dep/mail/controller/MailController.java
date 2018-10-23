package com.kh.dep.mail.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {
	@RequestMapping(value="myMail.ma")
	public String loginCheck(HttpServletRequest request, HttpServletResponse response){
		
		return "jh/mail";
	}
	
	@RequestMapping(value="sentMail.ma")
	public String sentMail(){
		return "jh/sentMail";
	}
	
	@RequestMapping(value="mailBin.ma")
	public String mailBin(){
		return "jh/mailBin";
	}
	
	@RequestMapping(value="writingMail.ma")
	public String writingMail(){
		return "jh/writingMail";
	}
}
