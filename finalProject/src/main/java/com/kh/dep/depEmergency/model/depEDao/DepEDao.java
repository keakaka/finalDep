package com.kh.dep.depEmergency.model.depEDao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dep.depEmergency.model.exception.DepESelectListException;


public interface DepEDao {

	ArrayList selectDepeList(SqlSessionTemplate sqlSession,String empNo) throws DepESelectListException;



	
}
