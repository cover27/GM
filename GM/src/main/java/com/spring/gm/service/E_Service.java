package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface E_Service {

	// 메모 목록
	public void memoList(HttpServletRequest req, Model model);
	
}
