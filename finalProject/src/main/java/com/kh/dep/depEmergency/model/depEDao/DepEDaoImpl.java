package com.kh.dep.depEmergency.model.depEDao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dep.depEmergency.model.exception.DepESelectListException;
import com.kh.dep.facing.model.exception.FacingSelectListException;

@Repository
public class DepEDaoImpl implements DepEDao {

	@Override
	public ArrayList selectDepeList(SqlSessionTemplate sqlSession , int empNo) throws DepESelectListException {
		// TODO Auto-generated method stub
		System.out.println("비상연락망 다오 입장 : " + empNo);
		ArrayList DepEList = (ArrayList) sqlSession.selectList("DepE.selectDepeList", empNo);
		System.out.println("비상연랑망 다오 돌아온 리스트값 : " + DepEList);
		if(DepEList == null )
		{
			throw new DepESelectListException("리스트 조회 실패");
		}
		
		return DepEList;
	}

}
