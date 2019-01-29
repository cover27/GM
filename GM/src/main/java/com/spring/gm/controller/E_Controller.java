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

	
	// 조직도 - 첫페이지, 전체 구성원 목록	<a href="<c:url value='E_organizationList' />">
	@RequestMapping("E_organizationList")
	public String organizationList(HttpServletRequest req, Model model) {
		logger.info("URL : E_organizationList");
		
		return "pages/E_organizationList";
	}
	
	// 조직도 - 인물 정보창 (전체 / 개인)
	@RequestMapping("E_organizationMemberInfo")
	public String E_organizationMember_c(HttpServletRequest req, Model model) {
		logger.info("URL : E_organizationMemberInfo");
		
		return "pages/sub/E_organizationMemberInfo";
	}
	
	// 조직도 - 전체 그룹 목록
	@RequestMapping("E_organizationGroupList")
	public String E_organizationList(HttpServletRequest req, Model model) {
		logger.info("URL : E_organizationGroupList");
		
		return "pages/E_organizationGroupList";
	}
	
	// 조직도 - 개인 그룹 목록
	
	
	
	
	
	// 주소록 - 주소록 첫페이지
	@RequestMapping("E_addressList")
	public String addressGroup(HttpServletRequest req, Model model) {
		logger.info("URL : E_addressList");
		
		return "pages/E_addressList";
	}
	
	
	
	
	// 메모 게시판
	@RequestMapping("E_memoList")
	public String memo(HttpServletRequest req, Model model) {
		logger.info("URL : E_memoList");
		/*
		service.memoList(req, model);
		*/
		return "pages/E_memoList";
	}
	
	// 메모 내용
	@RequestMapping("E_memoInfo")
	public String memoInfo(HttpServletRequest req, Model model) {
		logger.info("URL : E_memoInfo");
		
		return "pages/E_memoInfo";
	}
	


	
	
	

}
