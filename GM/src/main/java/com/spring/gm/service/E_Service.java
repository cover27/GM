package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface E_Service {

	// 조직도 
	public void organization(HttpServletRequest req, Model model);
	
	
	
	
	// 메모 목록
	public void memoList(HttpServletRequest req, Model model);
	
}
