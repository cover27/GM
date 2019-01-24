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
	
	// 이메일
	@RequestMapping("/mail")
	public String mail(HttpServletRequest request, Model model) {
		logger.info("URL : mail");
		
		return "pages/S_mail";
	}
	
	// 이메일
	@RequestMapping("/test")
	public String test(HttpServletRequest request, Model model) {
		logger.info("URL : test");
		
		return "pages/login";
	}
}
