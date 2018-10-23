package com.kh.dep.board.model.service;

import java.util.ArrayList;

import com.kh.dep.board.exception.BoardException;
import com.kh.dep.board.model.vo.Board;

public interface BoardService {

	ArrayList<Board> selectBoardList(String depName) throws BoardException;

	Board selectOneBoard(int i);

	int insertWriteBoard(Board b) throws BoardException;

	int updateOneBoard(Board b);

	int deleteBoard(int boardNo);



}
