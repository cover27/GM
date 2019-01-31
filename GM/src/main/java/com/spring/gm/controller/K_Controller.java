package com.spring.gm.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
	@RequestMapping("login")
	public String login(HttpServletRequest req, Model model) {
		logger.info("URL : login");
		
		return "common/login";
	}
	
	// 로그인 프로세스
	@RequestMapping("loginPro")
	public String loginPro(HttpServletRequest req, Model model) {
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
	
	/*
	//우측상단에 로그아웃 누르면 로그아웃되면서 로그인화면으로 가짐
	@RequestMapping("../logout")
	public String logout_test(HttpServletRequest req, Model model) {
		logger.info("URL : ../logout");
		
		req.getSession().removeAttribute("loginInfo");
		
		return "common/login";
	}
	*/
	
	//인사관리 - 대기명단 승인/취소가 기본
	@RequestMapping("admin/K_member_manage")
	public String K_member_manage(HttpServletRequest req, Model model) {
		logger.info("URL : K_member_manage");
		
		service.member_manage(req, model);
		
		return "admin/K_member_manage";
	}
	
	@RequestMapping("admin/K_appMember")
	public String K_appMember(HttpServletRequest req, Model model) {
		logger.info("URL : K_appMember");
		
		service.K_appMember(req, model);
		
		return "admin/K_appMember";
	}
	
	//인사정보등록 - 경준씨거 배낄거임 ㅎㅎㅎ 
	@RequestMapping("admin/K_resistMemberInfo")
	public String K_resistMemberInfo(HttpServletRequest req, Model model) {
		logger.info("URL : K_resistMemberInfo");
		
		service.K_resistMemberInfo(req, model);
		
		return "admin/K_resistMemberInfo";
	}
	
	//근태/급여기준정보설정
	@RequestMapping("admin/K_personal")
	public String K_personal(HttpServletRequest req, Model model) {
		logger.info("URL : K_personal");
		
		//service.K_personal(req, model);
		
		return "admin/K_personal";
	}
	
	//테스트용 삭제예정
	@RequestMapping("admin/test")
	public String K_test(HttpServletRequest req, Model model) {
		logger.info("URL : K_personal");
		
		//service.K_personal(req, model);
		String[] values = req.getParameterValues("value");
		if(values.length != 0) {
			for(int i=0; i<values.length; i++) {
				System.out.println(" " + values[i]);
			}
		} else {
			System.out.println("안탐");
		}
		return "admin/K_personal";
	}
	
	//회사관리자 아직 안만듬
	@RequestMapping("admin/K_setting_admin")
	public String K_setting_admin(HttpServletRequest req, Model model) {
		logger.info("URL : K_setting_admin");
				
		return "admin/K_setting_admin";
	}
}
