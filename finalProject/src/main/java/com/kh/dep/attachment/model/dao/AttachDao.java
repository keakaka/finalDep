package com.kh.dep.attachment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dep.attachment.model.vo.Attachment;
import com.kh.dep.board.model.vo.Board;

public interface AttachDao {

	int insertAttachment(SqlSessionTemplate sqlSession, Attachment file);

	int insertFacingAttachment(SqlSessionTemplate sqlSession, Attachment file);

	int insertBoardAttach(SqlSessionTemplate sqlSession, Attachment file);

	ArrayList<Attachment> selectDownloadList(SqlSessionTemplate sqlSession, Board b);

	int deleteBoardAttach(SqlSessionTemplate sqlSession, int boardNo);


}
