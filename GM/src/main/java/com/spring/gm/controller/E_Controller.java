package com.spring.gm.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gm.service.E_Service;

@Controller
public class E_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(E_Controller.class);
	
	@Autowired
	E_Service service;
	
	@RequestMapping("/eaddressGroup")
	public String addressGroup(HttpServletRequest req, Model model) {
		logger.info("URL : addressGroup");
		
		return "/views/pages/E_addressGroup";
	}
	

}
