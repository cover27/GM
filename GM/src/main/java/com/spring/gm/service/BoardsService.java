package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface BoardsService {
	
	public void insertBoards(HttpServletRequest request, Model model);
	
}
