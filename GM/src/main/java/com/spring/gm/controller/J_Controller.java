package com.spring.gm.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class J_Controller {
	private static final Logger logger = LoggerFactory.getLogger(J_Controller.class);
	
	// 급여기본정보관리(Salary Default Setting)
	@RequestMapping("/salaryDefaultSetting")
	public String SalaryDefaultSetting(HttpServletRequest request, Model model) {
		logger.info("URL : SalaryDefaultSetting");
		
		return "pages/J_SalaryDefaultSetting";
	}
	//기본수당 외 수당 관리(Basic Allowance Management)
	@RequestMapping("/BasicAllowanceManagement")
	public String BasicAllowanceManagement(HttpServletRequest request, Model model) {
		logger.info("URL : BasicAllowanceManagement");
		
		return "pages/J_BasicAllowanceManagement";
	}
	// 근태/급여/상여/연차 마감관리(Time & Attendance Salary Bonus Annual)
	@RequestMapping("/TimeAttendanceSalaryBonusAnnual")
	public String TimeAttendanceSalaryBonusAnnual(HttpServletRequest request, Model model) {
		logger.info("URL : TimeAttendanceSalaryBonusAnnual");
		
		return "pages/J_TimeAttendanceSalaryBonusAnnual";
	}
	//급여 계산 (Salary Calculation)
	@RequestMapping("/SalaryCalculation")
	public String SalaryCalculation(HttpServletRequest request, Model model) {
		logger.info("URL : SalaryCalculation");
		
		return "pages/J_SalaryCalculation";
	}
	//급여 조회(Payroll Inquiry)
	@RequestMapping("/PayrollInquiry")
	public String PayrollInquiry(HttpServletRequest request, Model model) {
		logger.info("URL : PayrollInquiry");
		
		return "pages/J_PayrollInquiry";
	}
	//상여 계산(Bonus Calculation)
	@RequestMapping("/BonusCalculation")
	public String BonusCalculation(HttpServletRequest request, Model model) {
		logger.info("URL : BonusCalculation");
		
		return "pages/J_BonusCalculation";
	}
	//상여 조회(Bonus Inquiry)
	@RequestMapping("/BonusInquiry")
	public String BonusInquiry(HttpServletRequest request, Model model) {
		logger.info("URL : BonusInquiry");
		
		return "pages/J_BonusInquiry";
	}
	//급여 대장(Payroll)
	@RequestMapping("/Payroll")
	public String Payroll(HttpServletRequest request, Model model) {
		logger.info("URL : Payroll");
		
		return "pages/J_Payroll";
	}
}
