package com.spring.gm.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gm.service.K_Service;

@Controller
public class K_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(K_Controller.class);

	@Autowired
	K_Service service;
	
	// 로그인 화면
	@RequestMapping("/login")
	public String login(HttpServletRequest req, Model model) {
		logger.info("URL : login");
		
		return "pages/main";
	}
	
	// 회원가입화면
	@RequestMapping("/createAccount")
	public String createAccount(HttpServletRequest req, Model model) {
		logger.info("URL : K_createAccount");
		
		return "pages/K_createAccount";
	}
	
	// 아이디 중복확인
	@RequestMapping("/confirmId")
	public String confirmId(HttpServletRequest req, Model model) {
		logger.info("URL : K_confirmId");
		
		service.confirmId(req, model);
		
		return "pages/K_confirmId";
	}
	
	// 아이디 중복확인
	@RequestMapping("/findCompany")
	public String findCompany(HttpServletRequest req, Model model) {
		logger.info("URL : K_findCompany");
		
		service.confirmId(req, model);
		
		return "pages/K_findCompany";
	}
	
	// 회원등록
	@RequestMapping("/registAccount")
	public String registAccount(HttpServletRequest req, Model model) {
		logger.info("URL : K_registAccount");
		
		service.registAccount(req, model);
		
		return "pages/K_registAccount";
	}
	
	
}
