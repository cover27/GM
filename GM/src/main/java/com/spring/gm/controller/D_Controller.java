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
<<<<<<< HEAD
	@RequestMapping("D_createBoards")
=======
<<<<<<< HEAD
	@RequestMapping("/admin/D_createBoards")
=======
	@RequestMapping("pages/D_createBoards")
>>>>>>> branch 'master' of https://github.com/cover27/GM.git
>>>>>>> branch 'master' of https://github.com/cover27/GM
	public String createBoards(HttpServletRequest req, Model model) {
		logger.info("URL : D_createBoards");
		
		return "admin/D_createBoards";
	}
	
	//게시판 생성 처리
<<<<<<< HEAD
	@RequestMapping("D_CreateBoards_pro")
=======
<<<<<<< HEAD
	@RequestMapping("/admin/D_CreateBoards_pro")
=======
	@RequestMapping("pages/D_CreateBoards_pro")
>>>>>>> branch 'master' of https://github.com/cover27/GM.git
>>>>>>> branch 'master' of https://github.com/cover27/GM
	public String createBoardsPro(HttpServletRequest req, Model model) {
		logger.info("URL : D_CreateBoards_pro");
		

		// service.insertBoards(req, model);
		return "pages/sub/D_CreateBoards_pro";
	}
	
	//게시판 목록
	@RequestMapping("D_boardsList")
	public String boardsList(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardsList");
		
		//service.boardsList(req, model);
		return "pages/D_boardsList";
	}
	
	@RequestMapping("D_boardsUpdate")
	public String boardsUpdate(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardsUpdate");
		
		
		return "admin/D_boardsUpdate";
	}
	
<<<<<<< HEAD
	//게시글 목록
	@RequestMapping("D_boardList")
=======
	//게시글 목록
<<<<<<< HEAD
	@RequestMapping("D_boardList")
=======
	@RequestMapping("pages/D_boardList")
>>>>>>> branch 'master' of https://github.com/cover27/GM.git
>>>>>>> branch 'master' of https://github.com/cover27/GM
	public String boardList(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardlist");
		
		service.boardList(req, model);
		return "pages/D_boardList";
	}
<<<<<<< HEAD
	
	//게시글 입력
	@RequestMapping("D_writeForm")
	public String insertBoard(HttpServletRequest req, Model model) {
		logger.info("URL : D_writeForm");
		
		service.insertBoard(req, model);
		return "pages/D_writeForm";
	}
	
	@RequestMapping("D_writePro")
	public String writePro(HttpServletRequest req, Model model) {
		logger.info("URL : D_writePro");
		
		service.insertPro(req, model);
		return "pages/D_writePro";
	}
	
	@RequestMapping("D_boardContent")
	public String boardContent(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardContent");
		
		return "pages/D_boardContent";
	}
	
	
=======
>>>>>>> branch 'master' of https://github.com/cover27/GM.git
}
