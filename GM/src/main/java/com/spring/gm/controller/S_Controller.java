package com.spring.gm.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gm.service.E_Service;
import com.spring.gm.service.J_Service;
import com.spring.gm.service.S_Service;

@Controller
public class S_Controller {
	private static final Logger logger = LoggerFactory.getLogger(S_Controller.class);
	
	@Autowired
	S_Service service;
	
	@Autowired
	J_Service jservice;
	
	@Autowired
	E_Service eservice;
	
	/* 선빈이 콘트롤러에 작성
	// 로그인
	@RequestMapping("/login")
	public String test(HttpServletRequest request, Model model) {
		logger.info("URL : login");
		
		return "pages/login";
	}
	*/
	@Transactional
	@RequestMapping("/pages/S_message_inbox")
	public String S_message_inbox(HttpServletRequest req, Model model) {
		logger.info("URL : S_message_inbox");

		service.messageList(req, model);
		service.messageListCnt(req, model);
		return "/pages/S_message_inbox";
	}

	/*
	@RequestMapping("/pages/S_receiveMessage")
	public String receiveMessage(HttpServletRequest req, Model model) {
		logger.info("URL : S_receiveMessage");
		
		
		service.messageList(req, model);
		return "/pages/S_receiveMessage";
	}
	*/
	
	// 쪽지
	@Transactional
	@RequestMapping("/pages/S_message")
	public String mail(HttpServletRequest req, Model model) {
		logger.info("URL : S_message");
		
		/*service.messageList(req, model);*/
		return "pages/S_message";
	}
	
	// 쪽지 쓰기
	@Transactional
	@RequestMapping("/pages/S_sendMessageForm")
	public String sendMessage(HttpServletRequest req, Model model) {
		logger.info("URL : S_sendMessageForm");
		
		service.messageListCnt(req, model);
		return "pages/S_sendMessageForm";
	}
	
	// 쪽지 쓰기 처리
	@Transactional
	@RequestMapping("/pages/S_sendMessagePro")
	public String sendMessagePro(HttpServletRequest req, Model model) {
		logger.info("URL : S_sendMessagePro");
		
		service.sendMessagePro(req, model);
		service.sendMessageData(req, model);
		service.messageListCnt(req, model);
		return "pages/S_sendMessagePro";		
	}
	@Transactional
	@RequestMapping("/pages/S_sendMessageList")
	public String sendMessageList(HttpServletRequest req, Model model) {
		logger.info("URL : S_sendMessageList");
		
		service.sendList(req, model);
		service.messageListCnt(req, model);
		return "pages/S_sendMessageList";
	}
	@Transactional
	@RequestMapping("/pages/S_moveGarbagePro")
	public String moveGarbage(HttpServletRequest req, Model model) {
		logger.info("URL : S_moveGarbagePro");
		
		service.moveGarbage(req, model);
		service.messageListCnt(req, model);
		return "pages/S_moveGarbagePro";
	}
	@Transactional
	@RequestMapping("/pages/S_garbageList")
	public String garbageList(HttpServletRequest req, Model model) {
		logger.info("URL : S_garbageList");
		
		service.garbageList(req, model);
		service.messageListCnt(req, model);
		return "pages/S_garbageList";
	}
	@Transactional
	@RequestMapping("/pages/S_delGarbagePro")
	public String delGarbage(HttpServletRequest req, Model model) {
		logger.info("URL : S_delGarbage");
		
		service.delGarbage(req, model);
		service.messageListCnt(req, model);
		return "pages/S_delGarbagePro";
	}
	@Transactional
	@RequestMapping("/pages/S_sendDeletePro")
	public String sendDeletePro(HttpServletRequest req, Model model) {
		logger.info("URL : S_sendDeletePro");
		
		service.sendDeletePro(req, model);
		service.sendDelPro(req, model);
		service.messageListCnt(req, model);
		return "pages/S_sendDeletePro";		
	}
	@Transactional
	@RequestMapping("/pages/S_contentMessage")
	public String contentMessage(HttpServletRequest req, Model model) {
		logger.info("URL : S_contentMessage");
		
		service.messageContent(req, model);
		service.messageListCnt(req, model);
		return "pages/S_contentMessage";		
	}
	@Transactional
	@RequestMapping("/pages/S_messageDeletePro")
	public String contentDelete(HttpServletRequest req, Model model) {
		logger.info("URL : S_messageDeletePro");
		service.contentDelete(req, model);
		service.messageListCnt(req, model);
		return "pages/S_messageDeletePro";	
	}
	@Transactional
	@RequestMapping("/pages/S_sendcontentMessage")
	public String endcontentMessage(HttpServletRequest req, Model model) {
		logger.info("URL : S_sendcontentMessage");
		
		service.messageContent(req, model);
		service.messageListCnt(req, model);
		return "pages/S_sendcontentMessage";	
	}
	@Transactional
	@RequestMapping("/pages/S_sendMessageDeletePro")
	public String sendContentDelete(HttpServletRequest req, Model model) {
		logger.info("URL : S_sendMessageDeletePro");
		service.sendContentDelete(req, model);
		service.sendContentDel(req, model);
		service.messageListCnt(req, model);
		return "pages/S_sendMessageDeletePro";	
	}
	@Transactional
	@RequestMapping("/pages/S_contentDelPro")
	public String contentDelPro(HttpServletRequest req, Model model) {
		logger.info("URL : S_contentDelPro");
		service.contentDelete(req, model);
		service.messageListCnt(req, model);
		return "pages/S_contentDelPro";	
	}
	@Transactional
	@RequestMapping("/pages/S_garbageContentDeletePro")
	public String garbageContentDelete(HttpServletRequest req, Model model) {
		logger.info("URL : S_garbageContentDeletePro");
		service.garbageContentDelete(req, model);
		service.messageListCnt(req, model);
		return "pages/S_garbageContentDeletePro";	
	}
	@Transactional
	@RequestMapping("pages/S_orgSendMessageForm")
	public String orgSendMessage(HttpServletRequest req, Model model) {
		logger.info("URL : S_orgSendMessageForm");
		service.orgSendMessageForm(req, model);
		eservice.departList(req, model);
		return "pages/S_orgSendMessageForm";		
	}	
	@Transactional
	@RequestMapping("pages/S_orgSendMessagePro")
	public String orgSendMessagePro(HttpServletRequest req, Model model) {
		logger.info("URL : S_orgSendMessagePro");
		service.orgsendMessagePro(req, model);
		service.orgsendMessageDataPro(req, model);
		return "pages/S_orgSendMessagePro";		
	}	
	@RequestMapping("pages/S_garbageContentRestorePro")
	public String garbageContentRestore(HttpServletRequest req, Model model) {
		logger.info("URL : S_garbageContentRestorePro");
		
		service.restoreGarbageContent(req, model);
		return "pages/S_garbageContentRestorePro";		
	}
	
	@RequestMapping("pages/S_garbageRestorePro")
	public String garbageRestore(HttpServletRequest req, Model model) {
		logger.info("URL : S_garbageContentRestorePro");
		
		service.restoreGarbage(req, model);
		return "pages/S_garbageRestorePro";		
	}

}
