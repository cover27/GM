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
	
	//오정 service
	@Autowired
	O_Service oservice;
	
	//업무관리 클릭 화면 및 수신업무 요청 화면
	@RequestMapping("/O_listTodoView")
	public String O_listTodoView(HttpServletRequest req, Model model) {
		logger.info("URL : O_listTodoView");
		
		return "pages/O_listTodoView";
	}
	
	//업무 등록 화면
	@RequestMapping("/O_createSelfTaskView")
	public String O_createSelfTaskView(HttpServletRequest req, Model model) {
		logger.info("URL : O_createSelfTaskView");
		
		return "pages/O_createSelfTaskView";
	}
	
	//나의 할 일 화면
	@RequestMapping("/O_listMyTodoView")
	public String O_listMyTodoView(HttpServletRequest req, Model model) {
		logger.info("URL : O_listMyTodoView");
		
		return "pages/O_listMyTodoView";
	}
}
