package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface O_Service {

	/* 일정 시작 */
	//일정화면 조회
	public void calendarSelect(HttpServletRequest req, Model model);
	//일정 등록 write
	public void calendarWrite(HttpServletRequest req, Model model);
	//일정 페이지넘
	public void calendarPageNum(HttpServletRequest req, Model model);
	//일정 등록 insert-pro
	public void calendarPro(HttpServletRequest req, Model model);
	//일정 상세화면
	public void calendarDetail(HttpServletRequest req, Model model);
	//일정 수정
	public void calendarModify(HttpServletRequest req, Model model);
	//일정 삭제
	public void calendarDelete(HttpServletRequest req, Model model);
	/* 일정 끝 */
	
	/* 업무관리 시작 */
	//업무관리 등록 화면
	public void createSelfTaskWrite(HttpServletRequest req, Model model);
	//업무관리 등록 insert-pro
	public void createSelfTaskPro(HttpServletRequest req, Model model);
	//업무관리 내가 한 업무요청
	public void orderList(HttpServletRequest req, Model model);
	//업무관리 내가 한 요청업무 상세 조회
	public void readOrderList(HttpServletRequest req, Model model);
	//업무관리 업무요청 수정 화면
	public void updateTaskView(HttpServletRequest req, Model model);
	//업무관리 업무요청 수정 pro
	public void updateTaskPro(HttpServletRequest req, Model model);
	/* 업무관리 끝 */
}
