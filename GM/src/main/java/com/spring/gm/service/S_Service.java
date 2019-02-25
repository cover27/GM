package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface S_Service {
	
	
	public void messageList(HttpServletRequest req, Model model);		// 받은쪽지 리스트
	
	public void sendMessagePro(HttpServletRequest req, Model model);		// 쪽지 쓰기 처리
	
	public void sendList(HttpServletRequest req, Model model);			// 보넨쪽지 목록
	
	public void sendMessageData(HttpServletRequest req, Model model);	// 보넨 메세지 저장
	
	public void sendDeletePro(HttpServletRequest req, Model model);		// 보넨 메세지 삭제
	
	public void moveGarbage(HttpServletRequest req, Model model);		// 휴지통 보네기
	
	public void garbageList(HttpServletRequest req, Model model);		// 휴지통 목록
	
	public void delGarbage(HttpServletRequest req, Model model);		// 휴지통 내용물 삭제처리
}
