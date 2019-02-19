package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface P_Service {
	//기안문 작성
	public void createApprDoc(HttpServletRequest req, Model model);
	
	//결재선 지정
	public void addApprLine(HttpServletRequest req, Model model);
	
	//결재 요청
	public void apprDocReq(HttpServletRequest req, Model model);
	
	//결재대기함
	public void P_listApprTodoView(HttpServletRequest req, Model model);
	
	//결재상세페이지
	public void P_payContentForm(HttpServletRequest req, Model model);
	
	//결재팝업
	public void P_payApprove(HttpServletRequest req, Model model);
	
	//결재진행
	public void P_payApprove_pro(HttpServletRequest req, Model model);
}
