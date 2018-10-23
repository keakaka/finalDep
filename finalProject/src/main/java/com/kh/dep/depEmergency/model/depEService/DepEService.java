package com.kh.dep.depEmergency.model.depEService;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.dep.depEmergency.model.exception.DepESelectListException;
import com.kh.dep.depEmergency.model.vo.DepE;

public interface DepEService {

	ArrayList<DepE> selectDepList(String loginUser) throws DepESelectListException;

	
}
