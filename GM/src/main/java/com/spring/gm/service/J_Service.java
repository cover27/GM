package com.spring.gm.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

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
	// 회사명 가져오기
	public void companyName(HttpServletRequest req, Model model);
	// 날짜만 입력하여 검색시
	public void salarySearchList(HttpServletRequest req, Model model);
	// 수당  검색 회원목록  가져오기 (depart검색시 날짜입력이 없을시)
	public void salarySearchNoneDepartList(HttpServletRequest req, Model model);
	// 수당  검색 회원목록  가져오기 (id검색시 날짜입력이 없을시)
	public void salarySearchNoneIdList(HttpServletRequest req, Model model);
	// 수당  검색 회원목록  가져오기(depart)
	public void salarySearchDepartList(HttpServletRequest req, Model model);
	// 수당  검색 회원목록 가져오기(id)
	public void salarySearchIdList(HttpServletRequest req, Model model);
	// 개인 급여수당정보 가져오기(Ajax) - 이번달
	public void J_extrapayinfo(HttpServletRequest req, Model model);
	// 개인 급여수당정보 가져오기(Ajax) - 날짜 검색
	public void J_extrapayinfo2(HttpServletRequest req, Model model);
	// 수당 개인 급여수당정보 업데이트
	public void J_extrapayinfoUpdate(HttpServletRequest req, Model model);
	// 수당 개인 급여수당정보 수정
	public void J_ExtrapayInfoModified(HttpServletRequest req, Model model);
	// 수당 개인 급여수당정보 수정완료
	public void J_ExtrapayInfoModifiedComplete(HttpServletRequest req, Model model);
	//  수당 개인 급여수당정보 삭제하기
	public void deleteInfo(HttpServletRequest req, Model model);
	
	//------------------수당 조회-----------------------------
	// 상여 조회(아이디 검색 정보 가져오기)
	public void searchId(HttpServletRequest req, Model model);
	//검색 결과값으로 정보 가져오기
	public void searchPayrollInquiry(HttpServletRequest req, Model model);
}
