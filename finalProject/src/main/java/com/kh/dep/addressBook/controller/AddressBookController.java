package com.kh.dep.addressBook.controller;

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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.dep.addressBook.model.service.AddressBookService;
import com.kh.dep.addressBook.model.vo.AddressBook;
import com.kh.dep.member.model.vo.Member;
import com.kh.dep.member.model.vo.MemberSelect;

@Controller
public class AddressBookController {
	
	@Autowired
	private AddressBookService abs;
	
	@RequestMapping("addressBook.ad")
	public String showAddressBookView(Model model){
		
		List<AddressBook> list = abs.selectAddList();
		System.out.println("selectAdd list : " + list);
		
		model.addAttribute("list", list);
		
		return "addressBook/addressBook";
	}
	
	//주소록 회원 검색
	@RequestMapping("searchAddressBookName.ad")
	@ResponseBody 
	public Object searchAddressBook(String searchN, HttpServletRequest request, Map<String, Object> map){
		System.out.println("주소록 controller");
		
		List<AddressBook> list = abs.selectAddList();
		System.out.println("selectAdd list : " + list);
		
		List<Member> list2 = abs.searchAdd(searchN);
		System.out.println("list2 : " + list2);
		
		Map<String, Object> ret = new HashMap<String, Object>();
	    
		ret.put("list", list);
	    ret.put("addressBookList", list2);
		
		return ret;
		
	}
	
	//주소록 테이블에 추가
	@RequestMapping("insertAddressBook.ad")
	@ResponseBody 
	public Object insertAddressBook(int empNo, int loginNo, HttpServletResponse response, Map<String, Object> map) {
		System.out.println("loginNo : " + loginNo);
		ObjectMapper mapper = new ObjectMapper();
		
		
		AddressBook ab = new AddressBook();
		ab.setEmpNo(empNo);
		ab.setLoginNo(loginNo);
		
		AddressBook ab2 = abs.insertAdd(ab);
		System.out.println("ab2 : " + ab2);
		
		Map<String, Object> ret = new HashMap<String, Object>();
	    
	    ret.put("ab2", ab2);
	    
	    return ret;
	}
	
	//주소록 테이블에 출력
	@RequestMapping("selectAdd.ad")
	public String selectAddressBook(HttpServletRequest request, Model model) {
		System.out.println("selectAddressBook controller");
		
		List<AddressBook> list = abs.selectAddList();
		System.out.println("selectAdd list : " + list);
		
		model.addAttribute("list", list);
		
		return "addressBook/addressBook";
	}
	
	//주소록에서 삭제
	@RequestMapping("deleteAddressBook.ad")
	@ResponseBody
	public Object deleteAddressBook(int empNo, int loginNo, HttpServletRequest request, Map<String, Object> map) {
		
		System.out.println("deleteAddressBook empNo : " + empNo);
		System.out.println("deleteAddressBook loginNo : " + loginNo);
		AddressBook ab = new AddressBook();
		ab.setEmpNo(empNo);
		ab.setLoginNo(loginNo);
		
		AddressBook ab2 = abs.deleteAddressBook(ab);
		System.out.println("AddressBookController delete ab2 : " + ab2);
		
		List<AddressBook> list22 = abs.selectAddList2(ab);
		System.out.println("selectAdd list : " + list22);
		
		Map<String, Object> ret = new HashMap<String, Object>();
	    
		ret.put("list22", list22);
	    ret.put("ab2", ab2);
	    
	    return ret;
		
	}
	
	@RequestMapping(value = "facing.ad",method=RequestMethod.POST)
	public void facing(@RequestParam int loginUser, @RequestParam int empNo, Model model, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("facing.ad로 넘어옴");
		System.out.println("facing.ad empNo : " + empNo);
		System.out.println("facing.ad loginUser : " + loginUser);

		AddressBook ab = new AddressBook();
		ab.setEmpNo(empNo);
		ab.setLoginNo(loginUser);
	    
	    model.addAttribute("ab", ab);
	    
	}
	
	
	
}







