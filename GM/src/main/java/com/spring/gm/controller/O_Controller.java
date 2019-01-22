package com.spring.gm.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.gm.service.O_Service;

@Controller
public class O_Controller {

	private static final Logger logger = LoggerFactory.getLogger(S_Controller.class);	
	
	@Autowired
	O_Service oservice;
	
}
