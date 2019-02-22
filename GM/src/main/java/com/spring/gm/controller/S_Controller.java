package com.spring.gm.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gm.service.J_Service;
import com.spring.gm.service.S_Service;

@Controller
public class S_Controller {
	private static final Logger logger = LoggerFactory.getLogger(S_Controller.class);
	
	@Autowired
	S_Service service;
	J_Service jservice;
	
	/* 선빈이 콘트롤러에 작성
	// 로그인
	@RequestMapping("/login")
	public String test(HttpServletRequest request, Model model) {
		logger.info("URL : login");
		
		return "pages/login";
	}
	*/
	
	// 쪽지함
	@RequestMapping("/pages/S_message_inbox")
	public String massageBox(HttpServletRequest req, Model model) {
		logger.info("URL : S_message_inbox");
		
		/*service.messageBoxList(req, model);*/	
		return "pages/S_message_inbox";
	}
	
	// 쪽지함 만들기
	@RequestMapping("/pages/S_createMessageBox")
	public String createMassageBox(HttpServletRequest req, Model model) {
		logger.info("URL : S_createMessageBox");
		
		return "pages/S_createMessageBox";
	}
	
	// 쪽지
	@RequestMapping("/pages/S_message")
	public String mail(HttpServletRequest req, Model model) {
		logger.info("URL : S_message");
		
		/*service.messageList(req, model);*/
		return "pages/S_message";
	}
	
	// 쪽지 쓰기
	@RequestMapping("/pages/S_sendMessageForm")
	public String sendMessage(HttpServletRequest req, Model model) {
		logger.info("URL : S_sendMessageForm");
		
		return "pages/S_sendMessageForm";
	}
	
	// 쪽지 쓰기 처리
	@RequestMapping("/pages/S_sendMessagePro")
	public String sendMessagePro(HttpServletRequest req, Model model) {
		logger.info("URL : S_sendMessagePro");
		
		return "pages/S_sendMessagePro";		
	}
}
