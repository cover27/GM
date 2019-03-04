package com.spring.gm.controller;


import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gm.service.J_ServiceImpl;
import com.spring.gm.vo.MemberVO;
import com.sun.jmx.snmp.Timestamp;

@Controller
public class J_Controller {
	private static final Logger logger = LoggerFactory.getLogger(J_Controller.class);
	private static final String Timestamp = null;
	@Autowired
	J_ServiceImpl service;

	// 급여기본정보관리(Salary Default Setting)
	@RequestMapping("/admin/J_SalaryDefaultSetting")
	public String J_SalaryDefaultSetting(HttpServletRequest req, Model model) {
		int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
		model.addAttribute("sys_rank",sys_rank);
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
		int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
		model.addAttribute("sys_rank",sys_rank);
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

	//급여등록(Payroll Registration)
	@RequestMapping("admin/J_PayrollRegistration")
	public String J_PayrollRegistration(HttpServletRequest req, Model model) {
		int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
		model.addAttribute("sys_rank",sys_rank);
		logger.info("URL : J_PayrollRegistration");
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
				model.addAttribute("cnt",-1);
				return "admin/sub/J_PayrollRegistrationInsertPro_sub";
			}
		}
		return "admin/J_PayrollRegistration";
	}

	// 급여 계산 (Salary Calculation)
	@RequestMapping("/admin/J_SalaryCalculation")
	public String J_SalaryCalculation(HttpServletRequest req, Model model) {
		int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
		model.addAttribute("sys_rank",sys_rank);
		logger.info("URL : admin/J_SalaryCalculation");

		return "admin/J_SalaryCalculation";
	}

	// 급여 조회(Payroll Inquiry)
	@RequestMapping("/pages/J_PayrollInquiry")
	public String J_PayrollInquiry(HttpServletRequest req, Model model) {
		int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
		String id = ((MemberVO) req.getSession().getAttribute("loginInfo")).getId();
		String name = ((MemberVO) req.getSession().getAttribute("loginInfo")).getName();
		model.addAttribute("sys_rank",sys_rank);
		model.addAttribute("id",id);
		model.addAttribute("name",name);
		
		
		
		logger.info("URL : J_PayrollInquiry");
		service.companyName(req, model);
		return "pages/J_PayrollInquiry";
	}

	// 상여 계산(Bonus Calculation)
	@RequestMapping("/admin/J_BonusCalculation")
	public String J_BonusCalculation(HttpServletRequest req, Model model) {
		int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
		model.addAttribute("sys_rank",sys_rank);
		logger.info("URL : admin/J_BonusCalculation");

		return "admin/J_BonusCalculation";
	}

	// 상여 조회(Bonus Inquiry)
	@RequestMapping("/pages/J_BonusInquiry")
	public String J_BonusInquiry(HttpServletRequest req, Model model) {
		int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
		String id = ((MemberVO) req.getSession().getAttribute("loginInfo")).getId();
		String name = ((MemberVO) req.getSession().getAttribute("loginInfo")).getName();
		model.addAttribute("sys_rank",sys_rank);
		model.addAttribute("id",id);
		model.addAttribute("name",name);
		
		
		logger.info("URL : J_BonusInquiry");
		service.companyName(req, model);
		return "pages/J_BonusInquiry";
	}

	// 급여 대장(Payroll)
	@RequestMapping("/admin/J_Payroll")
	public String J_Payroll(HttpServletRequest req, Model model) {
		int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
		model.addAttribute("sys_rank",sys_rank);
		logger.info("URL : J_Payroll");
		service.companyName(req, model);
		
		return "admin/J_Payroll";
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
	
	// 개인 급여등록(이번달 목록 가져오기)
	@RequestMapping("/admin/J_PayrollRegistrationList")
	public String J_PayrollRegistrationList(HttpServletRequest req, Model model) {
		logger.info("URL : J_PayrollRegistrationList");
		service.J_PayrollRegistrationList(req,model);
		return "admin/sub/J_sub/J_PayrollRegistrationList_sub";
	}
	// 개인 급여등록
	@RequestMapping("/admin/J_PayrollRegistrationInsert")
	public String J_PayrollRegistrationInsert(HttpServletRequest req, Model model) {
		logger.info("URL : J_PayrollRegistrationInsert");
		service.J_PayrollRegistrationInsert(req,model);
		return "admin/sub/J_sub/J_PayrollRegistrationList_sub";
	}
	//미지급 -> 지급으로 처리
	@RequestMapping("/admin/J_PayrollRegistrationchange")
	public String J_PayrollRegistrationchange(HttpServletRequest req, Model model) {
		logger.info("URL : J_PayrollRegistrationchange");
		service.J_PayrollRegistrationchange(req,model);
		return "admin/sub/J_sub/J_PayrollRegistrationList_sub";
	}
	//정보 삭제
	@RequestMapping("/admin/J_PayrollRegistrationListDelete")
	public String J_PayrollRegistrationListDelete(HttpServletRequest req, Model model) {
		logger.info("URL : J_PayrollRegistrationListDelete");
		service.J_PayrollRegistrationListDelete(req,model);
		return "admin/sub/J_sub/J_PayrollRegistrationList_sub";
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
	
	//-----------------------상여급여 조회------------------------------------
	// 상여 조회(아이디 검색 정보 가져오기)
	@RequestMapping("/pages/J_searchId_sub")
	public String searchId(HttpServletRequest req, Model model) {
		logger.info("URL : searchId_sub");
		String id = req.getParameter("id");
		System.out.println("id = " + id);
		if(id.length() == 0) {
			System.out.println("1");
			service.salaryList(req, model);
		}else {
			System.out.println("2");
			service.searchId(req, model);
		}
		model.addAttribute("id",id);
		return "pages/sub/J_sub/J_searchId_sub";
	}
	//검색 결과값으로 정보 가져오기
	@RequestMapping("/pages/searchPayrollInquiry")
	public String searchPayrollInquiry(HttpServletRequest req, Model model) {
		System.out.println("searchPayrollInquiry");
		logger.info("URL : searchPayrollInquiry");
		service.searchPayrollInquiry(req, model);
		return "pages/sub/J_sub/J_PayrollInquiry_sub";
	}
	
	//상여 조회
	@RequestMapping("/pages/searchBonusInquiry")
	public String searchBonusInquiry(HttpServletRequest req, Model model) {
		String id = ((MemberVO) req.getSession().getAttribute("loginInfo")).getId();
		System.out.println("id : " + id);
		logger.info("URL : searchBonusInquiry");
		service.searchBonusInquiry(req, model);
		return "pages/sub/J_sub/J_searchBonusInquiry_sub";
	}
	
	//-----------------------급여 계산------------------------------------
	//급여 계산 목록 가져오기
	@RequestMapping("/admin/J_SalaryCalculationSearch")
	public String J_SalaryCalculationSearch(HttpServletRequest req, Model model) {
		logger.info("URL : J_SalaryCalculationSearch");
		service.J_SalaryCalculationSearch(req, model);
		return "admin/sub/J_sub/J_SalaryCalculation_sub";
	}
	
	//-----------------------급여 대장------------------------------------
	@RequestMapping("/admin/searchPayroll")
	public String searchPayroll(HttpServletRequest req, Model model) {
		logger.info("URL : searchPayroll");
		service.searchPayroll(req, model);
		return "admin/sub/J_sub/J_Payroll_sub";
	}
	@RequestMapping("/admin/searchPayroll2")
	public String searchPayroll2(HttpServletRequest req, Model model) {
		logger.info("URL : searchPayroll2");
		service.searchPayroll2(req, model);
		return "admin/sub/J_sub/J_Payroll_sub";
	}
	@RequestMapping("/admin/searchPayroll3")
	public String searchPayroll3(HttpServletRequest req, Model model) {
		logger.info("URL : searchPayroll3");
		service.searchPayroll3(req, model);
		return "admin/sub/J_sub/J_Payroll_sub";
	}
	
	//년도별 검색
	@RequestMapping("/admin/yearPayroll")
	public String yearPayroll(HttpServletRequest req, Model model) {
		logger.info("URL : yearPayroll");
		service.yearPayroll(req, model);
		return "admin/sub/J_sub/yearPayroll_sub";
	}
	
	
	
	
	
	// 상여 조회(아이디 검색 정보 가져오기)
		@RequestMapping("/admin/J_searchId_sub")
		public String searchId2(HttpServletRequest req, Model model) {
			logger.info("URL : searchId_sub");
			String id = req.getParameter("id");
			System.out.println("id = " + id);
			if(id.length() == 0) {
				System.out.println("1");
				service.salaryList(req, model);
			}else {
				System.out.println("2");
				service.searchId(req, model);
			}
			model.addAttribute("id",id);
			return "admin/sub/J_sub/J_searchId_sub";
		}
	//야간/연장 근무 수당 보기
		@RequestMapping("/admin/showONtime")
		public String showONtime(HttpServletRequest req, Model model) {
			logger.info("URL : searchId_sub");
			service.showONtime(req, model);
			return "admin/sub/J_sub/J_showONtime";
		}
		//야간/연장 근무 수당 상여금에 미지급으로 인서트
		@RequestMapping("/admin/insertONtime")
		public String insertONtime(HttpServletRequest req, Model model) {
			logger.info("URL : insertONtime");
			service.insertONtime(req, model);
			return "admin/sub/J_sub/J_showONtime";
		}
		
		
		
		
		
		
		
		
		
		
		//--------------------------------------------------------------------------------------------------------------------------
		//---------------------------------------------근태관리------------------------------------------------------------------------
		
		
		
		//일일 근태 등록
		@RequestMapping("/pages/J_D_attendanceRegistration")
		public String J_D_attendanceRegistration(HttpServletRequest req, Model model) {
			int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
			model.addAttribute("sys_rank",sys_rank);
			logger.info("URL : J_D_attendanceRegistration");
			service.GoOffList(req,model);
			return "pages/J_D_attendanceRegistration";
		}
		//날짜로 일일 근태 조회
		@RequestMapping("/pages/searchList")
		public String searchList(HttpServletRequest req, Model model) {
			int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
			model.addAttribute("sys_rank",sys_rank);
			logger.info("URL : J_D_attendanceRegistration");
			service.searchList(req,model);
			return "pages/sub/J_sub/J_D_attendanceRegistration_sub";
		}
		//근태 관리
		@RequestMapping("/admin/J_A_management")
		public String J_A_management(HttpServletRequest req, Model model) {
			int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
			model.addAttribute("sys_rank",sys_rank);
			System.out.println("/admin/J_A_management");
			logger.info("URL : J_A_management");
			service.allList(req,model);
			return "admin/J_A_management";
		}
		//휴가승인목록 확인
		@RequestMapping("/admin/vacationList")
		public String vacationList(HttpServletRequest req, Model model) {
			System.out.println("/admin/J_A_management");
			logger.info("URL : J_A_management");
			service.vacationList(req,model);
			return "admin/sub/J_sub/vacationList_sub";
		}
		//휴가승인 확인후근태 처리
		@RequestMapping("/admin/managementInsert")
		public String managementInsert(HttpServletRequest req, Model model) throws ParseException {
			System.out.println("/admin/managementInsert");
			logger.info("URL : managementInsert");
			service.managementInsert(req,model);
			return "admin/sub/J_sub/vacationList_sub";
		}
		
		
		
		
		
		
		
		
		//월 근태 현황
		@RequestMapping("/pages/J_M_attendanceStatus")
		public String J_M_attendanceStatus(HttpServletRequest req, Model model) {
			int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
			model.addAttribute("sys_rank",sys_rank);
			service.companyName(req, model);
			service.monthList(req,model);
			logger.info("URL : J_M_attendanceStatus");
			return "pages/J_M_attendanceStatus";
		}
		//월 근태 현황(전체사원뽑기)
		@RequestMapping("/pages/J_M_attendanceStatus2")
		public String J_M_attendanceStatus2(HttpServletRequest req, Model model) {
			int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
			model.addAttribute("sys_rank",sys_rank);
			service.companyName(req, model);
			service.monthList2(req,model);
			logger.info("URL : J_M_attendanceStatus2");
			return "pages/J_M_attendanceStatus";
		}
		
		//휴일/연장/야간근무 조회
		@RequestMapping("/admin/J_Lookup")
		public String J_Lookup(HttpServletRequest req, Model model) {
			int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
			model.addAttribute("sys_rank",sys_rank);
			service.companyName(req, model);
			logger.info("URL : J_Lookup");
			return "admin/J_Lookup";
		}
		
		//휴가일수 설정
		@RequestMapping("/admin/J_SetHoliday")
		public String J_SetHoliday(HttpServletRequest req, Model model) {
			int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
			model.addAttribute("sys_rank",sys_rank);
			logger.info("URL : J_SetHoliday");
			return "admin/J_SetHoliday";
		}
		
		
		
		
		//연차/휴가일수 조회
		@RequestMapping("/pages/J_CalculationHoliday")
		public String J_CalculationHoliday(HttpServletRequest req, Model model) {
			int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
			System.out.println("sys_rank" + sys_rank);
			String name = ((MemberVO) req.getSession().getAttribute("loginInfo")).getName();
			String id = ((MemberVO) req.getSession().getAttribute("loginInfo")).getId();
			model.addAttribute("sys_rank",sys_rank);
			model.addAttribute("name",name);
			model.addAttribute("id",id);
			service.companyName(req, model);
			logger.info("URL : J_CalculationHoliday");
			return "pages/J_CalculationHoliday";
		}
		//휴가신청
		@RequestMapping("/pages/J_ApplyHoliday")
		public String J_ApplyHoliday(HttpServletRequest req, Model model) {
			int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
			model.addAttribute("sys_rank",sys_rank);
			logger.info("URL : J_ApplyHoliday");
			service.companyName(req, model);
			service.vacationapplication(req, model);
			return "pages/J_ApplyHoliday";
		}
		//휴가 사용현황
		@RequestMapping("/pages/J_UseHoliday")
		public String J_UseHoliday(HttpServletRequest req, Model model) {
			int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
			String name = ((MemberVO) req.getSession().getAttribute("loginInfo")).getName();
			String id = ((MemberVO) req.getSession().getAttribute("loginInfo")).getId();
			model.addAttribute("sys_rank",sys_rank);
			model.addAttribute("name",name);
			model.addAttribute("id",id);
			model.addAttribute("cnt",0);
			model.addAttribute("cnt2",0);
			service.companyName(req, model);
			logger.info("URL : J_UseHoliday");
			return "pages/J_UseHoliday";
		}
		//아이디 검색 휴가사용 현황
		@RequestMapping("/pages/vacationUH")
		public String vacationUH(HttpServletRequest req, Model model) {
			int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
			model.addAttribute("sys_rank",sys_rank);
			service.companyName(req, model);
			service.vacationUH(req,model);
			logger.info("URL : vacationUH");
			return "pages/J_UseHoliday";
		}
		//이버년년도 검색 휴가사용 현황(관리자)
		@RequestMapping("/pages/vacationUH2")
		public String vacationUH2(HttpServletRequest req, Model model) {
			int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
			model.addAttribute("sys_rank",sys_rank);
			service.companyName(req, model);
			service.vacationUH2(req,model);
			logger.info("URL : vacationUH2");
			return "pages/J_UseHoliday";
		}
		
		
		//출근시간 인서트
		@RequestMapping("/pages/goInsert")
		public String goInsert(HttpServletRequest req, Model model) {
			logger.info("URL : goInsert");
			service.goInsert(req,model);
			return "pages/sub/J_sub/J_D_attendanceRegistration_sub";
		}
		//퇴근시간 업데이트
		@RequestMapping("/pages/offUpdate")
		public String offUpdate(HttpServletRequest req, Model model) {
			logger.info("URL : offUpdate");
			service.offUpdate(req,model);
			return "pages/sub/J_sub/J_D_attendanceRegistration_sub";
		}
		// 개인 
		@RequestMapping("/pages/List")
		public String List(HttpServletRequest req, Model model) {
			System.out.println("/admin/List");
			logger.info("URL : offUpdate");
			service.GoOffList(req,model);
			return "pages/sub/J_sub/J_D_attendanceRegistration_sub";
		}
		
		//사원 근태 수정
		@RequestMapping("/admin/modify")
		public String modify(HttpServletRequest req, Model model) {
			System.out.println("/admin/modify");
			logger.info("URL : modify");
			service.modify(req,model);
			return "admin/sub/J_sub/J_modify_sub";
		}
		//사원 근태 삭제
		@RequestMapping("/admin/deleteAttended")
		public String deleteAttended(HttpServletRequest req, Model model) {
			System.out.println("/admin/deleteAttended");
			logger.info("URL : deleteAttended");
			service.deleteAttended(req,model);
			return "admin/J_A_management";
		}
		// 근태 수정 업데이트
		@RequestMapping("/admin/modifyUpdate")
		public String modifyUpdate(HttpServletRequest req, Model model) {
			int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
			model.addAttribute("sys_rank",sys_rank);
			System.out.println("/admin/modifyUpdate");
			logger.info("URL : modifyUpdate");
			service.modifyUpdate(req,model);
			return "admin/J_A_management";
		}
		//휴가 목록 뽑아오기
		@RequestMapping("/admin/holiday")
		public String holiday(HttpServletRequest req, Model model) {
			System.out.println("/admin/holiday");
			logger.info("URL : holiday");
			service.holiday(req,model);
			return "admin/sub/J_sub/holiday";
		}
		//연장근무 목록 뽑아오기
		@RequestMapping("/admin/overtime")
		public String overtime(HttpServletRequest req, Model model) {
			System.out.println("/admin/overtime");
			logger.info("URL : overtime");
			service.overtime(req,model);
			return "admin/sub/J_sub/overtime";
		}
		//야간 목록 뽑아오기
		@RequestMapping("/admin/nighttime")
		public String nighttime(HttpServletRequest req, Model model) {
			System.out.println("/admin/nighttime");
			logger.info("URL : nighttime");
			service.nighttime(req,model);
			return "admin/sub/J_sub/nighttime";
		}
		
		
		//연차/휴가일수 조회
		@RequestMapping("/pages/VacationViews")
		public String VacationViews(HttpServletRequest req, Model model) {
			int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
			model.addAttribute("sys_rank",sys_rank);
			System.out.println("/pages/VacationViews");
			logger.info("URL : nighttime");
			service.VacationViews(req,model);
			return "pages/sub/J_sub/VacationViews_sub";
		}
		//연차/휴가일수 조회 전체보기
		@RequestMapping("/pages/VacationViews2")
		public String VacationViews2(HttpServletRequest req, Model model) {
			int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
			model.addAttribute("sys_rank",sys_rank);
			System.out.println("/pages/VacationViews2");
			logger.info("URL : nighttime");
			service.VacationViews2(req,model);
			return "pages/sub/J_sub/VacationViews_sub";
		}
		
		
		//휴가 신청하기
		@RequestMapping("/pages/leaveapplication")
		public String leaveapplication(HttpServletRequest req, Model model) {
			int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
			model.addAttribute("sys_rank",sys_rank);
			logger.info("URL : leaveapplication");
			service.companyName(req, model);
			service.leaveapplication(req, model);
			return "pages/J_ApplyHoliday";
		}
		//휴가 신청취소하기
		@RequestMapping("/pages/cancelapplication")
		public String cancelapplication(HttpServletRequest req, Model model) {
			int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
			model.addAttribute("sys_rank",sys_rank);
			logger.info("URL : cancelapplication");
			service.companyName(req, model);
			service.cancelapplication(req, model);
			return "pages/J_ApplyHoliday";
		}
		
		
		//=====================================MyInfo===================================================================
		//내정보
		@RequestMapping("/pages/J_MyInfo")
		public String J_Myinfo(HttpServletRequest req, Model model) {
			logger.info("URL : J_Myinfo");
			service.myinfo(req, model);
			return "pages/J_MyInfo";
		}
		// 회원탈퇴
		@RequestMapping("/pages/J_Withdrawal")
		public String J_Withdrawal(HttpServletRequest req, Model model) {
			logger.info("URL : J_Withdrawal");
			service.J_Withdrawal(req, model);
			
			
			return "pages/sub/J_Withdrawal_sub";
		}
		//수정할 창 보여주기
		@RequestMapping("/pages/J_ModifyInfo")
		public String J_ModifyInfo(HttpServletRequest req, Model model) {
			logger.info("URL : J_ModifyInfo");
			service.myinfo(req, model);
			return "pages/J_ModifyInfo";
		}
		//수정내용 업데이트 하기
		@RequestMapping("/pages/myinfoModifyUpdate")
		public String myinfoModifyUpdate(HttpServletRequest req, Model model) {
			logger.info("URL : myinfoModifyUpdate");
			service.myinfoModifyUpdate(req, model);
			return "pages/J_MyInfo";
		}
}
