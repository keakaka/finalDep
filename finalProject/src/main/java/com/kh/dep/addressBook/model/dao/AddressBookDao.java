package com.kh.dep.addressBook.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dep.addressBook.model.vo.AddressBook;
import com.kh.dep.member.model.vo.Member;

public interface AddressBookDao {

	List<Member> searchAdd(String name);

	AddressBook selectAdd(AddressBook ab);

	int insertAdd(AddressBook ab);

	List<AddressBook> selectAddList();

	int deleteAdd(AddressBook ab);

	AddressBook selectAdd2(AddressBook ab);

	List<AddressBook> selectAddList2(AddressBook ab);


}
