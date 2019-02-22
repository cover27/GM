package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface S_Service {
	
	public void messageList(HttpServletRequest req, Model model);		// 쪽지 리스트

	public void messageBoxList(HttpServletRequest req, Model model);	// 쪽지 목록
	
	public void sendMessagePro(HttpServletRequest req, Model model);		// 쪽지 쓰기 처리
}
