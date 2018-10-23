package com.kh.dep.attachment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dep.attachment.model.vo.Attachment;
import com.kh.dep.board.model.vo.Board;

@Repository
public class AttachDaoImpl implements AttachDao {

	@Override
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment file) {
		
		
		return sqlSession.insert("Member.insertAttach", file);
	}

	@Override
	public int insertFacingAttachment(SqlSessionTemplate sqlSession, Attachment file) {
		// TODO Auto-generated method stub
		System.out.println("어태치 다오도착");
		int resultA = sqlSession.insert("Member.insertFacingAttach",file);
		if(resultA>0){
		System.out.println("어태치 다오 결과값 :" + resultA);
		}
		else{
			System.out.println("인설트 안돼");
		}
		return resultA;
  }
  
  @Override
	public int insertBoardAttach(SqlSessionTemplate sqlSession, Attachment file) {
		
		return sqlSession.insert("Board.insertBoardAttach", file);
	}

	@Override
	public ArrayList<Attachment> selectDownloadList(SqlSessionTemplate sqlSession, Board b) {
		
		return (ArrayList)sqlSession.selectList("Board.selectDownList", b);
	}

	//기존 게시판 첨부파일 삭제
	@Override
	public int deleteBoardAttach(SqlSessionTemplate sqlSession, int boardNo) {
		
		
		
		return sqlSession.delete("Board.deleteBoardAttach" , boardNo);
	}

	
}
