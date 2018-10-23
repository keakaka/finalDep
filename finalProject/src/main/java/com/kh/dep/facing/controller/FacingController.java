package com.kh.dep.facing.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.set.SynchronizedSortedSet;
import org.apache.log4j.helpers.SyslogQuietWriter;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.dep.addressBook.model.service.AddressBookService;
import com.kh.dep.addressBook.model.vo.AddressBook;
import com.kh.dep.attachment.model.service.AttachService;
import com.kh.dep.attachment.model.vo.Attachment;
import com.kh.dep.common.CommonUtils;
import com.kh.dep.facing.model.exception.FacingSelectListException;
import com.kh.dep.facing.model.facingService.FacingService;
import com.kh.dep.facing.model.vo.Alram;
import com.kh.dep.facing.model.vo.Facing;
import com.kh.dep.facing.model.vo.FacingInsert;
import com.kh.dep.facing.model.vo.FacingInsertR;
import com.kh.dep.facing.model.vo.WorkingQr;
import com.kh.dep.member.model.service.MemberService;
import com.kh.dep.member.model.vo.MemberSelect;
import com.kh.dep.sign.model.vo.InsertSign;
@Controller
public class FacingController {
	
	@Autowired
	private FacingService fs;
	 @Autowired
	private MemberService ms;
	 @Autowired
	private AttachService as;
	 @Autowired
	private AddressBookService abs;
		 
		

	 
	 
	@RequestMapping("facinglist.ms")
	public String selectFacingList(Model model , @RequestParam String loginUser ){
		
		System.out.println("컨트롤러 입장");
		System.out.println("회원번호" + loginUser);
	
		/*int userNo = Integer.parseInt(loginUser);
		System.out.println("처리된 회원번호" + userNo);*/
		
		ArrayList<Facing> FacingList;
		ArrayList<MemberSelect> mlist = ms.selectAllMember();
		
			try {
				
				FacingList = fs.selectFacingList(Integer.parseInt(loginUser));
				for(int j = 0; j<FacingList.size(); j++)
				{
					System.out.println(FacingList.get(j).getReceiver());
				for(int i = 0; i<mlist.size(); i++)
				{
					System.out.println("포문들어옴");
					if(mlist.get(i).getEmpNo() == FacingList.get(j).getReceiver())
					{
						//FacingReciverList.set(mlist.get(i).getEmpName());
						FacingList.get(j).setEmpName(mlist.get(i).getEmpName());
						System.out.println("찾은 이름 :" +  FacingList.get(j).getEmpName());
					}
					
					}
					
			}
				System.out.println("돌아온 리스트값 페이싱"+FacingList);
				model.addAttribute("FacingList" , FacingList);
				
			
				return "facing/facingList";
				
			} catch (FacingSelectListException e) {
				// TODO Auto-generated catch block
				System.out.println("에러입니다.");
				model.addAttribute("msg", e.getMessage());
				
				return "common/errorPage";
			}
			
			
	}
	
	@RequestMapping("facingReceiveList.ms")
	public String selectReceiveList(Model model , @RequestParam(name="loginUser")String loginUser){
		System.out.println("수신자 컨트롤러 입장");
		
		System.out.println("회원번호" + loginUser);
		
		int empNo = Integer.parseInt(loginUser);
		ArrayList<MemberSelect> mlist = ms.selectAllMember();
		
		try {
			ArrayList<Facing> FacingReciverList = fs.selectReciveList(empNo);
		
			
			
			model.addAttribute("FacingReciverList" , FacingReciverList);
			
			return "facing/facingReceive";
			
		} catch (FacingSelectListException e) {
			// TODO Auto-generated catch block
			System.out.println("에러입니다.");
			model.addAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
		
	
	}
	
	@RequestMapping("facinginsertSelect.ms")
	public String insertFacingSelect(Model model , @RequestParam(name="loginUser") String loginUser)
	{
		System.out.println("인설트 컨트롤러 입장");
		
		
		int empNo = Integer.parseInt(loginUser);
		
		
		System.out.println("회원번호" + empNo);
		
	
		
		return "facing/facingTest";
	}
	
	
	
	
	@RequestMapping("facingInsert.ms")
	public String insertFacing(Model model , @RequestParam String loginUser ,@RequestParam String receive , @RequestParam  String title
			,@RequestParam String mailContent,MultipartHttpServletRequest mtfRequest, HttpServletRequest request)
	{
		List<MultipartFile> fileList = mtfRequest.getFiles("file");

		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadTest";
		
		System.out.println("root");
		System.out.println(filePath);
		for(int ff = 0; ff <fileList.size(); ff++)
		{
			System.out.println(fileList.get(ff));
			
		}
		
 


		//=============================Facing 인설트 ======================
		System.out.println("인설트 컨트롤러 입장");
		int empNo = Integer.parseInt(loginUser);
		System.out.println("insert 회원번호 : " + empNo);
		System.out.println("insert 수신자 : " + receive);
		System.out.println("insert 제목 : " + title);
		System.out.println("insert 내용 : " + mailContent);
		System.out.println("insert String.length : " + receive.length());
		
		System.out.println("===========================================");
		
		
		//System.out.println("들어갔냐"+fi);
		//여러명일때 여러번 인설트
		ArrayList<String> list = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(receive,",");
			
		if(receive.length() > 5 )
		{
			FacingInsert fi = new FacingInsert();
		
			
			
			fi.setFacingTitle(title);
			fi.setFacingContents(mailContent);
			fi.setEmpNo(empNo);
			
			
			  int tokensize = 0;
			  tokensize=st.countTokens();
			  System.out.println("토근 사이즈 값" + tokensize);
				System.out.println("if문들어감");
				System.out.println("if문에 들어온 :" +receive);
				
				while (st.hasMoreTokens()){
					list.add(st.nextToken());
					System.out.println("리스트 에 추가됨");
				}
			for(int j = 0; j < list.size(); j++)
			{
					
						int result = 0;
				
						 result = fs.insertFacing(fi);
						System.out.println("인설트완료!!");
						 System.out.println("돌아온 리절트값" + result);
				  System.out.println("============================");
				  
						
						System.out.println("담긴리스트:"+list.get(j));
						
						System.out.println("=================");
						System.out.println("찾아보자!");
						
						ArrayList<MemberSelect> mlist = ms.selectAllMember();
						System.out.println("리스트" + mlist);	
						
						for(int i1 = 0; i1<mlist.size(); i1++)
						{	
							//방금 인설트한 쪽지번호 가져오기 
							Facing nowFacing = fs.selectNowFacing(empNo);
							System.out.println("돌아온 최근 쪽지번호 : " + nowFacing.getFacingNo());
						
						if(mlist.get(i1).getEmpName().equals(list.get(j)))
								{	
									FacingInsertR fir = new FacingInsertR();
									Alram al = new Alram();
									System.out.println("----------찾음----------");
									System.out.println("전체 리스트에서 찾은 사원이름 : " + mlist.get(i1).getEmpName());
									System.out.println(mlist.get(i1).getEmpNo());
									int receiveNo = mlist.get(i1).getEmpNo(); //이름 받아오기
									int nFacingNo = nowFacing.getFacingNo(); //쪽지 번호받아오기
						
									fir.setFacingNo(nFacingNo);
									fir.setReceiver(receiveNo);
									System.out.println("객체에 들어간 번호: " + fir.getFacingNo() + "번");
									System.out.println("객체에 들어간 회원번호 : " + fir.getReceiver() + "번");
						
									int resultR = fs.insertReceiver(fir);
									System.out.println("========알람=======");
									//받는사람,제목 
									al.setAlramContents(title);
									al.setEmpNo(receiveNo);
									int alram = fs.insertAlram(al);
									
									System.out.println("======어태치먼트 구역======");
							     

									for(MultipartFile f : fileList){
							             
							             String originFileName = f.getOriginalFilename();
							             String ext = originFileName.substring(originFileName.lastIndexOf("."));
							             String changeName = CommonUtils.getRandomString();
							             
							          try {
							                f.transferTo(new File(filePath + "\\" + changeName + ext));
							                
							                
							                
							                
							                Attachment file = new Attachment();
							                
							                file.setEmailNo(nowFacing.getFacingNo());
							                file.setEmpNo(empNo);
							                file.setModiFileName(changeName + ext);
							                file.setOriFileName(originFileName);
							                
							                System.out.println(file);
							                int resultA = as.insertFacingAttach(file);
							                if(resultA>0){
							                System.out.println("어태치 성공");
							                }
							          
							             } catch (Exception e) {
							             
							                new File(filePath + "\\" + changeName + ext).delete();
							                
							             } 
							       
							 
									 }break;
									 
									
									
								}
					
									
							
							
						}
					}
			
			  
			
		}else{
		
			FacingInsert fi = new FacingInsert();
			FacingInsertR fir = new FacingInsertR();
			Alram al = new Alram();
			int result = 0;
			
			fi.setFacingTitle(title);
			fi.setFacingContents(mailContent);
			fi.setEmpNo(empNo);
			
		result = fs.insertFacing(fi);
		
		System.out.println("쪽지인설트 결과값 :"+result);
		
		
	
		ArrayList<MemberSelect> mlist = ms.selectAllMember();
		System.out.println("리스트" + mlist);	
		//방금 인설트한 쪽지번호 가져오기 
		Facing nowFacing = fs.selectNowFacing(empNo);

		System.out.println("nowFacing : " + nowFacing);

		System.out.println(nowFacing);
		
		System.out.println("돌아온 최근 쪽지번호 : " + nowFacing.getFacingNo());
		
		
		System.out.println("======어태치먼트 구역======");

		for(MultipartFile f : fileList){
             
             String originFileName = f.getOriginalFilename();
             String ext = originFileName.substring(originFileName.lastIndexOf("."));
             String changeName = CommonUtils.getRandomString();
             
          try {
                f.transferTo(new File(filePath + "\\" + changeName + ext));
                
                
                
                
                Attachment file = new Attachment();
                
                file.setEmailNo(nowFacing.getFacingNo());
                file.setEmpNo(empNo);
                file.setModiFileName(changeName + ext);
                file.setOriFileName(originFileName);
                
                System.out.println(file);
                int resultA = as.insertFacingAttach(file);
                if(resultA>0){
                System.out.println("어태치 성공");
                }
          
             } catch (Exception e) {
             
                new File(filePath + "\\" + changeName + ext).delete();
                
             }  
 
		 }
	
		for(int i = 0; i<mlist.size(); i++)
		{	
			System.out.println("=================");
			System.out.println("찾아보자!");
			System.out.println("리시브" + receive);
			System.out.println(mlist.get(i).getEmpName());
		if(mlist.get(i).getEmpName().equals(receive))
		{	
			System.out.println("=========찾음==========");
			System.out.println("리스트에서 찾은 사원이름" + mlist.get(i).getEmpName());
			System.out.println(mlist.get(i).getEmpNo());
			int receiveNo = mlist.get(i).getEmpNo();
			int nFacingNo = nowFacing.getFacingNo();
		
			fir.setFacingNo(nFacingNo);
			fir.setReceiver(receiveNo);
			System.out.println("객체에 들어간 쪽지번호 : " + fir.getFacingNo());
			System.out.println("객체에 들어간 수신자번호 : " + fir.getReceiver());
		
			int resultR = fs.insertReceiver(fir);
			System.out.println("=========알람==========");
			al.setAlramContents(title);
			al.setEmpNo(receiveNo);
			int alram = fs.insertAlram(al);
			break;
		
	}
		
}
		}
		
	
	

		return "facing/facingTest";
		
	}
	
	@RequestMapping("facingSelectOne.ms")
	public @ResponseBody Facing SelectOneFacing(Model model , @RequestParam(name="facingNo") String facingNo)
	{
		System.out.println("selectOne 입장");
		
		int fNo = Integer.parseInt(facingNo);
		
		System.out.println("쪽지번호 : " + fNo);
		
		Facing f;
		
		try {
			f = fs.selectOneFacing(fNo);
			System.out.println("f : " + f);
			model.addAttribute("f" , f);
			return f;
			/*return "facing/facingSelectOneTs1";*/
		} catch (FacingSelectListException e) {
			// TODO Auto-generated catch block
			model.addAttribute("msg", e.getMessage());
			return null;
			/*return "common/errorPage";*/
		}
		
		
	}
	
	@RequestMapping(value="updateFacing.ms")
	public void updateFacing(Model model , @RequestParam String facingNo , HttpServletResponse response)
	{
		
		System.out.println("쪽지 업데이트 입장");
		
		
		int fNo = Integer.parseInt(facingNo);
	
		
		
		System.out.println("쪽지번호 : " + fNo);
	
		
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			
			
			int result = fs.updateFacing(fNo);
			System.out.println("돌아온 리스트값" + result);
			response.getWriter().print(mapper.writeValueAsString(result));
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
	}
	@RequestMapping(value="qrInsert.ms")
	public String qrInsert()
	{
		System.err.println("QR컨트롤 입장");
		
		return "qr/qrCode";
	}

	@RequestMapping(value="qrInsertdb.ms")
	public String Insertqr(Model model,@RequestParam String loginUser )
	{
		System.err.println("출석완료 QR컨트롤 입장");
		
		
		int empNo = Integer.parseInt(loginUser);
		
		System.out.println("출석된 empNo"+empNo);
		
		int result = fs.InsertWorking(empNo);
		
		ArrayList<WorkingQr> qrList = fs.selectWorking(empNo);
		
		
		Date today = new Date();
		System.out.println(today);
		SimpleDateFormat date = new SimpleDateFormat("MM-dd");
		String todayF = date.format(today).substring(0,2);
		System.out.println("오늘 날짜  : "  + todayF);
		
		
		for(int i = 0; i<qrList.size(); i++)
		{
			System.out.println("출근시간 : " + qrList.get(i).getHours());
			String sysdate = qrList.get(i).getHours();
			String sys = sysdate.substring(0,2);
			
			System.out.println("시간: " + sys);
			int siint = Integer.parseInt(sys);
			String jigak ="지각" ;
			String chul ="정상출근";
			String offWork = "퇴근";
			
			
		if(qrList.get(i).getToday().equals(todayF))
		{
			if( siint > 10 && siint <=17 )
			{
				qrList.get(i).setState(jigak);;
				System.out.println("리스트 출력1 :" + qrList);
			}else if(siint > 7 &&siint <= 10)
			{
				
		
				qrList.get(i).setState(chul);
				
			}else if(siint >= 17)
			{	
				
				qrList.get(i).setState(offWork);
				
				if(siint > 17 && siint < 24 )
				{
					
						
						int cho = 0;
						cho = siint - 17;	
						System.out.println("초과 근무시간  : " + cho);
						
						qrList.get(i).setPlusWork(cho);
						
				}
				
			}
			
			
		
		}
		
		}
		
		System.out.println("돌아온 리설트 값 :" + result);
		model.addAttribute("qrList" , qrList);

		return "qr/qrqr";
	}
	
	@RequestMapping("replyFacing.ms")
	public String replyFacing(Model model, @RequestParam String empNo )
	{
		System.out.println("입장" + empNo);
		Facing f = new Facing();
		int e = Integer.parseInt(empNo);
		
		
		ArrayList<MemberSelect> mlist = ms.selectAllMember();
		
		for(int i = 0; i < mlist.size(); i++)
		{
			if(mlist.get(i).getEmpNo() == e)
			{
				System.out.println(mlist.get(i).getEmpName());
				String reply = mlist.get(i).getEmpName();
				f.setEmpName(reply);
			}
		}
		
		model.addAttribute("f" , f);

		
		return "facing/facingReply";
	}
	

	@RequestMapping("facingInsert2.ms")
	public String insertFacing2(Model model , @RequestParam String loginUser ,@RequestParam String receive , @RequestParam  String title
			,@RequestParam String mailContent,MultipartHttpServletRequest mtfRequest, HttpServletRequest request)
	{
		List<MultipartFile> fileList = mtfRequest.getFiles("file");

		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadTest";
		
		System.out.println("root");
		System.out.println(filePath);
		for(int ff = 0; ff <fileList.size(); ff++)
		{
			System.out.println(fileList.get(ff));
			
		}
		
 


		//=============================Facing 인설트 ======================
		System.out.println("인설트 컨트롤러 입장");
		int empNo = Integer.parseInt(loginUser);
		System.out.println("insert 회원번호 : " + empNo);
		System.out.println("insert 수신자 : " + receive);
		System.out.println("insert 제목 : " + title);
		System.out.println("insert 내용 : " + mailContent);
		System.out.println("insert String.length : " + receive.length());
		
		System.out.println("===========================================");
		
		FacingInsert fi = new FacingInsert();
		FacingInsertR fir = new FacingInsertR();
		Alram al = new Alram();
		
		fi.setFacingTitle(title);
		fi.setFacingContents(mailContent);
		fi.setEmpNo(empNo);
		
		System.out.println("들어갔냐"+fi);
		
		int result = fs.insertFacing(fi);
		
		System.out.println("쪽지인설트 결과값 :"+result);
		ArrayList<MemberSelect> mlist = ms.selectAllMember();
		System.out.println("리스트" + mlist);
		Facing nowFacing = fs.selectNowFacing(empNo);
		System.out.println("돌아온 최근 쪽지번호 : " + nowFacing.getFacingNo());
		
	
		
		//==================수신자 ,알람 인설트==================
		if(result > 0  && receive.length() > 6 )
		{
			System.out.println("if문들어감");
			System.out.println("if문에 들어온 :" +receive);
			StringTokenizer st = new StringTokenizer(receive,",");
			ArrayList<String> list = new ArrayList<String>();
			
			while (st.hasMoreTokens()){
				list.add(st.nextToken());
			}

					for(int ss = 0; ss<list.size(); ss++)
					{
						System.out.println("문자열 담긴 리스트:  " + list.get(ss).toString());
					}
			for(int j = 0; j < list.size(); j++)
			{
				
				System.out.println("담긴리스트:"+list.get(j));
				
				for(int i = 0; i<mlist.size(); i++)
				{	
					System.out.println("=================");
					System.out.println("찾아보자!");
					System.out.println(mlist.get(i).getEmpName());
					if(mlist.get(i).getEmpName().equals(list.get(j)))
							{	
						
								System.out.println("----------찾음----------");
								System.out.println("전체 리스트에서 찾은 사원이름 : " + mlist.get(i).getEmpName());
								System.out.println(mlist.get(i).getEmpNo());
								int receiveNo = mlist.get(i).getEmpNo(); //이름 받아오기
								int nFacingNo = nowFacing.getFacingNo(); //쪽지 번호받아오기
					
								fir.setFacingNo(nFacingNo);
								fir.setReceiver(receiveNo);
								System.out.println("객체에 들어간 번호: " + fir.getFacingNo() + "번");
								System.out.println("객체에 들어간 회원번호 : " + fir.getReceiver() + "번");
					
								int resultR = fs.insertReceiver(fir);
								System.out.println("========알람=======");
								//받는사람,제목 
								al.setAlramContents(title);
								al.setEmpNo(receiveNo);
								int alram = fs.insertAlram(al);
								break;
						
					}
				}
			}
		}
						
			
			else if(result > 0 && receive.length() < 6 )
			{
				for(int i = 0; i<mlist.size(); i++)
				{	
					System.out.println("=================");
					System.out.println("찾아보자!");
					System.out.println("리시브" + receive);
					System.out.println(mlist.get(i).getEmpName());
				if(mlist.get(i).getEmpName().equals(receive))
				{	
					System.out.println("=========찾음==========");
					System.out.println("리스트에서 찾은 사원이름" + mlist.get(i).getEmpName());
					System.out.println(mlist.get(i).getEmpNo());
					int receiveNo = mlist.get(i).getEmpNo();
					int nFacingNo = nowFacing.getFacingNo();
				
					fir.setFacingNo(nFacingNo);
					fir.setReceiver(receiveNo);
					System.out.println("객체에 들어간 쪽지번호 : " + fir.getFacingNo());
					System.out.println("객체에 들어간 수신자번호 : " + fir.getReceiver());
				
					int resultR = fs.insertReceiver(fir);
					System.out.println("=========알람==========");
					al.setAlramContents(title);
					al.setEmpNo(receiveNo);
					int alram = fs.insertAlram(al);
					break;
				
			}
				
		}
		}
		
		
		//==================어태치 먼트 =========================
		System.out.println("======어태치먼트 구역======");

		for(MultipartFile f : fileList){
             
             String originFileName = f.getOriginalFilename();
             String ext = originFileName.substring(originFileName.lastIndexOf("."));
             String changeName = CommonUtils.getRandomString();
             
          try {
                f.transferTo(new File(filePath + "\\" + changeName + ext));
                
                
                Attachment file = new Attachment();
                
                file.setEmailNo(nowFacing.getFacingNo());
                file.setEmpNo(empNo);
                file.setModiFileName(changeName + ext);
                file.setOriFileName(originFileName);
                
                System.out.println(file);
                int resultA = as.insertFacingAttach(file);
                if(resultA>0){
                System.out.println("어태치 성공");
                }
          
             } catch (Exception e) {
             
                new File(filePath + "\\" + changeName + ext).delete();
                
             }  
 
		 }
		
		List<AddressBook> list = abs.selectAddList();
		System.out.println("selectAdd list : " + list);
		
		model.addAttribute("list", list);

		return "addressBook/addressBook";
		
	}

	
	@RequestMapping(value="facingDown.ms")
	public @ResponseBody void signFileDownload(HttpServletRequest request, HttpServletResponse response, String oriName, String modiName){
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadTest";
		
	    
		String fileName;
	    
		try {
			File file = new File(filePath, modiName);
			BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
			
			fileName = new String(oriName.getBytes("UTF-8"), "iso-8859-1");
			
		    response.setContentType("application/octet-stream");


		    //다운로드와 다운로드될 파일이름
		    response.setHeader("Content-Disposition", "attachment; filename=\""+ fileName + "\"");
		    System.out.println("fileName : " + fileName);
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
	
	
	
}}