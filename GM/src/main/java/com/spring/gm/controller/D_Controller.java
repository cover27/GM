package com.spring.gm.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gm.service.D_Service;

@Controller
public class D_Controller {
	
	@Autowired
	D_Service service;
	
	private static final Logger logger = LoggerFactory.getLogger(S_Controller.class);
	
	// 게시판 생성 페이지
	@RequestMapping("D_createBoards")
	public String createBoards(HttpServletRequest req, Model model) {
		logger.info("URL : D_createBoards");
		
		return "pages/D_createBoards";
	}
	
	//게시판 생성 처리
	@RequestMapping("D_CreateBoards_pro")
	public String createBoardsPro(HttpServletRequest req, Model model) {
		logger.info("URL : D_CreateBoards_pro");
		
		service.insertBoards(req, model);
		return "pages/sub/D_CreateBoards_pro";
	}
	
	//게시판 목록
	@RequestMapping("D_boardsList")
	public String boardsList(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardsList");
		
		service.boardsList(req, model);
		return "pages/D_boardsList";
	}
	
	//게시글 목록
	@RequestMapping("D_boardList")
	public String boardList(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardlist");
		
		return "pages/D_boardList";
	}
}
