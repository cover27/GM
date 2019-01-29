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

	
	// 조직도
	@RequestMapping("pages/organizationList")
	public String organizationList(HttpServletRequest req, Model model) {
		logger.info("URL : E_organizationList");
		
		return "pages/E_organizationList";
	}
	
	// 주소록 그룹
	@RequestMapping("pages/addressGroup")
	public String addressGroup(HttpServletRequest req, Model model) {
		logger.info("URL : E_addressGroup");
		
		return "pages/E_addressGroup";
	}
	
	// 메모
	@RequestMapping("pages/memoList")
	public String memo(HttpServletRequest req, Model model) {
		logger.info("URL : E_memoList");
		/*
		service.memoList(req, model);
		*/
		return "pages/E_memoList";
	}
	
	// 메모 내용
	@RequestMapping("pages/memoInfo")
	public String memoInfo(HttpServletRequest req, Model model) {
		logger.info("URL : E_memoInfo");
		
		return "pages/E_memoInfo";
	}
	


	
	
	

}
