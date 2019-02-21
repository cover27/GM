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
		
		service.P_listApprMyRequestView(req, model);
		
		return "pages/P_listApprMyRequestView";
	}
	
	//결재 - 결재 대기함
	@RequestMapping("/pages/P_listApprTodoView")
	public String P_listApprTodoView(HttpServletRequest req, Model model) {
		logger.info("URL : P_listApprTodoView");
		
		service.P_listApprTodoView(req, model);
		
		return "pages/P_listApprTodoView";
	}
	
	//결재 상세 페이지
	@RequestMapping("/pages/P_payContentForm")
	public String P_payContentForm(HttpServletRequest req, Model model) {
		logger.info("URL : P_payContentForm");
		
		service.P_payContentForm(req, model);
		
		return "pages/P_payContentForm";
	}
	
	//결재팝업
	@RequestMapping("/pages/P_payApprove")
	public String P_payApprove(HttpServletRequest req, Model model) {
		logger.info("URL : P_payApprove");
		
		service.P_payApprove(req, model);
		
		return "pages/sub/P_payApprove_sub";
	}
	
	//결재진행
	@RequestMapping("/pages/P_payApprove_pro")
	public String P_payApprove_pro(HttpServletRequest req, Model model) {
		logger.info("URL : P_payApprove_pro");
		
		service.P_payApprove_pro(req, model);
		
		return "pages/sub/P_payApprove_pro";
	}
	
	//반려팝업
	@RequestMapping("/pages/P_payDeny")
	public String P_payDeny(HttpServletRequest req, Model model) {
		logger.info("URL : P_payDeny");
		
		service.P_payDeny(req, model);
		
		return "pages/sub/P_payDeny_sub";
	}
	
	//결재진행
	@RequestMapping("/pages/P_payDeny_pro")
	public String P_payDeny_pro(HttpServletRequest req, Model model) {
		logger.info("URL : P_payDeny_pro");
		
		service.P_payDeny_pro(req, model);
		
		return "pages/sub/P_payDeny_pro";
	}
	
	//합의팝업
	@RequestMapping("/pages/P_payAgree")
	public String P_payAgree(HttpServletRequest req, Model model) {
		logger.info("URL : P_payAgree");
		
		service.P_payAgree(req, model);
		
		return "pages/sub/P_payAgree_sub";
	}
	
	//합의진행
	@RequestMapping("/pages/P_payAgree_pro")
	public String P_payAgree_pro(HttpServletRequest req, Model model) {
		logger.info("URL : P_payAgree_pro");
		
		service.P_payAgree_pro(req, model);
		
		return "pages/sub/P_payAgree_pro";
	}
	
	//각 결재함의 검색기능
	@RequestMapping("/pages/P_SearchPaymentTool")
	public String P_SearchPaymentTool(HttpServletRequest req, Model model) {
		logger.info("URL : P_SearchPaymentTool");
		
		service.P_SearchPaymentTool(req, model);
		
		return "pages/sub/P_SearchPaymentTool";
	}
	
	//결재 - 결재 진행함
	@RequestMapping("/pages/P_listApprCompleteView")
	public String P_listApprCompleteView(HttpServletRequest req, Model model) {
		logger.info("URL : P_listApprCompleteView");
		
		service.P_listApprCompleteView(req, model);
		
		return "pages/P_listApprCompleteView";
	}
	
	//결재 - 완료 문서함
	@RequestMapping("/pages/P_readApprAllListView")
	public String P_readApprAllListView(HttpServletRequest req, Model model) {
		logger.info("URL : P_readApprAllListView");
		
		service.P_readApprAllListView(req, model);
		
		return "pages/P_readApprAllListView";
	}
	
	//결재 - 반려 문서함
	@RequestMapping("/pages/P_listApprRejectView")
	public String P_listApprRejectView(HttpServletRequest req, Model model) {
		logger.info("URL : P_listApprRejectView");
		
		service.P_listApprRejectView(req, model);
		
		return "pages/P_listApprRejectView";
	}
	
	//결재 - 참조/열람문서함
	@RequestMapping("/pages/P_listApprReferenceView")
	public String P_listApprReferenceView(HttpServletRequest req, Model model) {
		logger.info("URL : P_listApprReferenceView");
		
		service.P_listApprReferenceView(req, model);
		
		return "pages/P_listApprReferenceView";
	}
	
}
