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
	//일정 메인 화면 view
	public void O_calendarMainView(HttpServletRequest req, Model model);
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
	//업무관리 업무요청 삭제 pro
	public void updateTaskDeletePro(HttpServletRequest req, Model model);
	//업무관리 수신 업무 요청 화면
	public void listTodo(HttpServletRequest req, Model model);
	//업무요청 - 수신 업무 요청 상세 조회 처리 - pro
	public void readSubTodoSuccessPro(HttpServletRequest req, Model model);
	//업무요청 - 업무 완료함 화면
	public void completeList(HttpServletRequest req, Model model);
	//관리자 메뉴 - 업무 문서 관리
	public void adminTodoList(HttpServletRequest req, Model model);
	//업무관리의 view 페이지 검색기능
	public void W_searchTodoTool(HttpServletRequest req, Model model);
	/* 업무관리 끝 */
}
