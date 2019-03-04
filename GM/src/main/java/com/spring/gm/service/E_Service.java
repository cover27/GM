package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface E_Service {

	// 사원 목록
	public void myCompanyMember(HttpServletRequest req, Model model);
	
	// 부서 목록
	public void departList(HttpServletRequest req, Model model);
	
	// 부서사원 목록
	public void departMember(HttpServletRequest req, Model model);
	
	// 자주 연락하는 사람 목록
	public void myFavoriteMemberList(HttpServletRequest req, Model model);
	
	// 멤버 상세페이지
	public void memberContents(HttpServletRequest req, Model model);
	

}
