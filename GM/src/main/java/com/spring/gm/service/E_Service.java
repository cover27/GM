package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface E_Service {

	// 사원 목록
	public void myCompanyMember(HttpServletRequest req, Model model);
	
	// 부서 목록
	public void departList(HttpServletRequest req, Model model);
	

}
