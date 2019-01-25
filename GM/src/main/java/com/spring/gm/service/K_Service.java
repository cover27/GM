package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface K_Service {
	
	public void login(HttpServletRequest req, Model model);
	
	public void confirmId(HttpServletRequest req, Model model);
	
	public void findCompany(HttpServletRequest req, Model model);
	
	public void searchCompany(HttpServletRequest req, Model model);
	
	public void registAccount(HttpServletRequest req, Model model);
	
	public void member_manage(HttpServletRequest req, Model model);

}
