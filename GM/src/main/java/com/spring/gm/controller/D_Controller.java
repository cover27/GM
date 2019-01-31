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
	
	private static final Logger logger = LoggerFactory.getLogger(D_Controller.class);
	
	// 게시판 생성 페이지
	@RequestMapping("/admin/D_createBoards")
	public String createBoards(HttpServletRequest req, Model model) {
		logger.info("URL : D_createBoards");
		
		return "admin/D_createBoards";
	}
	
	//게시판 생성 처리
	@RequestMapping("/admin/D_CreateBoards_pro")
	public String createBoardsPro(HttpServletRequest req, Model model) {
		logger.info("URL : D_CreateBoards_pro");
		

		// service.insertBoards(req, model);
		return "admin/sub/D_CreateBoards_pro";
	}
	
	//게시판 목록
	@RequestMapping("/pages/D_boardsList")
	public String boardsList(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardsList");
		
		service.boardsList(req, model);
		return "pages/D_boardsList";
	}
	
	@RequestMapping("/pages/D_boardsUpdate")
	public String boardsUpdate(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardsUpdate");
		
		
		return "admin/D_boardsUpdate";
	}
	
	//게시글 목록
	@RequestMapping("/pages/D_boardList")
	public String boardList(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardlist");
		
		service.boardsList(req, model);
		service.boardList(req, model);
		return "pages/D_boardList";
	}

	//게시글 입력
	@RequestMapping("/pages/D_writeForm")
	public String insertBoard(HttpServletRequest req, Model model) {
		logger.info("URL : D_writeForm");
		
		service.insertBoard(req, model);
		return "pages/D_writeForm";
	}
	
	@RequestMapping("/pages/D_writePro")
	public String writePro(HttpServletRequest req, Model model) {
		logger.info("URL : D_writePro");
		
		service.insertPro(req, model);
		return "pages/D_writePro";
	}
	
	@RequestMapping("/pages/D_boardContent")
	public String boardContent(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardContent");
		
		service.contentForm(req, model);
		return "pages/D_boardContent";
	}
	@RequestMapping("/pages/D_boardUpdate")
	public String boardUpdate(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardUpdate");
		
		service.boardUpdate(req, model);
		return "pages/D_boardUpdate";
	}
	
	@RequestMapping("/pages/D_boardUpdatePro")
	public String boardUpdatePro(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardUpdatePro");
		
		service.boardUpdatePro(req, model);
		return "pages/D_boardUpdatePro";
	}
}
