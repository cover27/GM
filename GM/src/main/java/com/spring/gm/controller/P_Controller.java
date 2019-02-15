package com.spring.gm.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gm.service.P_Service;

@Controller
public class P_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(P_Controller.class);
	
	@Autowired
	P_Service service;
	
	//기안 - 기안문 작성
	@RequestMapping("/pages/P_createApprDocFormView")
	public String P_createApprDocFormView(HttpServletRequest req, Model model) {
		logger.info("URL : P_createApprDocFormView");
		
		service.createApprDoc(req, model);
		
		return "pages/P_createApprDocFormView";
	}
	
	//기안 - 기안문 작성 - 결재선 지정
	@RequestMapping("/pages/P_addApprLine")
	public String P_addApprLine(HttpServletRequest req, Model model) {
		logger.info("URL : P_addApprLine");
		
		service.addApprLine(req, model);
		service.createApprDoc(req, model);
		
		return "pages/P_addApprLine";
	}
	
	//기안 - 기안문 작성 - 결재 요청
	@RequestMapping("/pages/P_apprDocFormReqPro")
	public String P_apprDocFormReqPro(HttpServletRequest req, Model model) {
		logger.info("URL : P_apprDocFormReqPro");
		
		service.apprDocReq(req, model);
		
		return "pages/P_apprDocFormReqPro";
	}
	
	//기안 - 결재 요청함
	@RequestMapping("/pages/P_listApprMyRequestView")
	public String P_listApprMyRequestView(HttpServletRequest req, Model model) {
		logger.info("URL : P_listApprMyRequestView");
		
		return "pages/P_listApprMyRequestView";
	}
	
	//기안 - 임시저장함
	@RequestMapping("/pages/P_listApprTempView")
	public String P_listApprTempView(HttpServletRequest req, Model model) {
		logger.info("URL : P_listApprTempView");
		
		return "pages/P_listApprTempView";
	}
	
	//결재 - 결재 대기함
	@RequestMapping("/pages/P_listApprTodoView")
	public String P_listApprTodoView(HttpServletRequest req, Model model) {
		logger.info("URL : P_listApprTodoView");
		
		return "pages/P_listApprTodoView";
	}
	
	//결재 - 결재 진행함
	@RequestMapping("/pages/P_listApprCompleteView")
	public String P_listApprCompleteView(HttpServletRequest req, Model model) {
		logger.info("URL : P_listApprCompleteView");
		
		return "pages/P_listApprCompleteView";
	}
	
	//결재 - 완료 문서함
	@RequestMapping("/pages/P_readApprAllListView")
	public String P_readApprAllListView(HttpServletRequest req, Model model) {
		logger.info("URL : P_readApprAllListView");
		
		return "pages/P_readApprAllListView";
	}
	
	//결재 - 반려 문서함
	@RequestMapping("/pages/P_listApprRejectView")
	public String P_listApprRejectView(HttpServletRequest req, Model model) {
		logger.info("URL : P_listApprRejectView");
		
		return "pages/P_listApprRejectView";
	}
	
	//결재 - 참조/열람문서함
	@RequestMapping("/pages/P_listApprReferenceView")
	public String P_listApprReferenceView(HttpServletRequest req, Model model) {
		logger.info("URL : P_listApprReferenceView");
		
		return "pages/P_listApprReferenceView";
	}
	
	//관리자 메뉴 - 결재문서관리
	@RequestMapping("/pages/P_listApprDocAllAdminView")
	public String P_listApprDocAllAdminView(HttpServletRequest req, Model model) {
		logger.info("URL : P_listApprDocAllAdminView");
		
		return "pages/P_listApprDocAllAdminView";
	}
}
