package com.spring.gm.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gm.service.S_Service;

@Controller
public class S_Controller {
	private static final Logger logger = LoggerFactory.getLogger(S_Controller.class);
	
	@Autowired
	S_Service service;
	
	/* 선빈이 콘트롤러에 작성
	// 로그인
	@RequestMapping("/login")
	public String test(HttpServletRequest request, Model model) {
		logger.info("URL : login");
		
		return "pages/login";
	}
	*/
	
	// 이메일
	@RequestMapping("/pages/S_mail_inbox")
	public String mail(HttpServletRequest req, Model model) {
		logger.info("URL : mail");
		
		service.mailBoxList(req, model);
		return "pages/S_mail_inbox";
	}
}
