package com.kh.dep.rtc;

import java.io.BufferedInputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dep.sign.model.service.SignService;
import com.kh.dep.sign.model.vo.Proceeding;

@Controller
public class RTCController {
	@Autowired 
	private SignService ss;
	
	@RequestMapping(value="rtcMain.rtc")
	public String showRTCMain(){
		
		return "rtc/rtcMain";
	}
	
	@RequestMapping(value="insertProceeding.rtc")
	public @ResponseBody int insertProceeding(Proceeding p, String messageContent, int empNo, String roomId){
//		messageContent.replace("\r\n", "<br>");
		p.setRoomContent(messageContent);
		p.setEmpNo(empNo);
		p.setRoomName(roomId);
		
		return ss.insertProceeding(p);
	}
	
	@RequestMapping(value="selectProceeding.rtc")
	public String selectProceeding(Model model, int empNo){
		
		ArrayList<Proceeding> list = ss.selectProceeding(empNo);
		model.addAttribute("list", list);
		return "rtc/selectProceeding";
	}
	
	@RequestMapping(value="saveProceeding.rtc")
	public @ResponseBody void saveProceeding(String text, String roomName, HttpServletRequest request, HttpServletResponse response) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadProceedingFiles";
		String oriName = roomName;
		roomName = roomName+".txt";
        String fileName = filePath+"/"+roomName;
        String[] textArr = text.split("<br>");
        try{
            // 파일 객체 생성
            File file = new File(filePath, roomName) ;
             
            // true 지정시 파일의 기존 내용에 이어서 작성
            BufferedWriter bw = new BufferedWriter(new FileWriter(file, true)); 
            
            // 파일안에 문자열 쓰기
            for(int i = 0; i < textArr.length; i++){
            	bw.write(textArr[i]);
            	bw.newLine();
                bw.flush();
            }
            // 객체 닫기
            bw.close();
		    
        }catch(Exception e){
            e.printStackTrace();
        }
        
        File file = new File(filePath, roomName);
	    System.out.println(file);
		String fileNames;
	    
		try {
			BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
			
			fileNames = new String(roomName.getBytes("UTF-8"), "iso-8859-1");
			System.out.println(fileNames);
		    response.setContentType("application/octet-stream");

		    //다운로드와 다운로드될 파일이름
		    response.setHeader("Content-Disposition", "attachment; filename=\""+ fileNames + "\"");
		    
		    //파일복사
		    FileCopyUtils.copy(in, response.getOutputStream());
		    in.close();
		    response.getOutputStream().flush();
		    response.getOutputStream().close();
		    
		    new File(filePath + "\\" + fileNames).delete();
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
        
    }
	
	@RequestMapping(value="deleteProceeding")
	public @ResponseBody int deleteProceeding(int empNo, int proceedNo, Proceeding p){
		p.setEmpNo(empNo);
		p.setProceedNo(proceedNo);
		return ss.deleteProceeding(p);
	}
	
}
