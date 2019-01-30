package com.spring.gm.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gm.service.E_Service;


@Controller
public class E_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(E_Controller.class);
	
	@Autowired
	E_Service service;

	
	// 조직도 - 첫페이지, 전체 구성원 목록		<a href="<c:url value='E_organizationList' />">
	@RequestMapping("/pages/E_organizationList")
	public String organizationList(HttpServletRequest req, Model model) {
		logger.info("URL : E_organizationList");
		
	//	service.memoList(req, model);
		
		return "pages/E_organizationList";
	}
	
	// 조직도 - 인물 상세정보 (전체 / 개인)
	@RequestMapping("/pages/sub/E_organizationMemberInfo")
	public String E_organizationMember_c(HttpServletRequest req, Model model) {
		logger.info("URL : E_organizationMemberInfo");
		
		return "pages/sub/E_organizationMemberInfo";
	}
	
	// 조직도 - 전체 그룹 목록
	@RequestMapping("/pages/E_organizationAllGroupList")
	public String E_organizationList(HttpServletRequest req, Model model) {
		logger.info("URL : E_organizationAllGroupList");
		
		return "pages/E_organizationAllGroupList";
	}
	
	// 조직도 - 개인 그룹 목록
//	@RequestMapping("/pages/E_organizationList")
	
	
	
	
	
	// 주소록 - 주소록 첫페이지
	@RequestMapping("/pages/E_addressList")
	public String E_addressList(HttpServletRequest req, Model model) {
		logger.info("URL : E_addressList");
		
		return "pages/E_addressList";
	}
	
	
	
	
	// 메모 게시판
	@RequestMapping("/pages/E_memoList")
	public String E_memoList(HttpServletRequest req, Model model) {
		logger.info("URL : E_memoList");
		/*
		service.memoList(req, model);
		*/
		return "pages/E_memoList";
	}
	
	// 메모 내용
	@RequestMapping("/pages/E_memoInfo")
	public String E_memoInfo(HttpServletRequest req, Model model) {
		logger.info("URL : E_memoInfo");
		
		return "pages/E_memoInfo";
	}
	


	
	
	

}
