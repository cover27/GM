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
	// 개인 급여등록(이번달 목록 가져오기)
	public void J_PayrollRegistrationList(HttpServletRequest req, Model model);
	// 개인 급여등록
	public void J_PayrollRegistrationInsert(HttpServletRequest req, Model model);
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
	//미지급 지급으로 처리
	public void J_PayrollRegistrationchange(HttpServletRequest req, Model model);
	//정보 삭제
	public void J_PayrollRegistrationListDelete(HttpServletRequest req, Model model);
	
	//-----------------------------급여 계산-------------------------------------------
	//급여 계산 목록 가져오기
	public void J_SalaryCalculationSearch(HttpServletRequest req, Model model);
	//-----------------------------상여조희--------------------------------------------
	//상여 조회 목록 가져오기
	public void searchBonusInquiry(HttpServletRequest req, Model model);
	
	
	
	//------------------수당 조회-----------------------------
	// 상여 조회(아이디 검색 정보 가져오기)
	public void searchId(HttpServletRequest req, Model model);
	//검색 결과값으로 정보 가져오기
	public void searchPayrollInquiry(HttpServletRequest req, Model model);
	
	
	//------------------급여 대장-----------------------------
	// 아이디별 연도로 뽑기
	public void searchPayroll(HttpServletRequest req, Model model);
	public void searchPayroll2(HttpServletRequest req, Model model);//이전연도
	public void searchPayroll3(HttpServletRequest req, Model model);//다음연도
	
	// 총 연도로 뽑기
	public void yearPayroll(HttpServletRequest req, Model model); //년도 검색
	
	
	
	
	//--------------------------------------------------------------------------------------------------------------------------
	//---------------------------------------------근태관리------------------------------------------------------------------------
	
	// 시간 변경해주는 설정
	public String toTime(int seconds);	//초 -> 시간
	public int toSecond(String time);	// 시간 -> 초
	
	// 출근 목록 뽑아오기
	public void GoOffList(HttpServletRequest req, Model model);
	// 날짜로 출근 목록 뽑아오기
	public void searchList(HttpServletRequest req, Model model);
	
	//출근시간 인서트
	public void goInsert(HttpServletRequest req, Model model);
	//퇴근시간 업데이트
	public void offUpdate(HttpServletRequest req, Model model);
	
	//전체 리스트 뽑기
	public void allList(HttpServletRequest req, Model model);
	
	//사원 근태 수정
	public void modify(HttpServletRequest req, Model model);
	// 근태 수정 업데이트
	public void modifyUpdate(HttpServletRequest req, Model model);
	
	//월별 근태 정보 가져오기
	public void monthList(HttpServletRequest req, Model model);
	
	//휴가 목록 뽑아오기
	public void holiday(HttpServletRequest req, Model model);
	//연장근무 목록 뽑아오기
	public void overtime(HttpServletRequest req, Model model);
	//야간 목록 뽑아오기
	public void nighttime(HttpServletRequest req, Model model);
	
	//연차/휴가일수 조회
	public void VacationViews(HttpServletRequest req, Model model);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
