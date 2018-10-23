package com.kh.dep.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dep.board.exception.BoardException;
import com.kh.dep.board.model.dao.BoardDao;
import com.kh.dep.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDao bd;
	
	@Override
	public ArrayList<Board> selectBoardList(String depName) throws BoardException {
		
		ArrayList<Board> blist = null;
		
		blist = bd.selectBoardList(sqlSession, depName);
		
		
		if(blist.size() == 0){
			throw new BoardException("게시판 목록 불러오기 실패");
		}
		
		return blist;
	}

	@Override
	public Board selectOneBoard(int bid) {
		
		Board b = null;
		
		int result = bd.updateCountBoard(sqlSession, bid);
		
		if(result > 0){
			b = bd.selectOneBoard(sqlSession, bid);
		}
		
		return b;
	}

	// 게시판 입력
	@Override
	public int insertWriteBoard(Board b) throws BoardException {
		
		int result = bd.insertWriteBoard(sqlSession, b);
		
		
		if(result > 0){
			
			int bNo = bd.selectBoardNumber(sqlSession);
			
			return bNo;
		}else{
			throw new BoardException("게시글 작성 실패");
		}
				
		
	}

	@Override
	public int updateOneBoard(Board b) {
		
		int upResult = bd.updateOneBoard(sqlSession, b);
		
		
		
		
		return upResult;
	}

	@Override
	public int deleteBoard(int boardNo) {
		
		int result = bd.deleteBoard(sqlSession, boardNo);
		
		return result;
	}

	

}
