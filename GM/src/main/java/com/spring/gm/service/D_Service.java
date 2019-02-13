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
	
	public void repleList(HttpServletRequest req, Model model);
	
	public void deleteReple(HttpServletRequest req, Model model);
	
	public void allBoardList(HttpServletRequest req, Model model); // 전체 글목록
	
	public void boardsDelete(HttpServletRequest req, Model model); // 게시판 삭제
	
	public void repleUpdate(HttpServletRequest req, Model model);	// 댓글 수정
	
	public void repleUpdatePro(HttpServletRequest req, Model model);	// 댓글 수정 처리
	
	public void boardDel(HttpServletRequest req, Model model);		// 보드 전체삭제
	
	public void boardAdmin(HttpServletRequest req, Model model);	// 게시물 관리
	
}
