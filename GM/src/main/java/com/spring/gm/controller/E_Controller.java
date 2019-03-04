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
	
						
	// 조직도 - 첫페이지, 내회사 전체 구성원 목록	
	@RequestMapping("pages/E_orgnaizationMemberList")
	public String organizationMemberList(HttpServletRequest req, Model model) {
		logger.info("URL : E_orgnaizationMemberList");
		
		service.myCompanyMember(req, model);
		service.departList(req, model);
		return "pages/E_orgnaizationMemberList";
	}
	
	// 조직도 - 회사내 부서 구성원 목록
	@RequestMapping("pages/E_departMemberList")
	public String departMemberList(HttpServletRequest req, Model model) {
		logger.info("URL : E_departMemberList");
		
		service.departList(req, model);
		service.departMember(req, model);
		return "pages/E_departMemberList";
	}
	
	@RequestMapping("pages/E_orgMyFavoritMemList")
	public String favoriteMember(HttpServletRequest req, Model model) {
		logger.info("URL : E_orgMyFavoritMemList");
		
		service.myFavoriteMemberList(req, model);
		service.departList(req, model);
		service.myCompanyMember(req, model);
		return "pages/E_orgMyFavoritMemList";
	}
	
	@RequestMapping("pages/E_memberContents")
	public String memberContents(HttpServletRequest req, Model model) {
		logger.info("URL : E_memberContents");
		
		service.memberContents(req, model);
		service.departList(req, model);
		return "pages/E_memberContents";
	}
	
	// 자주 연락하는 사람 추가
	@RequestMapping("pages/E_addMemberPro")
	public String addMemberPro(HttpServletRequest req, Model model) {
		logger.info("URL : E_addMemberPro");
		
		service.addMember(req, model);
		return "pages/E_addMemberPro";
	}
	
	// 자주연락하는 사람 삭제
	@RequestMapping("pages/E_deleteMemberPro")
	public String deleteMember(HttpServletRequest req, Model model) {
		logger.info("URL : E_deleteMemberPro");
		
		service.deleteMember(req, model);
		return "pages/E_deleteMemberPro";
	}
	
	@RequestMapping("pages/E_addmembersPro")
	public String addMembers(HttpServletRequest req, Model model) {
		logger.info("URL : E_addmembersPro");
		
		service.addMembers(req, model);
		return "pages/E_addmembersPro";		
	}
	
	@RequestMapping("pages/E_addmembersDepartPro")
	public String addMembersDepartPro(HttpServletRequest req, Model model) {
		logger.info("URL : E_addmembersDepartPro");
		
		service.addMembers(req, model);
		return "pages/E_addmembersDepartPro";		
	}
}
