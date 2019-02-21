package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface S_Service {
	
	public void mailList(HttpServletRequest req, Model model);

	public void mailBoxList(HttpServletRequest req, Model model);	//메일 목록
	
	
}
