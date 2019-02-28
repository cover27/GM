package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface S_Service {
	
	
	public void messageList(HttpServletRequest req, Model model);		// 받은쪽지 리스트
	
	public void messageContent(HttpServletRequest req, Model model);	// 쪽지 상세페이지
	
	public void sendMessagePro(HttpServletRequest req, Model model);		// 쪽지 쓰기 처리
	
	public void sendList(HttpServletRequest req, Model model);			// 보넨쪽지 목록
	
	public void sendMessageData(HttpServletRequest req, Model model);	// 보넨 메세지 저장
	
	public void sendDeletePro(HttpServletRequest req, Model model);		// 보넨 메세지 삭제
	
	public void sendDelPro(HttpServletRequest req, Model model);	// 보넨 메세지 삭제할 경우 상대방 받은 메세지도 삭제
	
	public void moveGarbage(HttpServletRequest req, Model model);		// 휴지통 보네기
	
	public void garbageList(HttpServletRequest req, Model model);		// 휴지통 목록
	
	public void delGarbage(HttpServletRequest req, Model model);		// 휴지통 내용물 삭제처리
	
	public void contentDelete(HttpServletRequest req, Model model);		// 상세페이지 삭제
	
	public void sendContentDelete(HttpServletRequest req, Model model);	// 보넨메세지 상세 삭제
	
}
