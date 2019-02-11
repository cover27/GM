package com.spring.gm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.gm.persistence.J_DAO;
import com.spring.gm.vo.BonusCutVO;
import com.spring.gm.vo.CompaniesVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.SalaryVO;
import com.spring.gm.vo.join_mgcVO;


@Service
public class J_ServiceImpl implements J_Service {

	@Autowired
	J_DAO dao;

	// 전체 급여 회원 뽑기
	@Override
	public void salaryList(HttpServletRequest req, Model model) {
		int pageSize = 10; // 한페이지당 출력할 글 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재페이지
		String content = "";
		
		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지
		
		pageNum = req.getParameter("pageNum");
		content = req.getParameter("contents");
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();

		System.out.println("회사번호 :" + company);
		// 5단계-1. 글갯수 구하기
		cnt = dao.selectCnt(company);
		System.out.println("cnt : " + cnt); // 먼저 테이블에 30건을 insert

		pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1"; // 첫페이지를 1페이지로 지정
		}
		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum); // 현재 페이지 : 1
		System.out.println("currentPage : " + currentPage);
		// 페이지 갯수 6 = (30 / 5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1
		// 현재 페이지 시작 글번호 1 (페이지별)
		// 1 = (1 - 1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1;
		// 현재 페이지 마지막 글번호 (페이지별)
		// 5 = 1 + 5 - 1;
		end = start + pageSize - 1;
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		if (end > cnt)
			end = cnt;
		// 출력용 글번호
		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize; // 출력용 글번호
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		if (cnt > 0) {
			// 5-2. 게시글 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("company", company);
			List<join_mgcVO> dtos = new ArrayList<join_mgcVO>();
			List<join_mgcVO> dtos2 = dao.selectList2(map); // depart가 회사번호
			System.out.println("여기 탔다2");
			System.out.println(dtos2.toString());
			List<join_mgcVO> dtos3 = dao.selectList3(map); // depart가 부서번호
			System.out.println("여기 탔다3");
			dtos.addAll(dtos2);
			dtos.addAll(dtos3);
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글 1건
		}
		// 시작페이지
		// 1 = (1 / 3) * 3 + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;
		System.out.println("startPage : " + startPage);
		// 마지막 페이지
		// 3 = 1 + 3 - 1;
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("================");

		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("pageNum", pageNum); // 페이지번호
		System.out.println("content :" + content);
		model.addAttribute("content", content);

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
			model.addAttribute("content", content);
		}
	}

	// Ajax 개인정보 가져오기
	@Override
	public void infoList(HttpServletRequest req, Model model) {
		String strId = req.getParameter("id");

		/* 장훈수정 시작 */
		// id 뒤에 자꾸 붙어서 나오는?null이라는 문자열을 없애기

		/*
		 * // 방법1 String id = strId.replace("?null", ""); System.out.println(id);
		 */

		// id 값 줄이기
		System.out.println(strId.length());
		int idLength = strId.length();
		System.out.println(idLength - 5);
		String id = strId.substring(0, idLength - 5);
		System.out.println("아놔 썅 : " + id);

		/* 장훈수정 끝 */

		System.out.println("id :" + id);

		List<MemberVO> dtos = dao.infoList(id);
		System.out.println("여기 탔다");
		System.out.print(dtos.toString());
		model.addAttribute("dtos", dtos);
	}

	// 회원 급여 개인정보 업데이트
	@Override
	public void infoUpdate(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		System.out.println("id :" + id);
		String account_number = req.getParameter("account_number");
		System.out.println("account_number :" + account_number);
		int salary = Integer.parseInt(req.getParameter("salary"));
		System.out.println("salary :" + salary);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("account_number", account_number);
		map.put("salary", salary);
		int updateCnt = dao.infoUpdate(map);
		System.out.println("updateCnt :" + updateCnt);
	}
	
	// 검색 회원급여정보 가져오기
	@Override
	public void search_salaryList(HttpServletRequest req, Model model) {
		// commpany 정보 가져오기
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getDepart();

		System.out.println("회사 번호 :" + company);

		String search_title = req.getParameter("search_title");
		System.out.println("search_title :" + search_title);
		String search_content = req.getParameter("search_content");
		System.out.println("search_content :" + search_content);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_title", search_title);
		map.put("search_content", search_content);
		map.put("company", company);

		int cnt = dao.search_salaryCnt(map);
		System.out.println(cnt);

		if (cnt == 1) {
			List<join_mgcVO> dtos = dao.searchinfoList(map);
			System.out.println(dtos.toString());
			model.addAttribute("dtos", dtos);
			model.addAttribute("cnt", cnt);
		}
	}
	
	// 개인 급여등록(이번달 목록 가져오기)
	@Override
	public void J_PayrollRegistrationList(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getDepart();
		System.out.println("company :" + company);
		String id = req.getParameter("id");
		System.out.println("id :" + id);
		int rank = Integer.parseInt(req.getParameter("rank"));
		System.out.println("rank :" + rank);
		String j_name = req.getParameter("j_name");
		System.out.println("j_name :" + j_name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("company", company);
		int cnt = dao.J_PayrollRegistrationCnt(map);
		System.out.println("cnt : " + cnt);
		if(cnt > 0) {
			System.out.println("1");
			List<SalaryVO> dtos = dao.J_PayrollRegistrationList(map);
			System.out.println(dtos.toString());
			model.addAttribute("dtos", dtos);
		}else if(cnt == 0) {
			System.out.println("2");
			List<MemberVO> dtos = dao.J_PayrollRegistrationInsertList(map);
			model.addAttribute("dtos",dtos);
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("rank",rank);
		model.addAttribute("j_name",j_name);
	}
	// 개인 급여등록
	@Override
	public void J_PayrollRegistrationInsert(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
	// ------------------- 기본수당 외 수당관리 --------------------
	// 회사명 가져오기
	@Override
	public void companyName(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		List<CompaniesVO> dtos = null;
		dtos = dao.companyName(company);
		model.addAttribute("dtoss",dtos);
	}
	
	// 날짜만 입력하여 검색시
	@Override
	public void salarySearchList(HttpServletRequest req, Model model) {
		int pageSize = 10; // 한페이지당 출력할 글 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수
		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재페이지
		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		System.out.println("회사번호 :" + company);
		String content2 = req.getParameter("search_content2");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("content2", content2);
		map.put("company", company);
		cnt = dao.selectCnt(map);
		System.out.println("cnt : " + cnt); // 먼저 테이블에 30건을 insert
		pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1"; // 첫페이지를 1페이지로 지정
		}
		currentPage = Integer.parseInt(pageNum); // 현재 페이지 : 1
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		if (end > cnt)
			end = cnt;
		number = cnt - (currentPage - 1) * pageSize; // 출력용 글번호
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		String title = req.getParameter("search_title");
		String content = req.getParameter("search_content");
		String title2 = req.getParameter("search_title2");
		map.put("title", title);
		map.put("content", content);
		map.put("title2", title2);
		map.put("start", start);
		map.put("end", end);


		List<join_mgcVO> dtos = new ArrayList<join_mgcVO>();
		List<join_mgcVO> dtos2 = null;
		List<join_mgcVO> dtos3 = null;
		if (cnt > 0) {
			System.out.println("여기 탑니까?");
			if (content.length() == 4) { // 입사일 년도로 기준
				System.out.println("입사일 년도로 기준");
				dtos2 = dao.salarySearchList1_1(map);
				dtos3 = dao.salarySearchList1_2(map);
				dtos.addAll(dtos2);
				dtos.addAll(dtos3);
			} else if (content.length() == 6) { // 입사일 월로 기준
				System.out.println("입사일 월로 기준");
				dtos2 = dao.salarySearchList2_1(map);
				dtos3 = dao.salarySearchList2_2(map);
				dtos.addAll(dtos2);
				dtos.addAll(dtos3);
			} else if (content.length() == 8) { // 입사일 일짜로 기준
				System.out.println("입사일 일짜로 기준");
				dtos2 = dao.salarySearchList3_1(map);
				dtos3 = dao.salarySearchList3_2(map);
				dtos.addAll(dtos2);
				dtos.addAll(dtos3);
			}
		}
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;
		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("================");
		
		model.addAttribute("dtos",dtos);
		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("pageNum", pageNum); // 페이지번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
	}
	
	// 수당 검색 회원목록 가져오기 (depart검색시 날짜입력이 없을시)
	@Override
	public void salarySearchNoneDepartList(HttpServletRequest req, Model model) {
		int pageSize = 10; // 한페이지당 출력할 글 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수
		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재페이지
		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		System.out.println("회사번호 :" + company);
		String content2 = req.getParameter("search_content2");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("content2", content2);
		map.put("company", company);
		cnt = dao.selectNoneDepartCnt(map);
		System.out.println("cnt : " + cnt); // 먼저 테이블에 30건을 insert
		pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1"; // 첫페이지를 1페이지로 지정
		}
		currentPage = Integer.parseInt(pageNum); // 현재 페이지 : 1
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		if (end > cnt)
			end = cnt;
		number = cnt - (currentPage - 1) * pageSize; // 출력용 글번호
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		if (cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			List<join_mgcVO> dtos = null;
			dtos = dao.selectNoneDepartList(map);
			System.out.println(dtos.toString());
			model.addAttribute("dtos", dtos);
			model.addAttribute("cnt", cnt);
		}
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;
		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("================");

		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("pageNum", pageNum); // 페이지번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
	}

	// 수당 검색 회원목록 가져오기 (id검색시 날짜입력이 없을시)
	@Override
	public void salarySearchNoneIdList(HttpServletRequest req, Model model) {
		int pageSize = 10; // 한페이지당 출력할 글 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수
		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재페이지
		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		System.out.println("회사번호 :" + company);
		String content2 = req.getParameter("search_content2");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("content2", content2);
		map.put("company", company);
		cnt = dao.selectNoneIdCnt(map);
		System.out.println("cnt : " + cnt); // 먼저 테이블에 30건을 insert
		pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1"; // 첫페이지를 1페이지로 지정
		}
		currentPage = Integer.parseInt(pageNum); // 현재 페이지 : 1
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		if (end > cnt)
			end = cnt;
		number = cnt - (currentPage - 1) * pageSize; // 출력용 글번호
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		List<join_mgcVO> dtos = new ArrayList<join_mgcVO>();
		List<join_mgcVO> dtos2 = null;
		List<join_mgcVO> dtos3 = null;
		if (cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			dtos2 = dao.selectNoneIdList(map);
			dtos3 = dao.selectNoneIdList2(map);
			dtos.addAll(dtos2);
			dtos.addAll(dtos3);
			model.addAttribute("dtos", dtos);
			model.addAttribute("cnt", cnt);
		}
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;
		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("================");

		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("pageNum", pageNum); // 페이지번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
	}

	// 수당 검색 회원목록 가져오기(depart)
	@Override
	public void salarySearchDepartList(HttpServletRequest req, Model model) {

		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		System.out.println("회사번호 :" + company);
		String title = req.getParameter("search_title");
		String content = req.getParameter("search_content");
		String title2 = req.getParameter("search_title2");
		String content2 = req.getParameter("search_content2");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("content", content);
		map.put("company", company);
		map.put("title2", title2);
		map.put("content2", content2);

		List<join_mgcVO> dtos = new ArrayList<join_mgcVO>();
		if ( content.length() == 4) { // 입사일 년도로 기준
			System.out.println("입사일 년도로 기준");
			dtos = dao.salaryDepartSearchList1(map);
		} else if (content.length() == 6) { // 입사일 월로 기준
			System.out.println("입사일 월로 기준");
			dtos = dao.salaryDepartSearchList2(map);
		} else if ( content.length() == 8) { // 입사일 일짜로 기준
			System.out.println("입사일 일짜로 기준");
			dtos = dao.salaryDepartSearchList3(map);
		}
		model.addAttribute("dtos", dtos);
		model.addAttribute("cnt", 1);
		model.addAttribute("content", content);
	}

	// 수당 검색 회원목록 가져오기(id)
	@Override
	public void salarySearchIdList(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		System.out.println("회사번호 :" + company);
		String title = req.getParameter("search_title");
		String content = req.getParameter("search_content");
		String title2 = req.getParameter("search_title2");
		String content2 = req.getParameter("search_content2");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("content", content);
		map.put("company", company);
		map.put("title2", title2);
		map.put("content2", content2);


		List<join_mgcVO> dtos = new ArrayList<join_mgcVO>();
		List<join_mgcVO> dtos2 = null;
		List<join_mgcVO> dtos3 = null;
		if (title != null && content.length() == 4) { // 입사일 년도로 기준
			System.out.println("입사일 년도로 기준");
			dtos2 = dao.salaryIdSearchList1_1(map);
			dtos3 = dao.salaryIdSearchList1_2(map);
			dtos.addAll(dtos2);
			dtos.addAll(dtos3);
		} else if ( content.length() == 6) { // 입사일 월로 기준
			System.out.println("입사일 월로 기준");
			dtos2 = dao.salaryIdSearchList2_1(map);
			dtos3 = dao.salaryIdSearchList2_2(map);
			dtos.addAll(dtos2);
			dtos.addAll(dtos3);
		} else if ( content.length() == 8) { // 입사일 일짜로 기준
			System.out.println("입사일 일짜로 기준");
			dtos2 = dao.salaryIdSearchList3_1(map);
			dtos3 = dao.salaryIdSearchList3_2(map);
			dtos.addAll(dtos2);
			dtos.addAll(dtos3);
		}
		System.out.println(dtos.toString());
		model.addAttribute("dtos", dtos);
		model.addAttribute("cnt", 1);
		model.addAttribute("content", content);
	}

	// 수당 - 개인회원 수당 기본정보
	@Override
	public void J_extrapayinfo(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		System.out.println("id : " + id);
		int cnt = dao.J_extrapayinfoCnt(id);
		System.out.println("cnt :" + cnt);

		List<BonusCutVO> dtos = dao.J_extrapayinfo(id);
		System.out.println("dtos :" + dtos.toString());
		model.addAttribute("dtos", dtos);
		model.addAttribute("cnt", cnt);
		model.addAttribute("id", id);
	}

	// 개인 급여수당정보 가져오기(Ajax) - 날짜 검색
	@Override
	public void J_extrapayinfo2(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		System.out.println("id : " + id);
		String content = req.getParameter("content");
		System.out.println("content :" + content);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("content",content);
		int cnt = 0;
		List<BonusCutVO> dtos = null;
		if(content.length() == 0) {
			System.out.println("1");
			cnt = dao.J_extrapayinfoCnt(id);
			System.out.println(cnt);
			dtos = dao.J_extrapayinfo(id);
		}
		if(content.length() == 4) { //년
			System.out.println("2");
			cnt = dao.J_extrapayinfoCnt2_1(map);
			System.out.println("cnt :" + cnt);
			dtos = dao.J_extrapayinfo2_1(map);
		}else if(content.length() == 6) {	//월
			System.out.println("3");
			cnt = dao.J_extrapayinfoCnt2_2(map);
			System.out.println("cnt :" + cnt);
			dtos = dao.J_extrapayinfo2_2(map);
		}else if(content.length() == 8) {	//일
			System.out.println("4");
			cnt = dao.J_extrapayinfoCnt2_3(map);
			System.out.println("cnt :" + cnt);
			dtos = dao.J_extrapayinfo2_3(map);
		}
		
		System.out.println("dtos :" + dtos.toString());
		model.addAttribute("dtos", dtos);
		model.addAttribute("cnt", cnt);
		model.addAttribute("id", id);
	}

	@Override
	public void J_extrapayinfoUpdate(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		System.out.println("id :" + id);
		String[] type = req.getParameterValues("type");
		for (int i = 0; i < type.length; i++) {
			System.out.println("type : " + type[i]);
		}
		String[] state = req.getParameterValues("state");
		for (int i = 0; i < type.length; i++) {
			System.out.println("state : " + state[i]);
		}
		String[] cost_s = req.getParameterValues("cost");
		/*
		 * for(int i=0;i<type.length;i++) { System.out.println("salary_s : " +
		 * salary_s[i]); }
		 */
		int[] cost = new int[cost_s.length];
		for (int i = 0; i < cost_s.length; i++) {
			cost[i] = Integer.parseInt(cost_s[i]);
			System.out.println("salary : " + cost[i]);
		}
		String[] content = req.getParameterValues("content");
		for (int i = 0; i < type.length; i++) {
			System.out.println("content : " + content[i]);
		}

		for (int i = 0; i < type.length; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("type", type[i]);
			map.put("state", state[i]);
			map.put("cost", cost[i]);
			map.put("content", content[i]);
			map.put("id", id);
			int cnt = dao.J_extrapayinfoUpdate(map);
			System.out.println("cnt : " + cnt);
			model.addAttribute("cnt", cnt);
		}
	}

	// 개인 급여수당정보 삭제하기
	@Override
	public void deleteInfo(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		System.out.println("num : " + num);
		BonusCutVO vo = dao.numId(num);
		String id = vo.getId();
		System.out.println("id : " + id);
		int cnt = dao.deleteInfo(num);
		System.out.println("cnt:" + cnt);
		List<BonusCutVO> dtos = dao.J_extrapayinfo(id);
		System.out.println("dtos : " + dtos.toString());
		model.addAttribute("dtos", dtos);
		model.addAttribute("cnt", cnt);
		model.addAttribute("id", id);
	}
	// 수당 개인 급여수당정보 수정
	@Override
	public void J_ExtrapayInfoModified(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		System.out.println("num : " + num);
		List<BonusCutVO> dtos = dao.J_ExtrapayInfoModified(num);
		model.addAttribute("dtos",dtos);
	}
	// 수당 개인 급여수당정보 수정완료
	@Override
	public void J_ExtrapayInfoModifiedComplete(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		System.out.println("num : " + num);
		String state = req.getParameter("state");	// 삭감/추기
		System.out.println("state : " + state);
		int cost = Integer.parseInt(req.getParameter("cost"));	//금액
		System.out.println("cost : " + cost);
		String type = req.getParameter("type");	//	지급 미지급
		System.out.println("type : " + type);
		String content = req.getParameter("content");	// 사유
		System.out.println("content : " + content);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("state", state);
		map.put("cost",cost);
		map.put("type", type);
		map.put("content", content);
		int cnt = dao.J_ExtrapayInfoModifiedComplete(map);
		System.out.println("cnt:" + cnt);
		if(cnt >0) {
			BonusCutVO vo = dao.numId(num);
			String id = vo.getId();
			List<BonusCutVO> dtos = dao.J_extrapayinfo(id);
			System.out.println("dtos : " + dtos.toString());
			model.addAttribute("dtos", dtos);
			model.addAttribute("cnt", cnt);
			model.addAttribute("id", id);
		}
	}

	//------------------수당 조회-----------------------------
	// 상여 조회(아이디 검색 정보 가져오기)
	@Override
	public void searchId(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		System.out.println("company =" + company);
		String id = req.getParameter("id");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("company", company);
		int cnt = dao.searchIdCnt(map);
		if(cnt >0) {
		List<join_mgcVO> dtos = new ArrayList<join_mgcVO>();
		List<join_mgcVO> dtos2 = dao.searchIdList(map); // depart가 회사번호
		List<join_mgcVO> dtos3 = dao.searchIdList2(map); // depart가 부서번호
		dtos.addAll(dtos2);
		dtos.addAll(dtos3);
		System.out.println(dtos.toString());
		model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글 1건
		}
		model.addAttribute("cnt",cnt);
	}
	//검색 결과값으로 정보 가져오기
	@Override
	public void searchPayrollInquiry(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		System.out.println("company: " + company);
		String months = req.getParameter("month");
		System.out.println("months: " + months);
		String id = req.getParameter("id");
		System.out.println("id: " + id);
		
		
	}



}
