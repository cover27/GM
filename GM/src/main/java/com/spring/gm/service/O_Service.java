package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface O_Service {

	//기안문 작성
	public void createApprDoc(HttpServletRequest req, Model model);
	
	//결재선 지정
	public void addApprLine(HttpServletRequest req, Model model);
	
	//결재 요청
	public void apprDocReq(HttpServletRequest req, Model model);
	
	//일정 페이지넘
	public void calendarPageNum(HttpServletRequest req, Model model);
}
