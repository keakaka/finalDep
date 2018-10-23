package com.kh.dep.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dep.board.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Override
	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, String depName) {
		
	
		
		return (ArrayList)sqlSession.selectList("Board.selectBoardList", depName);
	}

	@Override
	public Board selectOneBoard(SqlSessionTemplate sqlSession, int bid) {
		
		
		return sqlSession.selectOne("Board.selectOneBoard", bid);
	}

	@Override
	public int insertWriteBoard(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.insert("Board.insertWirteBoard", b);
	}

	@Override
	public int selectBoardNumber(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Board.selectBoardNumber");
	}

	@Override
	public int updateOneBoard(SqlSessionTemplate sqlSession, Board b) {
		
		
		return sqlSession.update("Board.updateOneBoard", b);
	}

	@Override
	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("Board.deleteBoard", boardNo);
	}

	@Override
	public int updateCountBoard(SqlSessionTemplate sqlSession, int bid) {
		
		return sqlSession.update("Board.updateCountBoard", bid);
	}

	
	

}
