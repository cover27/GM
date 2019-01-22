package com.spring.gm.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardsController {
	private static final Logger logger = LoggerFactory.getLogger(S_Controller.class);
	
	@RequestMapping("createBoards")
	public String createBoards(HttpServletRequest req, Model model) {
		logger.info("URL : createBoards");
		
		return "pages/createBoards";
	}
}
