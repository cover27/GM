package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface D_Service {
	
	public void insertBoards(HttpServletRequest req, Model model);
	
	public void boardsList(HttpServletRequest req, Model model);
	
	public void boardsUpdate(HttpServletRequest req, Model model);
	
	public void boardList(HttpServletRequest req, Model model);
	
	public void insertBoard(HttpServletRequest req, Model model);
	
	public void insertPro(HttpServletRequest req, Model model);
	
	public void contentForm(HttpServletRequest req, Model model);
	
	public void boardUpdate(HttpServletRequest req, Model model);
	
	public void boardUpdatePro(HttpServletRequest req, Model model);
	
	public void boardDelete(HttpServletRequest req, Model model);
	
	public void boardsUpdatePro(HttpServletRequest req, Model model);
	
	public void insertReple(HttpServletRequest req, Model model);
	
}
