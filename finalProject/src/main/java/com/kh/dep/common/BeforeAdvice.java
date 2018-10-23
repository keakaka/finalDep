package com.kh.dep.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect			//AOP가 적용되는 advice 객체의 경우 필요한 어노테이션
public class BeforeAdvice {
	@Pointcut("execution(* com.kh.tsp..*ServiceImpl.*(..))")
	public void allPointcut(){
		
	}
	
	@Before("allPointcut()")
	public void beforeLog(JoinPoint jp){
		//메소드가 실행되기 전 공통으로 처ㅣ할 작업을 위해 사용한다.
		//호출되는 대상 객체, 메서드, 전달 파라미터 목록에 접근할 수 있는 메소드를 제공해준다.
		String methodName = jp.getSignature().getName();
		Object[] args = jp.getArgs();
		
		 
		System.out.println("메소드 호출 전 확인 : + " + methodName + "() 메소드 매개변수 갯수 : " + args.length);
		System.out.println("0번째 매개변수 정보 : " + args[0]);
		
		
		
		
		
				
	}
}
