package com.kh.dep.attachment.model.service;

import java.util.ArrayList;

import com.kh.dep.attachment.model.vo.Attachment;
import com.kh.dep.board.model.vo.Board;

public interface AttachService {

	int insertAttachment(Attachment file);

	int insertFacingAttach(Attachment file);
	
	int insertBoardAttach(Attachment file);

	ArrayList<Attachment> selectDownloadList(Board b);

	int deleteBoardAttach(int boardNo);

	

}
