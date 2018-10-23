package com.kh.dep.depEmergency.model.depEService;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dep.depEmergency.model.depEDao.DepEDao;
import com.kh.dep.depEmergency.model.exception.DepESelectListException;
import com.kh.dep.depEmergency.model.vo.DepE;

@Service
public class DepEServiceImpl implements DepEService {

	@Autowired
	private DepEDao dd;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<DepE> selectDepList(String empNo) throws DepESelectListException {
		// TODO Auto-generated method stub
		System.out.println("비상연락망 서비스 입장 : " + empNo);
		ArrayList  DepEList = dd.selectDepeList(sqlSession , empNo);
		
		return  DepEList;
	}
	
}
