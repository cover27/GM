package com.spring.gm.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class J_Controller {
	private static final Logger logger = LoggerFactory.getLogger(J_Controller.class);
	
	@Autowired
	
	// 이메일
	@RequestMapping("/salary")
	public String salary(HttpServletRequest request, Model model) {
		logger.info("URL : salary");
		
		return "pages/J_salary";
	}
}
