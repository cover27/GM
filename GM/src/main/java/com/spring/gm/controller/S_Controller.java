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
	
	@RequestMapping("/pages/S_message_inbox")
	public String S_message_inbox(HttpServletRequest req, Model model) {
		logger.info("URL : S_message_inbox");

		service.messageList(req, model);
		return "/pages/S_message_inbox";
	}

	
	@RequestMapping("/pages/S_receiveMessage")
	public String receiveMessage(HttpServletRequest req, Model model) {
		logger.info("URL : S_receiveMessage");
		
		
		service.messageList(req, model);
		return "/pages/S_receiveMessage";
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
		
		service.sendMessagePro(req, model);
		service.sendMessageData(req, model);
		return "pages/S_sendMessagePro";		
	}
	
	@RequestMapping("/pages/S_sendMessageList")
	public String sendMessageList(HttpServletRequest req, Model model) {
		logger.info("URL : S_sendMessageList");
		
		service.sendList(req, model);
		return "pages/S_sendMessageList";
	}
	
	@RequestMapping("/pages/S_moveGarbagePro")
	public String moveGarbage(HttpServletRequest req, Model model) {
		logger.info("URL : S_moveGarbagePro");
		
		service.moveGarbage(req, model);
		return "pages/S_moveGarbagePro";
	}
	
	@RequestMapping("/pages/S_garbageList")
	public String garbageList(HttpServletRequest req, Model model) {
		logger.info("URL : S_garbageList");
		
		service.garbageList(req, model);
		return "pages/S_garbageList";
	}
	
	@RequestMapping("/pages/S_delGarbagePro")
	public String delGarbage(HttpServletRequest req, Model model) {
		logger.info("URL : S_delGarbage");
		
		service.delGarbage(req, model);
		return "pages/S_delGarbagePro";
	}
	
	@RequestMapping("/pages/S_sendDeletePro")
	public String sendDeletePro(HttpServletRequest req, Model model) {
		logger.info("URL : S_sendDeletePro");
		
		service.sendDeletePro(req, model);
		return "pages/S_sendDeletePro";		
	}
	
	@RequestMapping("/pages/S_contentMessage")
	public String contentMessage(HttpServletRequest req, Model model) {
		logger.info("URL : S_contentMessage");
		
		service.messageContent(req, model);
		return "pages/S_contentMessage";		
	}
	
	@RequestMapping("/pages/S_messageDeletePro")
	public String contentDelete(HttpServletRequest req, Model model) {
		logger.info("URL : S_messageDeletePro");
		service.contentDelete(req, model);
		return "pages/S_messageDeletePro";	
	}
	
	@RequestMapping("/pages/S_sendcontentMessage")
	public String endcontentMessage(HttpServletRequest req, Model model) {
		logger.info("URL : S_sendcontentMessage");
		
		service.messageContent(req, model);
		return "pages/S_sendcontentMessage";	
	}
	
	@RequestMapping("/pages/S_sendMessageDeletePro")
	public String sendContentDelete(HttpServletRequest req, Model model) {
		logger.info("URL : S_sendMessageDeletePro");
		service.contentDelete(req, model);
		return "pages/S_sendMessageDeletePro";	
	}
	
}
