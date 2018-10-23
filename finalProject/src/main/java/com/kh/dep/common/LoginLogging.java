package com.kh.dep.common;

import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.kh.dep.member.model.vo.Member;

@Component
@Aspect
public class LoginLogging {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginLogging.class);
	
	@Pointcut("execution(* com.kh.tsp..*ServiceImpl.login*(..))")
	public void loginPointcut(){}
	
	@AfterReturning(pointcut="loginPointcut()", returning="returnObj")
	public void loginLog(JoinPoint jp, Object returnObj){
		System.out.println("login ReturnObject : " + returnObj);
		
		//정상적으로 로그인 성공시 콘솔에 info로그를 남긴다
		if(returnObj instanceof Member){
			Member m = (Member) returnObj;
			logger.info(new Date() + " : $" + m.getEmpId() + "$ 님이 접속했습니다.");
		}
	}
}
