package com.kh.dep.personManagement.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kh.dep.member.model.service.MemberService;
import com.kh.dep.member.model.vo.MemberDepartment;
import com.kh.dep.member.model.vo.MemberJob;
import com.kh.dep.member.model.vo.MemberSelect;
import com.kh.dep.personManagement.model.pmService.PmService;
import com.kh.dep.personManagement.model.vo.DepLeave;
import com.kh.dep.personManagement.model.vo.DepMoveDepRecord;
import com.kh.dep.personManagement.model.vo.PromotionIn;
import com.kh.dep.personManagement.model.vo.PromotionLi;
import com.kh.dep.personManagement.model.vo.Tdatel;
import com.kh.dep.personManagement.model.vo.VacationIn;
import com.kh.dep.personManagement.model.vo.VacationLi;
import com.kh.dep.personManagement.model.vo.Working;


@Controller
public class PersonController {

	@Autowired
	private PmService ps;
  @Autowired
	private MemberService ms;


	@RequestMapping("depMgt.pm")
	public String depMgt(Model model){

		ArrayList<MemberDepartment> deplist = ms.selectDepList();

		ArrayList<MemberJob> joblist = ms.selectJobList();

		ArrayList<MemberSelect> mlist = ms.selectAllMember();

		System.out.println("근태관리 입장");

		model.addAttribute("deplist", deplist);
		model.addAttribute("joblist", joblist);
		model.addAttribute("mlist", mlist);


		return "personManagement/departmentManagement";
	}



	@RequestMapping("depMgtList.pm")
	public @ResponseBody ArrayList<Working> depMgtList(@RequestParam String depName){
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		System.out.println("근태 컨트롤 입장"+depName);
		Working w = new Working();
		ArrayList<Working> list = ps.depMgtList(depName);




		hmap.put("list", list);

		return list;
	}
	@RequestMapping("depMgtdayList.pm")
	public @ResponseBody ArrayList<Working> depMgtdayList(@RequestParam String day,@RequestParam String depName,@RequestParam String year){
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		System.out.println("근태 컨트롤 입장"+day);

		ArrayList<Working> list = ps.depMgtdayList(day ,depName , year);

		hmap.put("list", list);

		return list;
	}
	@RequestMapping("depNameList.pm")
	public @ResponseBody ArrayList<Working> depNameList(@RequestParam String name){
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		System.out.println("근태 컨트롤 입장"+name);

		ArrayList<Working> list = ps.depNameList(name);

		hmap.put("list", list);

		return list;
	}




	@RequestMapping("depVacation.pm")
	public String depVacation(Model model)
	{
		System.out.println("컨트롤 입장");

		ArrayList<MemberDepartment> deplist = ms.selectDepList();


		model.addAttribute("deplist", deplist);
		return "personManagement/depVacation";
	}
	@RequestMapping("depPromotion.pm")
	public String depPromotion(Model model)
	{
		System.out.println("컨트롤 입장");
		ArrayList<MemberDepartment> deplist = ms.selectDepList();


		model.addAttribute("deplist", deplist);
		return "personManagement/depPromotion";
	}

	@RequestMapping(value="vacationList.pm")
	public @ResponseBody ArrayList<VacationLi> depVacationList(@RequestParam String depName){
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		System.out.println("휴가 컨트롤 입장"+depName);

		ArrayList<VacationLi> list = ps.vacationDepList(depName);
		for(int i = 0; i < list.size(); i++)
      {
      if(list.get(i).getVacType().equals("VT1"))
         {
            list.get(i).setVacType("연가");
         }else if(list.get(i).getVacType().equals("VT2"))
         {
            list.get(i).setVacType("공가");
         }else if(list.get(i).getVacType().equals("VT3"))
         {
            list.get(i).setVacType("병가");
         }else if(list.get(i).getVacType().equals("VT4"))
         {
            list.get(i).setVacType("특별휴가");
         }else if(list.get(i).getVacType().equals("VT5"))
         {
            list.get(i).setVacType("반가");
         }
      }
		hmap.put("list", list);

		return list;
	}

	@RequestMapping("vacationDayList.pm")
	public @ResponseBody ArrayList<VacationLi> depVacationDayList(@RequestParam String day){
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		System.out.println("휴가 날짜 컨트롤 입장"+day);

		ArrayList<VacationLi> list = ps.vacationDayList(day);
		for(int i = 0; i < list.size(); i++)
      {
      if(list.get(i).getVacType().equals("VT1"))
         {
            list.get(i).setVacType("연가");
         }else if(list.get(i).getVacType().equals("VT2"))
         {
            list.get(i).setVacType("공가");
         }else if(list.get(i).getVacType().equals("VT3"))
         {
            list.get(i).setVacType("병가");
         }else if(list.get(i).getVacType().equals("VT4"))
         {
            list.get(i).setVacType("특별휴가");
         }else if(list.get(i).getVacType().equals("VT5"))
         {
            list.get(i).setVacType("반가");
         }
      }
		hmap.put("list", list);

		return list;
	}








	@RequestMapping("depPromotinList.pm")
	public @ResponseBody ArrayList<PromotionLi> selectPromotionList(@RequestParam String depName){
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		System.out.println("진급 컨트롤 입장"+depName);

		ArrayList<PromotionLi> list = ps.selectPromotionList(depName);

		hmap.put("list", list);

		return list;
	}

	@RequestMapping("depPromotiondayList.pm")
	public @ResponseBody ArrayList<PromotionLi> selectPromotiondayList(@RequestParam String year,@RequestParam String day,@RequestParam String depName){
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		System.out.println("진급 날짜 컨트롤 입장 "+day+"진급부서 "+depName);

		ArrayList<PromotionLi> list = ps.selectPromotiondayList(day,depName,year);

		hmap.put("list", list);

		return list;
	}




	@RequestMapping("leave.pm")
	public String leave(Model model){

		ArrayList<MemberDepartment> deplist = ms.selectDepList();

		ArrayList<MemberJob> joblist = ms.selectJobList();

		ArrayList<MemberSelect> mlist = ms.selectAllMember();

		model.addAttribute("deplist", deplist);
		model.addAttribute("joblist", joblist);
		model.addAttribute("mlist", mlist);



		return "personManagement/leave";
	}


	@RequestMapping("moveDept.pm")
	public String moveDept(Model model){


		ArrayList<MemberDepartment> deplist = ms.selectDepList();

		ArrayList<MemberJob> joblist = ms.selectJobList();

		ArrayList<MemberSelect> mlist = ms.selectAllMember();

		model.addAttribute("deplist", deplist);
		model.addAttribute("joblist", joblist);
		model.addAttribute("mlist", mlist);



		return "personManagement/moveDept";
	}


	@RequestMapping("depleave.pm")
	public String movedepleave(Model model){


		ArrayList<MemberDepartment> deplist = ms.selectDepList();

		model.addAttribute("deplist", deplist);

		return "personManagement/depLeave";
	}

	@RequestMapping("vacation.pm")
	public String vacation(Model model){

		ArrayList<MemberDepartment> deplist = ms.selectDepList();

		ArrayList<MemberJob> joblist = ms.selectJobList();

		ArrayList<MemberSelect> mlist = ms.selectAllMember();

		model.addAttribute("deplist", deplist);
		model.addAttribute("joblist", joblist);
		model.addAttribute("mlist", mlist);


		return "personManagement/vacation";
	}


	@RequestMapping("promotion.pm")
	public String promotion(Model model){


		ArrayList<MemberDepartment> deplist = ms.selectDepList();

		ArrayList<MemberJob> joblist = ms.selectJobList();

		ArrayList<MemberSelect> mlist = ms.selectAllMember();

		model.addAttribute("deplist", deplist);
		model.addAttribute("joblist", joblist);
		model.addAttribute("mlist", mlist);


		return "personManagement/promotion";
	}

	@RequestMapping("insertVacation.pm")
	public String insertvacation(@RequestParam String userNo , @RequestParam String vacReason, @RequestParam String vacType,
			@RequestParam String vacEndDate,@RequestParam String vacStartDate , Model model){


		System.out.println("휴가 정보입력");
		VacationIn v = new VacationIn();

			int empNo = Integer.parseInt(userNo);

			System.out.println(empNo);


			if(vacType.equals("공가"))
			{
				v.setVacType("VT2");
			}else if(vacType.equals("병가"))
			{
				v.setVacType("VT3");
			}else if(vacType.equals("특별휴가"))
			{
				v.setVacType("VT4");
			}else if(vacType.equals("반가"))
			{
				v.setVacType("VT5");
			}else if(vacType.equals("연가"))
			{
				v.setVacType("VT1");
			}

			v.setEmpNo(empNo);
			v.setVacStartDate(vacStartDate);
			v.setVacEndDate(vacEndDate);
			v.setVacReason(vacReason);


			System.out.println(v);

			int result = ps.insertvacation(v);

			ArrayList<MemberDepartment> deplist = ms.selectDepList();

			ArrayList<MemberJob> joblist = ms.selectJobList();

			ArrayList<MemberSelect> mlist = ms.selectAllMember();


			model.addAttribute("deplist", deplist);
			model.addAttribute("joblist", joblist);
			model.addAttribute("mlist", mlist);

			System.out.println("근태관리 입장");

			return "personManagement/vacation";
	}


	@RequestMapping("insertPromotion.pm")
	public String insertpromotion(Model model ,@RequestParam String userNo , @RequestParam String jobRecordDate, @RequestParam String jobReason,
			@RequestParam String jobCode){
		PromotionIn p = new PromotionIn();
		int empNo = Integer.parseInt(userNo);

		if(jobCode.equals("회장"))
		{
			jobCode = "J1";
			System.out.println(jobCode);
			p.setJobCode(jobCode);
		}else if(jobCode.equals("사장"))
		{
			jobCode ="J2";
			System.out.println(jobCode);
			p.setJobCode(jobCode);
		}else if(jobCode.equals("전무"))
		{
			jobCode ="J3";
			System.out.println(jobCode);
			p.setJobCode(jobCode);
		}else if(jobCode.equals("상무"))
		{
			jobCode ="J4";
			p.setJobCode(jobCode);
		}else if(jobCode.equals("부장"))
		{
			jobCode ="J5";
			p.setJobCode(jobCode);
		}else if(jobCode.equals("차장"))
		{
			jobCode ="J6";
			p.setJobCode(jobCode);
		}else if(jobCode.equals("과장"))
		{
			jobCode ="J7";
			p.setJobCode(jobCode);
		}else if(jobCode.equals("대리"))
		{
			jobCode ="J8";
			p.setJobCode(jobCode);
		}else if(jobCode.equals("주임"))
		{
				jobCode ="J9";
		p.setJobCode(jobCode);
		}else if(jobCode.equals("사원"))
		{
			jobCode ="J10";
			p.setJobCode(jobCode);
		}
		p.setEmpNo(empNo);
		p.setJobReason(jobReason);
		p.setJobRecordDate(jobRecordDate);


		System.out.println("프로모션 컨트롤  : " + p);

		int result = ps.insertpromotion(p);


		ArrayList<MemberDepartment> deplist = ms.selectDepList();

		ArrayList<MemberJob> joblist = ms.selectJobList();

		ArrayList<MemberSelect> mlist = ms.selectAllMember();

		model.addAttribute("deplist", deplist);
		model.addAttribute("joblist", joblist);
		model.addAttribute("mlist", mlist);



		return "personManagement/promotion";
	}


	@RequestMapping("depleaveList.pm")
	public @ResponseBody ArrayList<DepLeave> selectDepLeaveList(@RequestParam String depName){


		ArrayList<DepLeave> dlist = ps.selectDepLeaveList(depName);

		System.out.println(dlist);


		return dlist;
	}

	@RequestMapping("depleavedayList.pm")
	public @ResponseBody ArrayList<DepLeave> depLeavedayList(@RequestParam String day,@RequestParam String depName,@RequestParam String year){


		ArrayList<DepLeave> list = ps.selectDepLeavedayList(day ,depName , year);

		System.out.println(list);


		return list;
	}

	@RequestMapping("depmoveDeptRecord.pm")
	public String movedepmoveDeptRecord(Model model){

		ArrayList<MemberSelect> mlist = ms.selectAllMember();
		ArrayList<MemberDepartment> deplist = ms.selectDepList();

		model.addAttribute("deplist", deplist);
		model.addAttribute("mlist", mlist);

		return "personManagement/depMovedept";
	}


	@RequestMapping("depMoveList.pm")
	public @ResponseBody ArrayList<DepMoveDepRecord> selectDepMoveList(@RequestParam String depName){


		ArrayList<DepMoveDepRecord> dlist = ps.selectDepmoveList(depName);

		System.out.println(dlist);


		return dlist;
	}

	@RequestMapping("depMovedayList.pm")
	public @ResponseBody ArrayList<DepMoveDepRecord> depMovedayList(@RequestParam String day,@RequestParam String depName,@RequestParam String year){


		ArrayList<DepMoveDepRecord> list = ps.selectDepMovedayList(day ,depName , year);

		System.out.println(list);


		return list;
	}

	@RequestMapping("depMoveEmpNoList.pm")
	public @ResponseBody ArrayList<DepMoveDepRecord> depMoveEmpNoList(@RequestParam int empNo){


		ArrayList<DepMoveDepRecord> list = ps.selectDepMoveEmpNoList(empNo);

		System.out.println(list);


		return list;
	}

}
