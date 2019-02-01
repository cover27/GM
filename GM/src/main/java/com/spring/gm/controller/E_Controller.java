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

									// commit 실패시 - Author / Committer : GIGABYTE <GIGABYTE@SDLEE-Laptop>
	// 조직도 - 첫페이지, 전체 구성원 목록		<a href="<c:url value='E_organizationList' />">
	@RequestMapping("/pages/E_organizationList")
	public String E_organizationList(HttpServletRequest req, Model model) {
		logger.info("URL : E_organizationList");
		
		service.E_organizationList(req, model);
		
		return "pages/E_organizationList";
	}
	
	// 조직도 - 인물 상세정보 (전체 / 개인)
//	@RequestMapping("/pages/sub/E_organMemberInfo")
//	public String E_organMemberInfo(HttpServletRequest req, Model model) {
//		logger.info("URL : E_organMemberInfo");
		
//		return "pages/sub/E_organMemberInfo";
//	}
	
	// 조직도 - 전체 그룹 목록
	@RequestMapping("/pages/E_organAllGroupList")
	public String E_organAllGroupList(HttpServletRequest req, Model model) {
		logger.info("URL : E_organAllGroupList");
		
		return "pages/E_organAllGroupList";
	}
	
	
	
	// 조직도 - 개인 그룹 목록
//	@RequestMapping("/pages/E_organPrivateGroup")
	
	// 조직도 - 개인그룹 관리
//	@RequestMapping("/pages/E_privateGroupManage")
	
	// 조직도 - 자주 연락하는 사람 관리 게시판
//	@RequestMapping("/pages/E_organFavoritMember")
	
	
	
	
	
	
	
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
