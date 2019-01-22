package com.spring.gm.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.gm.service.E_Service;

@Controller
public class E_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(E_Controller.class);
	
	@Autowired
	E_Service eservice;
	
	

}
