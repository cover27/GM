package com.spring.gm.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.gm.service.K_Service;

@Controller
public class K_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(K_Controller.class);

	@Autowired
	K_Service service;
	
	// 로그인화면
	@RequestMapping("login")
	public String login(HttpServletRequest request, Model model) {
		logger.info("URL : login");
		
		return "common/login";
	}
	
	// 로그인 프로세스
	@RequestMapping("loginPro")
	public String loginPro(HttpServletRequest request, Model model) {
		logger.info("URL : login");
		
		return "common/main";
	}
	
	// 메인화면
	@RequestMapping("main")
	public String main(HttpServletRequest req, Model model) {
		logger.info("URL : main");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String id = authentication.getName();
		
		if(id != null) {
			service.login(req, model, id);
		}
		
		return "common/main";
	}
	
	// 회원가입화면
	@RequestMapping("createAccount")
	public String createAccount(HttpServletRequest req, Model model) {
		logger.info("URL : K_createAccount");
		
		return "common/K_createAccount";
	}
	
	// 아이디 중복확인
	@RequestMapping("confirmId")
	public String confirmId(HttpServletRequest req, Model model) {
		logger.info("URL : K_confirmId");
		
		service.confirmId(req, model);
		
		return "common/K_confirmId";
	}
	
	// 회사 찾기(그냥 클릭했을때 검색안했을경우)
	@RequestMapping("findCompany")
	public String findCompany(HttpServletRequest req, Model model) {
		logger.info("URL : K_findCompany");
		
		service.findCompany(req, model);
		
		return "common/K_findCompany";
	}
	
	// 회사 찾기(그냥 클릭했을때 검색안했을경우)
	@RequestMapping("searchCompany")
	public String searchCompany(HttpServletRequest req, Model model) {
		logger.info("URL : K_searchCompany");
		
		service.searchCompany(req, model);
		
		return "common/K_findCompany";
	}
	
	// 회원등록
	@RequestMapping("registAccount")
	public String registAccount(HttpServletRequest req, Model model) {
		logger.info("URL : K_registAccount");
		
		service.registAccount(req, model);
		
		return "common/K_registAccount";
	}
	
	//우측상단에 로그아웃 누르면 로그아웃되면서 로그인화면으로 가짐
	@RequestMapping("logout")
	public String logout(HttpServletRequest req, Model model) {
		logger.info("URL : logout");
		
		req.getSession().removeAttribute("loginInfo");
		
		return "common/login";
	}
	
	//인사관리 - 대기명단 승인/취소가 기본
	@RequestMapping("member_manage")
	public String member_manage(HttpServletRequest req, Model model) {
		logger.info("URL : member_manage");
		
		service.member_manage(req, model);
		
		return "admin/K_member_manage";
	}
	
	//회사관리자 아직 안만듬
	@RequestMapping("setting_admin")
	public String setting_admin(HttpServletRequest req, Model model) {
		logger.info("URL : setting_admin");
		
		return "pages/K_setting_admin";
	}
}
