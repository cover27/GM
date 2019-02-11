package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface E_Service {

	// 조직도 - 첫페이지,	 내회사 전체 구성원 목록	
	public void E_organizationList(HttpServletRequest req, Model model);
	
	// 조직도 - 로그인된 계정이 소속된 회사에서 그어떤 그룹에도 속하지 않는  구성원 목록
	public void E_organVipGroupList(HttpServletRequest req, Model model);
	
	// 조직도 - 부서 사이드 메뉴(aside)
	public void E_organDepartSide(HttpServletRequest req, Model model);
	
	// 조직도 - 개인 그룹 목록
	public void E_myGroupList(HttpServletRequest req, Model model);
	
	
}
