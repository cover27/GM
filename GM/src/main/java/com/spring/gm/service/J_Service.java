package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface J_Service {
	
	// 회원 기본정보
	public void salaryList(HttpServletRequest req, Model model);
	// 검색 기본정보 가져오기
	public void search_salaryList(HttpServletRequest req, Model model);
	//급여 개인회원정보 가져오기
	public void infoList(HttpServletRequest req, Model model);
	// 회원 급여 개인정보 업데이트
	public void infoUpdate(HttpServletRequest req, Model model);
	
	//------------------기본수당 외 수당 관리-----------------------------
	// 급여 개인회원수당 정보 가져오기
	public void J_extrapayinfo(HttpServletRequest req, Model model);
}
