package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface O_Service {

	//일정화면 조회
	public void calendarSelect(HttpServletRequest req, Model model);
	
	//일정 등록 write
	public void calendarWrite(HttpServletRequest req, Model model);
	
	//일정 페이지넘
	public void calendarPageNum(HttpServletRequest req, Model model);
	
	//일정 등록 pro
	public void calendarPro(HttpServletRequest req, Model model);
	
	//일정 상세화면
	public void calendarDetail(HttpServletRequest req, Model model);
	
	//일정 수정
	public void calendarModify(HttpServletRequest req, Model model);
}
