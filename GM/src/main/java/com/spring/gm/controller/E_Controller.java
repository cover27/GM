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
	@RequestMapping("/pages/E_organizationList")
	public String E_organizationList(HttpServletRequest req, Model model) {
		logger.info("URL : E_organizationList");
		
		service.E_organizationList(req, model);
		
		return "pages/E_organizationList";
	}
	
	// 조직도 - 로그인된 계정이 소속된 회사 특정 그룹에 속하는 구성원 목록
	@RequestMapping("/pages/E_organVipGroupList")
	public String E_organVipGroupList(HttpServletRequest req, Model model) {
		logger.info("URL : E_organVipGroupList");
		
		service.E_organVipGroupList(req, model);
		
		return "pages/E_organVipGroupList";
	}
	
	
	// 조직도 - 개인 그룹 목록 ( 개인그룹 관리에서 초기 게시판 생성 후 작성 )
	@RequestMapping("/pages/E_myGroupList")
	public String E_myGroupList(HttpServletRequest req, Model model) {
		logger.info("URL : E_myGroupList");
		
		service.E_organVipGroupList(req, model);
		
		return "pages/E_myGroupList";
	}
	
	
	// 조직도 - 개인그룹 관리
	@RequestMapping("/pages/E_myGroupManage")
	public String E_MyGroupManage(HttpServletRequest req, Model model) {
		logger.info("URL : E_myGroupManage");
		
		service.E_MyGroupManage(req, model);
		return "pages/E_myGroupManage";
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
	
	
	
	
	
	
	
	// 주소록 - 주소록 첫페이지
	@RequestMapping("/pages/E_addressList")
	public String E_addressList(HttpServletRequest req, Model model) {
		logger.info("URL : E_addressList");
		
		return "pages/E_addressList";
	}
	



	
	
	

}
