package com.kh.dep.sign.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.util.URLEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dep.common.CommonUtils;
import com.kh.dep.member.model.service.MemberService;
import com.kh.dep.member.model.vo.MemberDepartment;
import com.kh.dep.sign.model.exception.InsertSignException;
import com.kh.dep.sign.model.exception.SelectDocException;
import com.kh.dep.sign.model.service.SignService;
import com.kh.dep.sign.model.vo.Document;
import com.kh.dep.sign.model.vo.InsertSign;
import com.kh.dep.sign.model.vo.MemberDep;

@Controller
public class SignController {
	
	@Autowired
	private SignService ss;
	@Autowired
	private MemberService ms;
	
	@RequestMapping(value="signWrite.sg")
	public String signWrite(Model model){
		
		ArrayList<MemberDepartment> depList = ms.selectDepList();
		model.addAttribute("depList", depList);
		return "sign/signWrite";
	}
	
	@RequestMapping(value="insertSign.sg")
	public String insertSign(Model model, InsertSign is, HttpServletRequest request, String signTitle, 
			String signContent, @RequestParam("appList") int[] appList, int[] recList, MultipartFile signFile, int empNo){
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadSignFiles";
		String originFileName = signFile.getOriginalFilename();
		String ext ="";
		String changeName ="";
		
		if(signFile.getOriginalFilename() != ""){	
			ext = originFileName.substring(originFileName.lastIndexOf("."));
			changeName = CommonUtils.getRandomString();
			try {
				signFile.transferTo(new File(filePath + "\\" + changeName + ext));
				is.setFilePath(filePath);
				is.setOriginFileName(originFileName);
				is.setChangeName(changeName + ext);
				is.setExt(ext);
				is.setSignTitle(signTitle);
				is.setSignContent(signContent);
				is.setWriter(empNo);
				is.setAppList(appList);
				is.setRecList(recList);
				ss.insertSign(is);
				return "redirect:/signWrite.sg";
			} catch (Exception e) {
				new File(filePath + "\\" + changeName + ext).delete();
				model.addAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
		}else{
			try {
				is.setSignTitle(signTitle);
				is.setSignContent(signContent);
				is.setWriter(empNo);
				is.setAppList(appList);
				is.setRecList(recList);
				ss.insertSign(is);
				return "redirect:/signWrite.sg";
			} catch (InsertSignException e) {
				return "common/errorPage";
			}
		}
		
	}
	
	
	@RequestMapping(value="depEmpSelect.sg")
	public @ResponseBody ArrayList<MemberDep> depEmpSelect(@RequestParam String depName){
		ArrayList<MemberDep> list = ss.selectMemberDep(depName);
		return list;
	}
	
	@RequestMapping(value="signImWriter.sg")
	public String signImWriter(Model model, int empNo){
		Document d = new Document();
		d.setEmpNo(empNo);
		try {
			ArrayList<Document> list = ss.selectImWriter(d);
			model.addAttribute("list", list);
			return "sign/signImWriter";
			
		} catch (SelectDocException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="signApprovalList.sg")
	public String signApprovalList(Model model, int empNo){
		try {
			ArrayList<Document> list = ss.selectApprovalList(empNo);
			
			model.addAttribute("list", list);
			return "sign/signApprovalList";
		} catch (SelectDocException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="signReceive.sg")
	public String signReceive(Model model, int empNo){
		try {
			ArrayList<Document> list = ss.selectReceiveList(empNo);
			
			model.addAttribute("list", list);
			
			return "sign/signReceive";
		} catch (SelectDocException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="signComplete.sg")
	public String signComplete(Model model, int empNo){
		ArrayList<Document> list = ss.selectCompleteList(empNo);
		model.addAttribute("list", list);
		return "sign/signComplete";
	}
	
	@RequestMapping(value="showAppProg.sg")
	public @ResponseBody ArrayList<Document> selectAppProgress(@RequestParam int docNo){
		ArrayList<Document> list = ss.selectAppProgress(docNo);
		return list;
	}
	
	@RequestMapping(value="showDoc.sg")
	public String showDoc(Model model, int docNo){
		InsertSign d = ss.selectDocDetail(docNo);
		model.addAttribute("d", d);
		System.out.println("d.orifilename : " + d.getOriginFileName());
		return "sign/showDoc";
	}
	
	@RequestMapping(value="signFileDownload.sg")
	public void signFileDownload(HttpServletRequest request, HttpServletResponse response, int docNo){
		InsertSign d = ss.selectDocDetail(docNo);
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadSignFiles";
		File file = new File(filePath, d.getChangeName());
	    
		String fileName;
	    
		try {
			BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
			
			fileName = new String(d.getOriginFileName().getBytes("UTF-8"), "iso-8859-1");
			
		    response.setContentType("application/octet-stream");

		    //다운로드와 다운로드될 파일이름
		    response.setHeader("Content-Disposition", "attachment; filename=\""+ fileName + "\"");
		    
		    //파일복사
		    FileCopyUtils.copy(in, response.getOutputStream());
		    in.close();
		    response.getOutputStream().flush();
		    response.getOutputStream().close();
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	    
	}
	
	@RequestMapping(value="updateApprovalStatus.sg")
	public @ResponseBody int updateApprovalStatus(Model model, Document d){
		
		return ss.updateApprovalStatus(d);
	}
	
}
