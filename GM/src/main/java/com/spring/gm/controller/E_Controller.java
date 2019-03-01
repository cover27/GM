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

	
	// 조직도 - 인물 상세정보 (전체 / 개인)
//	@RequestMapping("/pages/sub/E_organMemberInfo")
//	public String E_organMemberInfo(HttpServletRequest req, Model model) {
//		logger.info("URL : E_organMemberInfo");
		
//		return "pages/sub/E_organMemberInfo";
//	}
	
						
	// 조직도 - 첫페이지, 내회사 전체 구성원 목록	
	@RequestMapping("pages/E_orgnaizationMemberList")
	public String E_organizationMemberList(HttpServletRequest req, Model model) {
		logger.info("URL : E_orgnaizationMemberList");
		
		service.myCompanyMember(req, model);
		return "pages/E_orgnaizationMemberList";
	}
	
	@RequestMapping("pages/E_departList")
	public String E_orgnaizationList(HttpServletRequest req, Model model) {
		logger.info("URL : E_departList");
		
		service.departList(req, model);
		return "pages/E_departList";
	}

	
}
