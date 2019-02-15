package com.spring.gm.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gm.service.O_Service;

@Controller
public class O_Controller {

	private static final Logger logger = LoggerFactory.getLogger(O_Controller.class);	
	
	//오정 service
	@Autowired
	O_Service oservice;
	
	
	/* 업무관리 시작 */	
	
	//업무 요청 - 업무관리 클릭 화면 및 수신업무 요청 화면
	@RequestMapping("/pages/O_listTodoView")
	public String O_listTodoView(HttpServletRequest req, Model model) {
		logger.info("URL : O_listTodoView");
		
		return "pages/O_listTodoView";
	}
	
	//업무 등록 화면
	@RequestMapping("/pages/O_createSelfTaskView")
	public String O_createSelfTaskView(HttpServletRequest req, Model model) {
		logger.info("URL : O_createSelfTaskView");
		
		return "pages/O_createSelfTaskView";
	}
	
	//TO DO - 나의 할 일 화면
	@RequestMapping("/pages/O_listMyTodoView")
	public String O_listMyTodoView(HttpServletRequest req, Model model) {
		logger.info("URL : O_listMyTodoView");
		
		return "pages/O_listMyTodoView";
	}
	
	//업무 요청 - 내가 한 업무요청 화면
	@RequestMapping("/pages/O_listPureOrderView")
	public String O_listPureOrderView(HttpServletRequest req, Model model) {
		logger.info("URL : O_listPureOrderView");
		
		return "pages/O_listPureOrderView";
	}
	
	//업무 요청 - 참조 업무 요청 화면
	@RequestMapping("/pages/O_listSubTodoView")
	public String O_listSubTodoView(HttpServletRequest req, Model model) {
		logger.info("URL : O_listSubTodoView");
		
		return "pages/O_listSubTodoView";
	}
	
	//업무 보고 - 내가 한 업무 보고 화면
	@RequestMapping("/pages/O_listPureOrderReportView")
	public String O_listPureOrderReportView(HttpServletRequest req, Model model) {
		logger.info("URL : O_listPureOrderReportView");
		
		return "pages/O_listPureOrderReportView";
	}
	
	//업무 보고 - 수신 업무 보고
	@RequestMapping("/pages/O_listTodoReportView")
	public String O_listTodoReportView(HttpServletRequest req, Model model) {
		logger.info("URL : O_listTodoReportView");
		
		return "pages/O_listTodoReportView";
	}
	
	//업무보고 - 참조 업무 보고
	@RequestMapping("/pages/O_listSubTodoReportView")
	public String O_listSubTodoReportView(HttpServletRequest req, Model model) {
		logger.info("URL : O_listSubTodoReportView");
		
		return "pages/O_listSubTodoReportView";
	}
	
	//임시 저장함
	@RequestMapping("/pages/O_listTempTaskView")
	public String O_listTempTaskView(HttpServletRequest req, Model model) {
		logger.info("URL : O_listTempTaskView");
		
		return "pages/O_listTempTaskView";
	}
	
	//업무 보관함
	@RequestMapping("/pages/O_listMenuStoredTaskView")
	public String O_listMenuStoredTaskView(HttpServletRequest req, Model model) {
		logger.info("URL : O_listMenuStoredTaskView");
		
		return "pages/O_listMenuStoredTaskView";
	}
	
	
	//관리자 메뉴 - 업무 문서 관리
	@RequestMapping("/pages/O_listAdminDocManagement")
	public String O_listAdminDocManagement(HttpServletRequest req, Model model) {
		logger.info("URL : O_listAdminDocManagement");
		
		return "admin/O_listAdminDocManagement";
	}
	/* 업무 관리 끝 */
	
	
	
	/* 일정 시작 */
	//일정 화면
	@RequestMapping("/pages/O_calendar")
	public String O_calendar(HttpServletRequest req, Model model) {
		logger.info("URL : O_calendar");
		
		//oservice.calendarPageNum(req, model);
		
		return "pages/O_calendar";
	}
	
	/* 일정 끝 */
	
	
	
	
	/* 전자 결재 시작 */
	//기안 - 기안문 작성
	@RequestMapping("/pages/K_createApprDocFormView")
	public String K_createApprDocFormView(HttpServletRequest req, Model model) {
		logger.info("URL : K_createApprDocFormView");
		
		oservice.createApprDoc(req, model);
		
		return "pages/K_createApprDocFormView";
	}
	
	//기안 - 기안문 작성 - 결재선 지정
	@RequestMapping("/pages/K_addApprLine")
	public String K_addApprLine(HttpServletRequest req, Model model) {
		logger.info("URL : K_addApprLine");
		
		oservice.addApprLine(req, model);
		oservice.createApprDoc(req, model);
		
		return "pages/K_addApprLine";
	}
	
	//기안 - 기안문 작성 - 결재 요청
	@RequestMapping("/pages/K_apprDocFormReqPro")
	public String K_apprDocFormReqPro(HttpServletRequest req, Model model) {
		logger.info("URL : K_apprDocFormReqPro");
		
		oservice.apprDocReq(req, model);
		
		return "pages/K_apprDocFormReqPro";
	}
	
	//기안 - 결재 요청함
	@RequestMapping("/pages/K_listApprMyRequestView")
	public String K_listApprMyRequestView(HttpServletRequest req, Model model) {
		logger.info("URL : K_listApprMyRequestView");
		
		return "pages/K_listApprMyRequestView";
	}
	
	//기안 - 임시저장함
	@RequestMapping("/pages/K_listApprTempView")
	public String K_listApprTempView(HttpServletRequest req, Model model) {
		logger.info("URL : K_listApprTempView");
		
		return "pages/K_listApprTempView";
	}
	
	//결재 - 결재 대기함
	@RequestMapping("/pages/K_listApprTodoView")
	public String K_listApprTodoView(HttpServletRequest req, Model model) {
		logger.info("URL : K_listApprTodoView");
		
		return "pages/K_listApprTodoView";
	}
	
	//결재 - 결재 진행함
	@RequestMapping("/pages/K_listApprCompleteView")
	public String K_listApprCompleteView(HttpServletRequest req, Model model) {
		logger.info("URL : K_listApprCompleteView");
		
		return "pages/K_listApprCompleteView";
	}
	
	//결재 - 완료 문서함
	@RequestMapping("/pages/K_readApprAllListView")
	public String K_readApprAllListView(HttpServletRequest req, Model model) {
		logger.info("URL : K_readApprAllListView");
		
		return "pages/K_readApprAllListView";
	}
	
	//결재 - 반려 문서함
	@RequestMapping("/pages/K_listApprRejectView")
	public String K_listApprRejectView(HttpServletRequest req, Model model) {
		logger.info("URL : K_listApprRejectView");
		
		return "pages/K_listApprRejectView";
	}
	
	//결재 - 참조/열람문서함
	@RequestMapping("/pages/K_listApprReferenceView")
	public String K_listApprReferenceView(HttpServletRequest req, Model model) {
		logger.info("URL : K_listApprReferenceView");
		
		return "pages/K_listApprReferenceView";
	}
	
	//관리자 메뉴 - 결재문서관리
	@RequestMapping("/pages/K_listApprDocAllAdminView")
	public String K_listApprDocAllAdminView(HttpServletRequest req, Model model) {
		logger.info("URL : K_listApprDocAllAdminView");
		
		return "pages/K_listApprDocAllAdminView";
	}
	/* 전자 결재 끝 */
}
