package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface O_Service {

	//기안문 작성
	public void createApprDoc(HttpServletRequest req, Model model);
}
