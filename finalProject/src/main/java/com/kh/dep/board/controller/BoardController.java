package com.kh.dep.board.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dep.attachment.model.service.AttachService;
import com.kh.dep.attachment.model.vo.Attachment;
import com.kh.dep.board.exception.BoardException;
import com.kh.dep.board.model.service.BoardService;
import com.kh.dep.board.model.vo.Board;
import com.kh.dep.common.CommonUtils;
import com.kh.dep.member.model.vo.MemberSelect;



@Controller
public class BoardController {


	@Autowired
	private BoardService bs;
	
	@Autowired
	private AttachService as;

	@RequestMapping("boardList.bo")
	public String selectBoardList(Model model, @RequestParam(name="depName")String depName){

		
		try {
			ArrayList<Board>blist = bs.selectBoardList(depName);

			model.addAttribute("blist", blist);

		} catch (Exception e) {

			System.out.println(e.getMessage());
		}


		return "board/boardList";
	}


	
	@RequestMapping("selectOneBoard.bo")
	public String selectOneBoard(@RequestParam String bid, Model model){
		
		
		Board b = bs.selectOneBoard(Integer.parseInt(bid));
		
		ArrayList<Attachment> atlist = null;
		
		if(b != null){
			
			atlist = as.selectDownloadList(b);
			
		}
		
		model.addAttribute("b", b);
		model.addAttribute("atlist", atlist);
		

		return "board/selectOneBoard";
	}

	@RequestMapping("insertBoard.bo")
	public String insertBoard(){


		return "board/insertBoard";	
	}

	@RequestMapping("writeBoard.bo")
	public String insertWriteBoard(Board b, MultipartHttpServletRequest mtfRequest, HttpServletRequest request,
						RedirectAttributes redirectAttributes){
		
	
			
			
			try {
				int bNo = bs.insertWriteBoard(b);
				
				if(bNo > 0){
					
					b.setBoardNo(bNo);
					
				
						 List<MultipartFile> fileList = mtfRequest.getFiles("file");

							String root = request.getSession().getServletContext().getRealPath("resources");
							String filePath = root + "\\uploadTest";
		
							for(MultipartFile f : fileList){
							
								
									String originFileName = f.getOriginalFilename();
									
									if(originFileName != ""){
									String ext = originFileName.substring(originFileName.lastIndexOf("."));
									
									String changeName = CommonUtils.getRandomString();
				
								
							try {
									f.transferTo(new File(filePath + "\\" + changeName + ext));
									
									
									Attachment file = new Attachment();
									
									file.setBoardNo(b.getBoardNo());
									file.setEmpNo(b.getEmpNo());
									file.setModiFileName(changeName + ext);
									file.setOriFileName(originFileName);
									
									int result = as.insertBoardAttach(file);
									
									
							
								} catch (Exception e) {
								
									new File(filePath + "\\" + changeName + ext).delete();
									
								}
								
						
				
					
							}
									
							}
				}
				
				
			
			} catch (Exception e) {
				System.out.println("보드입력 예외발생");
				//System.out.println(e.getMessage());
			}
			
			redirectAttributes.addAttribute("depName", b.getDepName()); //value값 넘길때 공백확인 잘할것
			
			
		
		return "redirect:/boardList.bo";
	}


	
	//summerNote image Upload method
	@RequestMapping("imgUpload.bo")
	@ResponseBody
    public void handleFileUpload(HttpServletResponse response, HttpServletRequest request,
    							@RequestParam("uploadFile") MultipartFile file) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadFiles";

		String originFileName = file.getOriginalFilename();
		
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		
		String changeName = CommonUtils.getRandomString();
		
		
		
		
		try {
			
			file.transferTo(new File(filePath + "\\" + changeName + ext) );


				PrintWriter out = response.getWriter();
				out.println(changeName + ext);

				out.flush();
				out.close();

				JSONObject json = new JSONObject();
				json.put("data", changeName + ext);


				System.out.println(json.toString());
			

		} catch (Exception e) {
			
			new File(filePath + "\\" + changeName + ext).delete();
		}
		


	}


	// summerNote 이미지 삭제
	@RequestMapping("imgDelete.bo")
	public 	@ResponseBody int imgDelete(HttpServletRequest request,HttpServletResponse response, @RequestParam("src")String src){
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "//uploadFiles";
		
		String fileName = src.substring(src.lastIndexOf("/") + 1);
		
		String fullPath = filePath +"//" + fileName;
		
		boolean istrue = new File(fullPath).delete();		
		
		if(istrue == true){
			
			return 1;
			
		}
		
		return 0;
		
	}

	
	@RequestMapping("fileDown.bo")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam(name="fileName")String fileName, @RequestParam(name="orifileName")String oriFileName,
			Model model){
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadTest";
		File file = new File(filePath, fileName);
		
		
	    
		try {
			BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
			
			String name = new String(oriFileName.getBytes("UTF-8"), "iso-8859-1");
			
		    response.setContentType("application/octet-stream");

		    //다운로드와 다운로드될 파일이름
		    response.setHeader("Content-Disposition", "attachment; filename=\""+ name + "\"");
		    
		    //파일복사
		    FileCopyUtils.copy(in, response.getOutputStream());
		    in.close();
		    response.getOutputStream().flush();
		    response.getOutputStream().close();
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.getMessage();
		}
		
		
	}
	
	@RequestMapping("updateBoard.bo")
	public String updateOneBoard(Board b, MultipartHttpServletRequest mtfRequest, HttpServletRequest request,
			RedirectAttributes redirectAttributes){
		
		//System.out.println("updateBoard.bo 입력 : " + b);
		
		int upResult = bs.updateOneBoard(b);
		
		if(upResult > 0){
			
			 List<MultipartFile> fileList = mtfRequest.getFiles("file");

				String root = request.getSession().getServletContext().getRealPath("resources");
				String filePath = root + "\\uploadTest";

				//첨부파일 유무 확인 후 기존 파일 삭제
				for(MultipartFile f : fileList){
					String originFileName = f.getOriginalFilename();
					if(originFileName != ""){
						String ext = originFileName.substring(originFileName.lastIndexOf("."));
						
						int result = as.deleteBoardAttach(b.getBoardNo());
						
						if(result > 0){
							break;
						}
						
					}
				}
				
				
				// 기존 파일 삭제 후 새 첨부파일 업로드
				for(MultipartFile f : fileList){
				
					
						String originFileName = f.getOriginalFilename();
						
						if(originFileName != ""){
						String ext = originFileName.substring(originFileName.lastIndexOf("."));
						
						String changeName = CommonUtils.getRandomString();
	
					
				try {
						f.transferTo(new File(filePath + "\\" + changeName + ext));
						

							Attachment file = new Attachment();
							
							file.setBoardNo(b.getBoardNo());
							file.setEmpNo(b.getEmpNo());
							file.setModiFileName(changeName + ext);
							file.setOriFileName(originFileName);
							
							
							int saveResult = as.insertBoardAttach(file);
							
							/*if(saveResult > 0){
								System.out.println("updateBoard : 게시글 수정 후 파일저장 성공");
							}*/
							
	
					} catch (Exception e) {
					
						new File(filePath + "\\" + changeName + ext).delete();
						
					}

				}
						
				}
			
			
			
		}
		
		
		
		redirectAttributes.addAttribute("depName", b.getDepName());
	
		return "redirect:/boardList.bo";
		
	}

	
	@RequestMapping("deleteBoard.bo")
	public String deleteBoard(RedirectAttributes redirectAttributes,
							@RequestParam(name="boardNo")int boardNo, @RequestParam(name="depName")String depName){
		
		
		int deleteBoard = bs.deleteBoard(boardNo);
		
		if(deleteBoard > 0){
			//System.out.println("게시글 삭제 완료");
		}
		
		
		redirectAttributes.addAttribute("depName", depName);
		
		return "redirect:/boardList.bo";
		
	}






}
