package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface K_Service {
	
	public void confirmId(HttpServletRequest req, Model model);
	
	public void findCompany(HttpServletRequest req, Model model);
	
	public void registAccount(HttpServletRequest req, Model model);

}
