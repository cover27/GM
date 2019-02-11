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
		if (content == null || title.equals("allList")) { // 검색 안했을 경우
			System.out.println("검색 안했을 경우");
			service.companyName(req, model);
			service.salaryList(req, model);
		} else if (content != null) { // 검색 했을경우
			if (content.length() > 0) {
				System.out.println("검색 했을 경우");
				service.search_salaryList(req, model);
			} else if (content.length() <= 0) {
				System.out.println("검색 실패하였습니다. 확인해 주세여");
				return "admin/sub/J_SalaryDefaultSettingPro_sub";
			}
		}
		return "admin/J_SalaryDefaultSetting";
	}

	// 기본수당 외 수당 관리(Basi/admin/c Allowance Management)
	@RequestMapping("/admin/J_BasicAllowanceManagement")
	public String J_BasicAllowanceManagement(HttpServletRequest req, Model model) {
		service.companyName(req, model);
		logger.info("URL : admin/J_BasicAllowanceManagement");
		String content = req.getParameter("search_content");
		System.out.println("content:" + content);
		String title2 = req.getParameter("search_title2");
		System.out.println("title2 :" + title2);
		String content2 = req.getParameter("search_content2");
		System.out.println("content2 :" + content2);
		if ((content == null && content2 == null)
				|| ((title2 == null || title2.equals("none")) && content.length() == 0)) { // 검색 안했을 경우
			System.out.println("검색 안했을 경우");
			service.salaryList(req, model);
		} else if ((title2 != null && content2 != null) || content != null) {
			System.out.println("검색 했을 경우");
			if (((title2.equals("none") || title2 == null) && (content2.length() > 0))
					|| (!title2.equals("none") && (content2.length() == 0))) {
				System.out.println("검색 조건이 맞지 않습니다.");
				model.addAttribute("cnt", -3);
				return "admin/sub/J_sub/J_salarySearchListPro_sub";
			} else if (title2.equals("depart")) { // 부서로 검색시
				System.out.println("depart");
				if (content.length() == 4 || content.length() == 6 || content.length() == 8) { // 날짜검색이 있을시
					System.out.println("1");
					service.salarySearchDepartList(req, model);
				} else if (content.length() == 0) {
					System.out.println("2");
					service.salarySearchNoneDepartList(req, model);
				} else {
					model.addAttribute("cnt", -3); // 날짜 검색이 없을시.
					return "admin/sub/J_sub/J_salarySearchListPro_sub";
				}
			} else if (title2.equals("id")) { // 아이디로 검색시
				System.out.println("id");
				if (content.length() == 4 || content.length() == 6 || content.length() == 8) {
					System.out.println("1");
					service.salarySearchIdList(req, model);
				} else if (content.length() == 0) {
					System.out.println("2");
					service.salarySearchNoneIdList(req, model);
				} else {
					model.addAttribute("cnt", -3);
					return "admin/sub/J_sub/J_salarySearchListPro_sub";
				}
			} else if ((title2 == null && content2 == null) || content.length() > 0) { // 날짜만 검색했을 경우
				System.out.println("3");
				service.salarySearchList(req, model);
			}
		}
		model.addAttribute("content", content);
		return "admin/J_BasicAllowanceManagement";
	}

	// 근태/급여/상여/연차 마감관리(Time & Attendance Salary Bonus Annual)
	@RequestMapping("admin/J_TimeAttendanceSalaryBonusAnnual")
	public String J_TimeAttendanceSalaryBonusAnnual(HttpServletRequest req, Model model) {
		logger.info("URL : J_TimeAttendanceSalaryBonusAnnual");

		return "admin/J_TimeAttendanceSalaryBonusAnnual";
	}

	// 급여 계산 (Salary Calculation)
	@RequestMapping("/admin/J_SalaryCalculation")
	public String J_SalaryCalculation(HttpServletRequest req, Model model) {
		logger.info("URL : admin/J_SalaryCalculation");

		return "admin/J_SalaryCalculation";
	}

	// 급여 조회(Payroll Inquiry)
	@RequestMapping("/pages/J_PayrollInquiry")
	public String J_PayrollInquiry(HttpServletRequest req, Model model) {
		logger.info("URL : J_PayrollInquiry");

		return "pages/J_PayrollInquiry";
	}

	// 상여 계산(Bonus Calculation)
	@RequestMapping("/admin/J_BonusCalculation")
	public String J_BonusCalculation(HttpServletRequest req, Model model) {
		logger.info("URL : admin/J_BonusCalculation");

		return "admin/J_BonusCalculation";
	}

	// 상여 조회(Bonus Inquiry)
	@RequestMapping("/pages/J_BonusInquiry")
	public String J_BonusInquiry(HttpServletRequest req, Model model) {
		logger.info("URL : J_BonusInquiry");

		return "pages/J_BonusInquiry";
	}

	// 급여 대장(Payroll)
	@RequestMapping("/pages/J_Payroll")
	public String J_Payroll(HttpServletRequest req, Model model) {
		logger.info("URL : J_Payroll");

		return "pages/J_Payroll";
	}

	// ==================================================================

	// 개인 급여정보 가져오기(Ajax)
	@RequestMapping("/admin/J_info")
	public String J_info(HttpServletRequest req, Model model) {
		logger.info("URL : J_info");
		service.infoList(req, model);
		System.out.println("J_info 탔습니다");
		return "admin/sub/J_sub/J_info";
	}

	// 개인 급여정보 업데이트
	@RequestMapping("/admin/J_infoUpdate")
	public String J_infoUpdate(HttpServletRequest req, Model model) {
		logger.info("URL : J_infoUpdate");
		service.infoUpdate(req, model);
		System.out.println("J_infoUpdate 탔습니다");
		return "admin/sub/J_sub/J_infoUpdatePro_sub";
	}

	// ================기본 수당 외 수당관리 서브==================================
	// 개인 급여수당정보 가져오기(Ajax) - 이번달
	@RequestMapping("/admin/J_extrapayinfo")
	public String J_extrapayinfo(HttpServletRequest req, Model model) {
		logger.info("URL : J_extrapayinfo");
		service.J_extrapayinfo(req, model);
		return "admin/sub/J_sub/J_extrapayinfo";
	}

	// 개인 급여수당정보 가져오기(Ajax) - 날짜 검색
	@RequestMapping("/admin/J_extrapayinfo2")
	public String J_extrapayinfo2(HttpServletRequest req, Model model) {
		logger.info("URL : J_extrapayinfo2");
		service.J_extrapayinfo2(req, model);
		return "admin/sub/J_sub/J_extrapayinfo";
	}

	// 개인 급여수당정보 업데이트
	@RequestMapping("/admin/J_extrapayinfoUpdate")
	public String J_extrapayinfoUpdate(HttpServletRequest req, Model model) {
		logger.info("URL : J_extrapayinfoUpdate");
		service.J_extrapayinfoUpdate(req, model);
		return "admin/sub/J_sub/J_extrapayinfoUpdatePro_sub";
	}
	// 개인 급여수당정보 수정
	@RequestMapping("/admin/J_ExtrapayInfoModified")
	public String J_ExtrapayInfoModified(HttpServletRequest req, Model model) {
		logger.info("URL : J_ExtrapayInfoModified");
		service.J_ExtrapayInfoModified(req, model);
		return "admin/sub/J_sub/J_ExtrapayInfoModified";
	}
	// 개인 급여수당정보 수정완료
	@RequestMapping("/admin/J_ExtrapayInfoModifiedComplete")
	public String J_ExtrapayInfoModifiedComplete(HttpServletRequest req, Model model) {
		logger.info("URL : J_ExtrapayInfoModifiedComplete");
		service.J_ExtrapayInfoModifiedComplete(req, model);
		return "admin/sub/J_sub/J_extrapayinfo";
	}
	// 개인 급여수당정보 삭제하기
	@RequestMapping("/admin/deleteInfo")
	public String deleteInfo(HttpServletRequest req, Model model) {
		logger.info("URL : deleteInfo");
		service.deleteInfo(req, model);
		return "admin/sub/J_sub/J_extrapayinfo";
	}
}
