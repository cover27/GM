package com.spring.gm.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gm.service.J_ServiceImpl;


@Controller
public class J_Controller {
	private static final Logger logger = LoggerFactory.getLogger(J_Controller.class);
	@Autowired
	J_ServiceImpl service;
	
	// 급여기본정보관리(Salary Default Setting)
	@RequestMapping("/admin/J_SalaryDefaultSetting")
	public String J_SalaryDefaultSetting(HttpServletRequest req, Model model) {
		
		logger.info("URL : admin/J_SalaryDefaultSetting");
		String title = req.getParameter("search_title");
		String content = req.getParameter("search_content");
		if((title == null && content == null) || title.equals("allList")  ) {	// 검색 안했을 경우
			System.out.println("검색 안했을 경우");
			service.salaryList(req, model);
		}else if(title != null){	// 검색 했을경우
			if(title != null && content.length() > 0) {
				System.out.println("검색 했을 경우") ;
				service.search_salaryList(req, model);
			}else if(title != null && content.length() <= 0){
				System.out.println("검색 실패하였습니다. 확인해 주세여");
				return "admin/sub/J_SalaryDefaultSettingPro_sub";
			}
		}
		return "admin/J_SalaryDefaultSetting";
	}
		
	
	//기본수당 외 수당 관리(Basic Allowance Management)
	@RequestMapping("/admin/J_BasicAllowanceManagement")
	public String J_BasicAllowanceManagement(HttpServletRequest req, Model model) {
		logger.info("URL : admin/J_BasicAllowanceManagement");
		service.salaryList(req, model);
		return "admin/J_BasicAllowanceManagement";
	}
	// 근태/급여/상여/연차 마감관리(Time & Attendance Salary Bonus Annual)
	@RequestMapping("admin/J_TimeAttendanceSalaryBonusAnnual")
	public String J_TimeAttendanceSalaryBonusAnnual(HttpServletRequest req, Model model) {
		logger.info("URL : J_TimeAttendanceSalaryBonusAnnual");
		
		return "admin/J_TimeAttendanceSalaryBonusAnnual";
	}
	//급여 계산 (Salary Calculation)
	@RequestMapping("/admin/J_SalaryCalculation")
	public String J_SalaryCalculation(HttpServletRequest req, Model model) {
		logger.info("URL : admin/J_SalaryCalculation");
		
		return "admin/J_SalaryCalculation";
	}
	//급여 조회(Payroll Inquiry)
	@RequestMapping("/pages/J_PayrollInquiry")
	public String J_PayrollInquiry(HttpServletRequest req, Model model) {
		logger.info("URL : J_PayrollInquiry");
		
		return "pages/J_PayrollInquiry";
	}
	//상여 계산(Bonus Calculation)
	@RequestMapping("/admin/J_BonusCalculation")
	public String J_BonusCalculation(HttpServletRequest req, Model model) {
		logger.info("URL : admin/J_BonusCalculation");
		
		return "admin/J_BonusCalculation";
	}
	//상여 조회(Bonus Inquiry)
	@RequestMapping("/pages/J_BonusInquiry")
	public String J_BonusInquiry(HttpServletRequest req, Model model) {
		logger.info("URL : J_BonusInquiry");
		
		return "pages/J_BonusInquiry";
	}
	//급여 대장(Payroll)
	@RequestMapping("/pages/J_Payroll")
	public String J_Payroll(HttpServletRequest req, Model model) {
		logger.info("URL : J_Payroll");
		
		return "pages/J_Payroll";
	}
	
	//==================================================================
	
	//개인 급여정보 가져오기(Ajax)
	@RequestMapping("/admin/J_info")
	public String J_info(HttpServletRequest req, Model model) {
		logger.info("URL : J_info");
		service.infoList(req, model);
		System.out.println("J_info 탔습니다");
		return "admin/sub/J_sub/J_info";
	}
	//개인 급여정보 업데이트
	@RequestMapping("/admin/J_infoUpdate")
	public String J_infoUpdate(HttpServletRequest req, Model model) {
		logger.info("URL : J_infoUpdate");
		service.infoUpdate(req, model);
		System.out.println("J_infoUpdate 탔습니다");
		return "admin/sub/J_sub/J_infoUpdatePro_sub";
	}
	
	//================기본 수당 외 수당관리 서브==================================
	// 개인 급여수당정보 가져오기(Ajax)
	@RequestMapping("/admin/J_extrapayinfo")
	public String J_extrapayinfo(HttpServletRequest req, Model model) {
		logger.info("URL : J_extrapayinfo");
		String id = req.getParameter("id");
		System.out.println("id :" + id);
		service.J_extrapayinfo(req, model);
		System.out.println("J_extrapayinfo 탔습니다");
		return "admin/sub/J_sub/J_extrapayinfo";
	}
}
