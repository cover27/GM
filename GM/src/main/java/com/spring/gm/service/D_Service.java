package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface D_Service {
	
	public void insertBoards(HttpServletRequest req, Model model);
	
	public void boardsList(HttpServletRequest req, Model model);
	
	public void boardList(HttpServletRequest req, Model model);
	
}
