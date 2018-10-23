package com.kh.dep.addressBook.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dep.addressBook.model.dao.AddressBookDao;
import com.kh.dep.addressBook.model.vo.AddressBook;
import com.kh.dep.member.model.vo.Member;

@Service
public class AddressBookServiceImpl implements AddressBookService{
	
	@Autowired
	private AddressBookDao abd;

	//주소록 회원 검색
	@Override
	public List<Member> searchAdd(String name) {
		System.out.println(name + "주소록 서비스impl");
		return abd.searchAdd(name);
	}

	@Override
	public AddressBook insertAdd(AddressBook ab) {
		AddressBook abab = new AddressBook();
		abab.setEmpNo(ab.getEmpNo());
		
		AddressBook ab3 = abd.selectAdd(abab);
		ab3.setLoginNo(ab.getLoginNo());
		
		System.out.println("insertAdd ab3 : " + ab3);
		int result = abd.insertAdd(ab3);
		
		return ab3;
	}

	@Override
	public List<AddressBook> selectAddList() {
		return abd.selectAddList();
	}

	@Override
	public AddressBook deleteAddressBook(AddressBook ab) {
		AddressBook ab2 = new AddressBook();
		ab2.setEmpNo(ab.getEmpNo());
		AddressBook ab3 = abd.selectAdd2(ab);
		int result = abd.deleteAdd(ab3);
		
		return ab3;
	}

	@Override
	public List<AddressBook> selectAddList2(AddressBook ab) {
		return abd.selectAddList2(ab);
	}

	


}
