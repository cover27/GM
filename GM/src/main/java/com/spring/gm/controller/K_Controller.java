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
	
	// 로그인화면
	@RequestMapping("/loginInfo")
	public String loginInfo(HttpServletRequest req, Model model) {
		logger.info("URL : K_loginInfo");
		
		service.login(req, model);
		
		return "pages/K_loginInfo";
	}
	
	// 메인화면
	@RequestMapping("/main")
	public String main(HttpServletRequest req, Model model) {
		logger.info("URL : main");
		
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
	
	// 회사 찾기(그냥 클릭했을때 검색안했을경우)
	@RequestMapping("/findCompany")
	public String findCompany(HttpServletRequest req, Model model) {
		logger.info("URL : K_findCompany");
		
		service.findCompany(req, model);
		
		return "pages/K_findCompany";
	}
	
	// 회사 찾기(그냥 클릭했을때 검색안했을경우)
	@RequestMapping("/searchCompany")
	public String searchCompany(HttpServletRequest req, Model model) {
		logger.info("URL : K_searchCompany");
		
		service.searchCompany(req, model);
		
		return "pages/K_findCompany";
	}
	
	// 회원등록
	@RequestMapping("/registAccount")
	public String registAccount(HttpServletRequest req, Model model) {
		logger.info("URL : K_registAccount");
		
		service.registAccount(req, model);
		
		return "pages/K_registAccount";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req, Model model) {
		logger.info("URL : logout");
		
		req.getSession().removeAttribute("loginInfo");
		
		return "pages/login";
	}
}
