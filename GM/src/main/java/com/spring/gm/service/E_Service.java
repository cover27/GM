package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface E_Service {

	// 조직도 - 첫페이지,	 (내가 속한 회사) 전체 구성원 목록
	public void E_organizationList(HttpServletRequest req, Model model);
	
	// 조직도 - 전체 그룹 목록
	public void E_organAllGroupList(HttpServletRequest req, Model model);
	
	// 조직도 - 부서 사이드 메뉴
	public void E_organDepartSide(HttpServletRequest req, Model model);
	
	
}
