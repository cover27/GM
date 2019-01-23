package com.spring.gm.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gm.service.O_Service;

@Controller
public class O_Controller {

	private static final Logger logger = LoggerFactory.getLogger(O_Controller.class);	
	
	@Autowired
	O_Service oservice;
	
	@RequestMapping("/O_todo")
	public String O_todo(HttpServletRequest req, Model model) {
		logger.info("URL : O_todo");
		
		return "pages/O_todo";
	}
	
	
}
