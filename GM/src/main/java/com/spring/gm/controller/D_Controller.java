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
	@RequestMapping("/admin/D_CreateBoardsPro")
	public String createBoardsPro(HttpServletRequest req, Model model) {
		logger.info("URL : D_CreateBoards_pro");
		

		service.insertBoards(req, model);
		return "admin/sub/D_CreateBoards_pro";
	}
	
	//게시판 설정
	@RequestMapping("/admin/D_boardsSetting")
	public String boardsList(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardsSetting");
		
		service.boardsList(req, model);
		return "admin/D_boardsSetting";
	}
	
	// 게시판 수정
	@RequestMapping("/admin/D_boardsUpdate")
	public String boardsUpdate(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardsUpdate");
		
		service.boardsUpdate(req, model);
		return "admin/D_boardsUpdate";
	}
	// 게시판 수정 처리
	@RequestMapping("/admin/D_boardsUpdatePro")
	public String boardsUpdatePro(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardsUpdatePro");
		
		service.boardsUpdatePro(req, model);
		return "admin/sub/D_boardsUpdatePro";
	}
	
	//게시글 목록
	@RequestMapping("/pages/D_boardList")
	public String boardList(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardlist");
		
		service.boardsList(req, model);
		service.boardList(req, model);
		return "pages/D_boardList";
	}
	
	// 게시판관리 - 게시판 선택
	@RequestMapping("/pages/D_boardListSetting")
	public String boardListSetting(HttpServletRequest req, Model model) {
		logger.info("URL : D_BoardListSetting");
		
		return "pages/D_boardList_setting";
	}

	//게시글 입력
	@RequestMapping("/pages/D_writeForm")
	public String insertBoard(HttpServletRequest req, Model model) {
		logger.info("URL : D_writeForm");
		
		service.boardsList(req, model);
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
		
		service.boardsList(req, model);
		service.contentForm(req, model);
		service.repleList(req, model);
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
	
	@RequestMapping("/pages/D_boardDeletePro")
	public String boardDeletePro(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardDeletePro");
		
		service.boardDelete(req, model);
		return "pages/D_boardDeletePro";
	}
	
	@RequestMapping("/pages/D_repleInsertPro")
	public String repleInsert(HttpServletRequest req, Model model) {
		logger.info("URL : D_repleInsertPro");
		
		service.insertReple(req, model);
		return "pages/D_repleInsertPro";
	}
	
	@RequestMapping("/pages/D_repleDeletePro")
	public String repleDelete(HttpServletRequest req, Model model) {
		logger.info("URL : D_repleDeletePro");
		
		service.deleteReple(req, model);
		return "/pages/D_repleDeletePro";
	}
	
	@RequestMapping("/pages/D_allBoardList")
	public String allBoardList(HttpServletRequest req, Model model) {
		logger.info("URL : D_allBoardList");
		
		service.boardsList(req, model);
		service.allBoardList(req, model);
		return "/pages/D_allBoardList";
	}
	
	@RequestMapping("/admin/D_deleteBoardsPro")
	public String deleteBoards(HttpServletRequest req, Model model) {
		logger.info("URL : D_allBoardList");
		
		service.boardsDelete(req, model);
		return "/admin/sub/D_deleteBoards_Pro";
	}
	
	@RequestMapping("/pages/D_repleUpdate")
	public String repleUpdate(HttpServletRequest req, Model model) {
		logger.info("URL : D_repleUpdate");
		
		service.repleUpdate(req, model);
		return "pages/D_repleUpdate";
	}
	
	@RequestMapping("/pages/D_repleUpdatePro")
	public String repleUpdatePro(HttpServletRequest req, Model model) {
		logger.info("URL : D_repleUpdatePro");
		
		service.repleUpdatePro(req, model);
		return "pages/D_repleUpdatePro";
	}
	
	@RequestMapping("/admin/D_boardDelPro")
	public String boardDel(HttpServletRequest req, Model model) {
		logger.info("URL : D_boardDelPro");
		
		service.boardDel(req, model);
		return "/admin/sub/D_boardDelPro";
	}
	
	@RequestMapping("/admin/D_allBoardDeletePro")
	public String allBoardDeletePro(HttpServletRequest req, Model model) {
		logger.info("URL : D_allBoardDeletePro");
		
		service.boardDel(req, model);
		return "/admin/sub/D_allBoardDeletePro";
	}
	
	@RequestMapping("/admin/D_allBoardAdmin")
	public String D_allBoardAdmin(HttpServletRequest req, Model model) {
		logger.info("URL : D_allBoardAdmin");
		
		service.boardsList(req, model);
		service.boardAdmin(req, model);
		return "/admin/D_allBoardAdmin";
	}

}
