package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface J_Service {
	
	// 기본 정보
	public void salaryList(HttpServletRequest req, Model model);
}
