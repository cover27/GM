package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface D_Service {
	
	public void insertBoards(HttpServletRequest req, Model model);	// 게시판생성
	
	public void boardsList(HttpServletRequest req, Model model);	// 게시판 목록
		
	public void boardsUpdate(HttpServletRequest req, Model model);	// 게시판 수정
	
	public void boardList(HttpServletRequest req, Model model);	// 게시글 목록
	
	public void insertBoard(HttpServletRequest req, Model model);	// 게시글 생성폼
	
	public void insertPro(HttpServletRequest req, Model model);		// 게시글 생성 처리
	
	public void contentForm(HttpServletRequest req, Model model);	// 게시글 상세페이지
	
	public void boardUpdate(HttpServletRequest req, Model model);	// 게시글 수정폼
	
	public void boardUpdatePro(HttpServletRequest req, Model model);	// 게시글 수정 처리
	
	public void boardDelete(HttpServletRequest req, Model model);	// 게시글 삭제
	
	public void boardsUpdatePro(HttpServletRequest req, Model model);	// 게시글 
	
	public void insertReple(HttpServletRequest req, Model model);
	
	public void repleList(HttpServletRequest req, Model model);
	
	public void deleteReple(HttpServletRequest req, Model model);
	
	public void allBoardList(HttpServletRequest req, Model model); // 전체 글목록
	
	public void boardsDelete(HttpServletRequest req, Model model); // 게시판 삭제
	
	public void repleUpdate(HttpServletRequest req, Model model);	// 댓글 수정
	
	public void repleUpdatePro(HttpServletRequest req, Model model);	// 댓글 수정 처리
	
	public void boardDel(HttpServletRequest req, Model model);		// 게시글 광역삭제
	
	public void boardMove(HttpServletRequest req, Model model);		// 게시글 이동
	
	public void allBoardAdmin(HttpServletRequest req, Model model);	// 게시관리 페이징
	
}
