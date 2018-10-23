package com.kh.dep.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testController {
	
	@RequestMapping(value ="test.te")
	public void testtest(){
		System.out.println("오니");
	}
}
