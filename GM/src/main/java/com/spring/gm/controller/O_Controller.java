package com.spring.gm.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gm.service.J_Service;
import com.spring.gm.service.O_Service;
import com.spring.gm.vo.MemberVO;

@Controller
public class O_Controller {

	private static final Logger logger = LoggerFactory.getLogger(O_Controller.class);	
	
	//오정 service
	@Autowired
	O_Service oservice;
	
	//경준 service
	@Autowired
	J_Service jservice;
	
	
	/* 업무관리 시작 */	
	//업무 요청 - 업무관리 클릭 화면 및 수신업무 요청 화면
	@RequestMapping("/pages/O_listTodoView")
	public String O_listTodoView(HttpServletRequest req, Model model) {
		int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
		model.addAttribute("sys_rank",sys_rank);
		logger.info("URL : O_listTodoView");
		
		return "pages/O_listTodoView";
	}
	
	//업무요청 - 수신 업무 요청 조회 
	@RequestMapping("/pages/O_readSubTodoView")
	public String O_readSubTodoView(HttpServletRequest req, Model model) {
		logger.info("URL : O_readSubTodoView");
		
		
		return "pages/O_readSubTodoView";
	}
	
	//TO-DO - 나의 할일 화면
	@RequestMapping("/pages/O_listMyTodoView")
	public String O_listMyTodoView(HttpServletRequest req, Model model) {
		int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
		model.addAttribute("sys_rank",sys_rank);
		logger.info("URL : O_listMyTodoView");
		
		return "pages/O_listMyTodoView";
	}
	
	//업무 등록 화면
	@RequestMapping("/pages/O_createSelfTaskView")
	public String O_createSelfTaskView(HttpServletRequest req, Model model) {
		int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
		String id = ((MemberVO) req.getSession().getAttribute("loginInfo")).getId();
		model.addAttribute("sys_rank",sys_rank);
		model.addAttribute("id", id);
		logger.info("URL : O_createSelfTaskView");
		
		oservice.createSelfTaskWrite(req, model);
		jservice.companyName(req, model);
		
		return "pages/O_createSelfTaskView";
	}
	
	//업무 등록 insert
	@RequestMapping("/pages/O_createSelfTaskPro")
	public String O_createSelfTaskPro(HttpServletRequest req, Model model) {
		logger.info("URL : O_createSelfTaskPro");
		
		oservice.createSelfTaskPro(req, model);
		
		return "pages/O_createSelfTaskPro";
	}
	
	//업무 요청 - 내가 한 업무요청 화면
	@RequestMapping("/pages/O_listPureOrderView")
	public String O_listPureOrderView(HttpServletRequest req, Model model) {
		int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
		model.addAttribute("sys_rank",sys_rank);
		logger.info("URL : O_listPureOrderView");
		
		oservice.orderList(req, model);
		
		return "pages/O_listPureOrderView";
	}
	
	//업무요청 - 내가 한 업무요청 상세 조회 화면
	@RequestMapping("/pages/O_readOrderView")
	public String O_readOrderView(HttpServletRequest req, Model model) {
		logger.info("URL : O_readOrderView");
		
		oservice.readOrderList(req, model);
		
		return "pages/O_readOrderView";
	}
	
	//업무요청 - 업무요청 수정 화면
	@RequestMapping("/pages/O_updateTaskView")
	public String O_updateTaskView(HttpServletRequest req, Model model) {
		logger.info("URL : O_updateTaskView");
		
		oservice.updateTaskView(req, model);
		
		return "pages/O_updateTaskView";
	}
	
	//업무요청 - 업무요청 수정 Pro
	@RequestMapping("/pages/O_updateTaskPro")
	public String O_updateTaskPro(HttpServletRequest req, Model model) {
		logger.info("URL : O_updateTaskPro");
		
		oservice.updateTaskPro(req, model);
		
		return "pages/O_updateTaskPro";
	}
	
	//업무요청 - 업무요청 삭제 Pro
	@RequestMapping("/pages/O_updateTaskDeletePro")
	public String O_updateTaskDeletePro(HttpServletRequest req, Model model) {
		logger.info("URL : O_updateTaskDeletePro");
		
		oservice.updateTaskDeletePro(req, model);
		
		return "pages/O_updateTaskDeletePro";
	}
	
	//업무 요청 - 업무완료함
	@RequestMapping("/pages/O_listTodoReportView")
	public String O_listTodoReportView(HttpServletRequest req, Model model) {
		int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
		model.addAttribute("sys_rank",sys_rank);
		logger.info("URL : O_listTodoReportView");
		
		return "pages/O_listTodoReportView";
	}
	
	//관리자 메뉴 - 업무 문서 관리
	@RequestMapping("/admin/O_listAdminDocManagement")
	public String O_listAdminDocManagement(HttpServletRequest req, Model model) {
		int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
		model.addAttribute("sys_rank",sys_rank);
		logger.info("URL : O_listAdminDocManagement");
		
		return "admin/O_listAdminDocManagement";
	}
	/* 업무 관리 끝 */
	
	
	//검색조회
	@RequestMapping("/pages/O_searchId_sub")
	public String searchIdPlease(HttpServletRequest req, Model model) {
		logger.info("URL : searchId_sub");
		String id = req.getParameter("id");
		System.out.println("id = " + id);
		if(id.length() == 0) {
			System.out.println("1");
			jservice.salaryList(req, model);
		}else {
			System.out.println("2");
			jservice.searchId(req, model);
		}
		model.addAttribute("id",id);
		return "pages/sub/O_header/O_searchId_sub";
	}
	
	
	
	/* 일정 시작 */
	//일정 화면
	@RequestMapping("/pages/O_calendar")
	public String O_calendar(HttpServletRequest req, Model model) {
		logger.info("URL : O_calendar");
		
		oservice.calendarSelect(req, model);
		
		return "pages/O_calendar";
	}
	
	//일정 등록
	@RequestMapping("/pages/O_calendarCreateView")
	public String O_calendarCreateView(HttpServletRequest req, Model model) {
		logger.info("URL : O_calendarCreateView");
	
		oservice.calendarWrite(req, model);
		
		return "pages/O_calendarCreateView";
	}
	
	//일정 등록 pro
	
	@RequestMapping("/pages/O_calendarPro")
	public String O_calendarPro(HttpServletRequest req, Model model) {
		logger.info("URL : O_calendarPro");
		
		oservice.calendarPro(req, model);
		
		return "pages/O_calendarPro";
	}
	
	//일정 상세 화면
	@RequestMapping("/pages/O_calendarDetail")
	public String O_calendarDetail(HttpServletRequest req, Model model) {
		logger.info("URL : O_calendarDetail");
		
		oservice.calendarDetail(req, model);
		
		return "pages/O_calendarDetail";
	}
	
	//일정 수정
	@RequestMapping("/pages/O_calendarModify")
	public String O_calendarModify(HttpServletRequest req, Model model) {
		logger.info("URL : O_calendarDetail");
		
		oservice.calendarModify(req, model);
		
		return "pages/O_calendarModify";
	}
	
	//일정 삭제
	@RequestMapping("/pages/O_calendarDelete")
	public String O_calendarDelete(HttpServletRequest req, Model model) {
		logger.info("URL : O_calendarDelete");
		
		oservice.calendarDelete(req, model);
		
		return "pages/O_calendarDelete";
	}
	/* 일정 끝 */
	
}
