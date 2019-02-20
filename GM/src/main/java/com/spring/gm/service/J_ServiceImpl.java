
package com.spring.gm.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.gm.persistence.J_DAO;
import com.spring.gm.persistence.K_DAO;
import com.spring.gm.vo.AttendedSetVO;
import com.spring.gm.vo.AttendedVO;
import com.spring.gm.vo.BonusCutVO;
import com.spring.gm.vo.CompaniesVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.SalaryVO;
import com.spring.gm.vo.join_maVO;
import com.spring.gm.vo.join_mgcVO2;
import com.spring.gm.vo.join_mgsbVO;
import com.spring.gm.vo.join_mgsbcVO;
import com.spring.gm.vo.join_msVO;

@Service
public class J_ServiceImpl implements J_Service {

	@Autowired
	J_DAO dao;
	@Autowired
	K_DAO K_dao;

	// 전체 급여 회원 뽑기
	@Override
	public void salaryList(HttpServletRequest req, Model model) {
		int pageSize = 100; // 한페이지당 출력할 글 갯수
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
			List<join_mgcVO2> dtos = new ArrayList<join_mgcVO2>();
			List<join_mgcVO2> dtos2 = dao.selectList2(map); // depart가 회사번호
			System.out.println("여기 탔다2");
			System.out.println(dtos2.toString());
			List<join_mgcVO2> dtos3 = dao.selectList3(map); // depart가 부서번호
			System.out.println("여기 탔다3");
			System.out.println(dtos3.toString());
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
		String id = req.getParameter("id");
		System.out.println("id :" + id);
		String j_name = req.getParameter("j_name");
		System.out.println("j_name : " + j_name);
		String r_name = req.getParameter("r_name");
		System.out.println("r_name :" + r_name);
		/* 장훈수정 시작 */
		// id 뒤에 자꾸 붙어서 나오는?null이라는 문자열을 없애기

		/*
		 * // 방법1 String id = strId.replace("?null", ""); System.out.println(id);
		 */

		/*
		 * // id 값 줄이기 System.out.println(strId.length()); int idLength =
		 * strId.length(); System.out.println(idLength - 5); String id =
		 * strId.substring(0, idLength - 5); System.out.println("아놔 썅 : " + id);
		 */

		/* 장훈수정 끝 */

		System.out.println("id :" + id);

		List<MemberVO> dtos = dao.infoList(id);
		System.out.println("여기 탔다");
		System.out.print(dtos.toString());
		model.addAttribute("dtos", dtos);
		model.addAttribute("j_name", j_name);
		model.addAttribute("r_name", r_name);
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
			List<join_mgcVO2> dtos = dao.searchinfoList(map);
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
		String r_name = req.getParameter("r_name");
		System.out.println("r_name :" + r_name);
		String j_name = req.getParameter("j_name");
		System.out.println("j_name :" + j_name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("company", company);
		int cnt = dao.J_PayrollRegistrationCnt(map);
		System.out.println("cnt : " + cnt);
		if (cnt > 0) { // 월급정보가 있으면 월급정보 가져오기
			System.out.println("1");
			List<join_msVO> dtos = dao.J_PayrollRegistrationList(map);
			System.out.println(dtos.toString());
			model.addAttribute("dtos", dtos);
		} else if (cnt == 0) { // 월급 정보가 없으면 인설트할 테이블에 정보 가져가기
			System.out.println("2");
			int selectcnt = dao.bonussalaryCnt(map);
			if (selectcnt > 0) {
				List<join_mgsbVO> dtos = dao.J_PayrollRegistrationInsertList2(map);
				model.addAttribute("dtos", dtos);
			} else if (selectcnt == 0) {
				List<MemberVO> dtos = dao.J_PayrollRegistrationInsertList(map);
				model.addAttribute("dtos", dtos);
			}
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("r_name", r_name);
		model.addAttribute("j_name", j_name);
	}

	// 개인 급여등록
	@Override
	public void J_PayrollRegistrationInsert(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getDepart();
		System.out.println("company :" + company);
		String id = req.getParameter("id");
		System.out.println("id :" + id);
		int salary = Integer.parseInt(req.getParameter("salary"));
		System.out.println("salary :" + salary);
		String state = req.getParameter("state");
		System.out.println("state :" + state);
		String month = req.getParameter("month");
		System.out.println("month :" + month);
		String r_name = req.getParameter("r_name");
		System.out.println("r_name :" + r_name);
		String j_name = req.getParameter("j_name");
		System.out.println("j_name :" + j_name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("company", company);
		map.put("salary", salary);
		map.put("state", state);
		map.put("month", month);
		int cnt = dao.J_PayrollRegistrationInsert(map);
		System.out.println("updatecnt :" + cnt);

		// <!-- 급여등록에서 미지급 지급으로 처리할 시 추가 및 삭감 (이번달 -1 달의 )정보를 미지급-> 지급으로 처리 -->
		dao.ChangePayments(map);

		int selectCnt = dao.J_extrapayinfoCnt(id);
		if (selectCnt == 0) {
			int insertCnt = dao.insertProcess(id);
			System.out.println("insertCnt :" + insertCnt);
		}
		List<join_msVO> dtos = dao.J_PayrollRegistrationList(map);
		System.out.println(dtos.toString());
		model.addAttribute("dtos", dtos);
		model.addAttribute("cnt", cnt);
		model.addAttribute("r_name", r_name);
		model.addAttribute("j_name", j_name);
	}

	// 미지급 지급으로 처리
	@Override
	public void J_PayrollRegistrationchange(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getDepart();
		System.out.println("company :" + company);
		String r_name = req.getParameter("r_name");
		System.out.println("r_name :" + r_name);
		String j_name = req.getParameter("j_name");
		System.out.println("j_name :" + j_name);
		String id = req.getParameter("id");
		System.out.println("id :" + id);
		String state = "지급";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("state", state);
		map.put("company", company);
		int updateCnt = dao.J_PayrollRegistrationchange(map);
		System.out.println("updateCnt : " + updateCnt);

		// <!-- 급여등록에서 미지급 지급으로 처리할 시 추가 및 삭감 (이번달 -1 달의 )정보를 미지급-> 지급으로 처리 -->
		dao.ChangePayments(map);

		// 지급 처리후 정보 가져오기
		int cnt = dao.J_PayrollRegistrationCnt(map);
		List<join_msVO> dtos = dao.J_PayrollRegistrationList(map);
		System.out.println(dtos.toString());
		model.addAttribute("dtos", dtos);
		model.addAttribute("cnt", cnt);
		model.addAttribute("r_name", r_name);
		model.addAttribute("j_name", j_name);
	}

	// 정보 삭제
	@Override
	public void J_PayrollRegistrationListDelete(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getDepart();
		System.out.println("company :" + company);
		String id = req.getParameter("id");
		System.out.println("id :" + id);
		String sal_num = req.getParameter("sal_num");
		System.out.println("sal_num :" + sal_num);
		String j_name = req.getParameter("j_name");
		String r_name = req.getParameter("r_name");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("sal_num", sal_num);
		map.put("company", company);
		dao.J_PayrollRegistrationListDelete(map);

		// <!-- 급여등록 삭제시 추가 및 삭감 미지급으로 처리-->
		dao.ChangeUnpaid(map);

		int cnt = dao.J_PayrollRegistrationCnt(map);
		System.out.println("cnt : " + cnt);
		if (cnt > 0) { // 월급정보가 있으면 월급정보 가져오기
			System.out.println("1");
			List<join_msVO> dtos = dao.J_PayrollRegistrationList(map);
			System.out.println(dtos.toString());
			model.addAttribute("dtos", dtos);
		} else if (cnt == 0) { // 월급 정보가 없으면 인설트할 테이블에 정보 가져가기
			System.out.println("2");
			int selectcnt = dao.bonussalaryCnt(map);
			if (selectcnt > 0) {
				List<join_mgsbVO> dtos = dao.J_PayrollRegistrationInsertList2(map);
				model.addAttribute("dtos", dtos);
			} else if (selectcnt == 0) {
				List<MemberVO> dtos = dao.J_PayrollRegistrationInsertList(map);
				model.addAttribute("dtos", dtos);
			}
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("j_name", j_name);
		model.addAttribute("r_name", r_name);
	}

	// ------------------- 기본수당 외 수당관리 --------------------
	// 회사명 가져오기
	@Override
	public void companyName(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		List<CompaniesVO> dtos = null;
		dtos = dao.companyName(company);
		model.addAttribute("dtoss", dtos);
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

		List<join_mgcVO2> dtos = new ArrayList<join_mgcVO2>();
		List<join_mgcVO2> dtos2 = null;
		List<join_mgcVO2> dtos3 = null;
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

		model.addAttribute("dtos", dtos);
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
			List<join_mgcVO2> dtos = null;
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
		List<join_mgcVO2> dtos = new ArrayList<join_mgcVO2>();
		List<join_mgcVO2> dtos2 = null;
		List<join_mgcVO2> dtos3 = null;
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

		List<join_mgcVO2> dtos = new ArrayList<join_mgcVO2>();
		if (content.length() == 4) { // 입사일 년도로 기준
			System.out.println("입사일 년도로 기준");
			dtos = dao.salaryDepartSearchList1(map);
		} else if (content.length() == 6) { // 입사일 월로 기준
			System.out.println("입사일 월로 기준");
			dtos = dao.salaryDepartSearchList2(map);
		} else if (content.length() == 8) { // 입사일 일짜로 기준
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

		List<join_mgcVO2> dtos = new ArrayList<join_mgcVO2>();
		List<join_mgcVO2> dtos2 = null;
		List<join_mgcVO2> dtos3 = null;
		if (title != null && content.length() == 4) { // 입사일 년도로 기준
			System.out.println("입사일 년도로 기준");
			dtos2 = dao.salaryIdSearchList1_1(map);
			dtos3 = dao.salaryIdSearchList1_2(map);
			dtos.addAll(dtos2);
			dtos.addAll(dtos3);
		} else if (content.length() == 6) { // 입사일 월로 기준
			System.out.println("입사일 월로 기준");
			dtos2 = dao.salaryIdSearchList2_1(map);
			dtos3 = dao.salaryIdSearchList2_2(map);
			dtos.addAll(dtos2);
			dtos.addAll(dtos3);
		} else if (content.length() == 8) { // 입사일 일짜로 기준
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
		map.put("content", content);
		int cnt = 0;
		List<BonusCutVO> dtos = null;
		if (content.length() == 0) {
			System.out.println("1");
			cnt = dao.J_extrapayinfoCnt(id);
			System.out.println(cnt);
			dtos = dao.J_extrapayinfo(id);
		}
		if (content.length() == 4) { // 년
			System.out.println("2");
			cnt = dao.J_extrapayinfoCnt2_1(map);
			System.out.println("cnt :" + cnt);
			dtos = dao.J_extrapayinfo2_1(map);
		} else if (content.length() == 6) { // 월
			System.out.println("3");
			cnt = dao.J_extrapayinfoCnt2_2(map);
			System.out.println("cnt :" + cnt);
			dtos = dao.J_extrapayinfo2_2(map);
		} else if (content.length() == 8) { // 일
			System.out.println("4");
			cnt = dao.J_extrapayinfoCnt2_3(map);
			System.out.println("cnt :" + cnt);
			dtos = dao.J_extrapayinfo2_3(map);
		}

		System.out.println("dtos :" + dtos.toString());
		model.addAttribute("dtos", dtos);
		model.addAttribute("cnt", cnt);
		model.addAttribute("id", id);
		model.addAttribute("contents", content);
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
		int cost = Integer.parseInt(req.getParameter("cost"));
		System.out.println("cost : " + cost);
		String state = req.getParameter("state");
		System.out.println("state :" + state);
		String contents = req.getParameter("contents");
		System.out.println("contents :" + contents);
		BonusCutVO vo = dao.numId(num);
		String id = vo.getId();
		System.out.println("id : " + id);
		int cnt = dao.deleteInfo(num);
		System.out.println("cnt:" + cnt);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("contents", contents);
		map.put("cost", cost);

		if (state.equals("지급")) {
			if (cost > 0) { // 금액이 +일때 뺴주기
				dao.modifySalary(map);
			} else if (cost < 0) { // 금액이 -일때 금액 더해주기
				dao.modifySalary2(map);
			}
		}

		List<BonusCutVO> dtos = dao.J_extrapayinfo2(map);
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
		model.addAttribute("dtos", dtos);
	}

	// 수당 개인 급여수당정보 수정완료
	@Override
	public void J_ExtrapayInfoModifiedComplete(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		System.out.println("num : " + num);
		String state = req.getParameter("state"); // 삭감/추기
		System.out.println("state : " + state);
		int cost = Integer.parseInt(req.getParameter("cost")); // 금액
		System.out.println("cost : " + cost);
		String type = req.getParameter("type"); // 지급 미지급
		System.out.println("type : " + type);
		String content = req.getParameter("content"); // 사유
		System.out.println("content : " + content);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("state", state);
		map.put("cost", cost);
		map.put("type", type);
		map.put("content", content);
		int cnt = dao.J_ExtrapayInfoModifiedComplete(map);
		System.out.println("cnt:" + cnt);
		if (cnt > 0) {
			BonusCutVO vo = dao.numId(num);
			String id = vo.getId();
			List<BonusCutVO> dtos = dao.J_extrapayinfo(id);
			System.out.println("dtos : " + dtos.toString());
			model.addAttribute("dtos", dtos);
			model.addAttribute("cnt", cnt);
			model.addAttribute("id", id);
		}
	}

	// ------------------수당 조회-----------------------------
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
		if (cnt > 0) {
			List<join_mgcVO2> dtos = new ArrayList<join_mgcVO2>();
			List<join_mgcVO2> dtos2 = dao.searchIdList(map); // depart가 회사번호
			List<join_mgcVO2> dtos3 = dao.searchIdList2(map); // depart가 부서번호
			dtos.addAll(dtos2);
			dtos.addAll(dtos3);
			System.out.println(dtos.toString());
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글 1건
		}
		model.addAttribute("cnt", cnt);
	}

	// ------------------급여 조회-----------------------------
	// 급여조회 - 검색 결과값으로 정보 가져오기
	@Override
	public void searchPayrollInquiry(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		System.out.println("company: " + company);
		String months = req.getParameter("month");
		String[] month = months.split("-");
		months = month[0] + month[1];
		System.out.println("months: " + months);
		String id = req.getParameter("id");
		System.out.println("id: " + id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("company", company);
		map.put("months", months);

		int cnt2 = dao.mgstblCnt(map); // 급여 정보 뽑아오기
		System.out.println("cnt2 : " + cnt2);
		int cnt3 = dao.mgstblCnt2(map);// 상여금 정보 뽑아오기
		System.out.println("cnt3 : " + cnt3);
		if (cnt2 > 0) {cnt2 = 1;};
		if (cnt3 > 0) {cnt3 = 1;};
		int cnt = cnt2 + cnt3;
		System.out.println("cnt : " + cnt);
		if (cnt3 == 0 && cnt2 == 1) {cnt = 1;}
		if (cnt3 == 1 && cnt2 == 0) {cnt = 0;}

		if (cnt == 2) { // 급여 , 상여금 둘다 정보가 있을경우
			System.out.println("급여 , 상여금 둘다 정보가 있을경우");

			List<join_mgsbVO> dtos = new ArrayList<join_mgsbVO>();
			List<join_mgsbVO> dtos2 = dao.mgstbl(map);
			System.out.println("dtos2 :" + dtos2.toString());
			List<join_mgsbVO> dtos3 = dao.mgstbl2(map);
			System.out.println("dtos3 :" + dtos3.toString());
			List<join_mgsbVO> dtos4 = dao.bonustbl(map);
			System.out.println("dtos4 :" + dtos4.toString());
			List<join_mgsbVO> dtos5 = dao.bonustbl2(map);
			dtos.addAll(dtos2);
			dtos.addAll(dtos3);

			dtos.get(0).setBonussalary(dtos4.get(0).getBonussalary());
			dtos.get(0).setSumsalarybonus((dtos.get(0).getSalary() + dtos4.get(0).getBonussalary()));
			System.out.println("dtos.get(0).getDay() :" + dtos.get(0).getDay());

			int sumsalarybonus = dtos.get(0).getSalary() + dtos4.get(0).getBonussalary();
			int bonussalary = dtos.get(0).getBonussalary();
			int salary = dtos.get(0).getSalary();

			System.out.println("sumsalarybonus : " + sumsalarybonus);
			model.addAttribute("sumsalarybonus", sumsalarybonus);
			model.addAttribute("bonussalary", bonussalary);
			model.addAttribute("salary", salary);
			model.addAttribute("dtos", dtos);
			model.addAttribute("dtos2", dtos5);
		}

		if (cnt == 1) { // 급여만 존재한 경우
			System.out.println("급여만 존재한 경우");
			List<join_mgsbVO> dtos = new ArrayList<join_mgsbVO>();
			List<join_mgsbVO> dtos2 = dao.mgstbl(map);
			System.out.println("dtos2 :" + dtos2.toString());
			List<join_mgsbVO> dtos3 = dao.mgstbl2(map);
			System.out.println("dtos3 :" + dtos3.toString());
			dtos.addAll(dtos2);
			dtos.addAll(dtos3);

			int salary = dtos.get(0).getSalary();
			model.addAttribute("salary", salary);
			model.addAttribute("dtos", dtos);
		}

		model.addAttribute("cnt", cnt);
		model.addAttribute("cnt2", cnt3);
	}

	// -----------------------------급여 계산-------------------------------------------
	// 급여 계산 목록 가져오기
	@Override
	public void J_SalaryCalculationSearch(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		System.out.println("company: " + company);
		String id = req.getParameter("id");
		System.out.println("id: " + id);
		String month = req.getParameter("month");
		System.out.println("month: " + month);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("company", company);
		map.put("month", month);
		if (month.length() == 0) { // 검색 날짜가 없을경우 오늘 날짜년도로 뽑음
			int cnt = dao.J_SalaryCalculationSearchCnt(map);
			if (cnt > 0) {
				List<join_mgsbVO> dtos = dao.J_SalaryCalculationSearchList(map);
				int sumsalarybonus = dtos.get(0).getSumsalarybonus();
				model.addAttribute("Sumsalaybonus", sumsalarybonus);
				model.addAttribute("dtos", dtos);
				model.addAttribute("cnt", cnt);
			}
		}
		if (month.length() == 4) { // 검색 날짜가 있을 경우
			int cnt = dao.J_SalaryCalculationSearchCnt2(map);
			if (cnt > 0) {
				System.out.println("여기타냐");
				int sumsalarybonus = 0;
				List<join_mgsbVO> dtos = dao.J_SalaryCalculationSearchList2(map);
				for (int i = 0; i < dtos.size(); i++) {
					sumsalarybonus += dtos.get(i).getSumsalarybonus();
				}
				System.out.println("Sumsalaybonus: " + sumsalarybonus);
				model.addAttribute("Sumsalaybonus", sumsalarybonus);
				model.addAttribute("dtos", dtos);
				model.addAttribute("cnt", cnt);
			}
		}
		model.addAttribute("company", company);
	}

	// -----------------------------상여조희--------------------------------------------
	// 상여 조회 목록 가져오기
	@Override
	public void searchBonusInquiry(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		System.out.println("company: " + company);
		String months = req.getParameter("month");
		String[] month = months.split("-");
		months = month[0] + month[1];
		System.out.println("months: " + months);
		String id = req.getParameter("id");
		System.out.println("id: " + id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("company", company);
		map.put("months", months);

		int cnt = dao.bonusNoneCnt2(map);// 상여금 정보 뽑아오기
		System.out.println("cnt : " + cnt);

		if (cnt > 0) {
			List<join_mgsbVO> dtos = new ArrayList<join_mgsbVO>();
			List<join_mgsbVO> dtos1 = dao.bonusList(map); // 부서로 검색
			List<join_mgsbVO> dtos2 = dao.bonusList2(map);// 사업장으로 검색
			dtos.addAll(dtos1);
			dtos.addAll(dtos2);
			List<join_mgsbVO> dtos3 = dao.bonustbl3(map);
			int bonussalary = dtos3.get(0).getBonussalary();
			System.out.println("dtos :" + dtos.toString());
			model.addAttribute("dtos", dtos);
			model.addAttribute("bonussalary", bonussalary);
		}

		// 상여 미지급 목록 뽑아내기
		int cnt2 = dao.bonusNoneCnt(map);// 상여금 정보 뽑아오기
		System.out.println("cnt2 : " + cnt2);

		if (cnt2 > 0) {
			List<join_mgsbVO> dtos = new ArrayList<join_mgsbVO>();
			List<join_mgsbVO> dtos1 = dao.bonusNoneList(map); // 부서로 검색
			List<join_mgsbVO> dtos2 = dao.bonusNoneList2(map);// 사업장으로 검색
			dtos.addAll(dtos1);
			dtos.addAll(dtos2);
			List<join_mgsbVO> dtos3 = dao.bonustbl4(map);
			int bonussalary = dtos3.get(0).getBonussalary();
			System.out.println("dtos :" + dtos.toString());
			model.addAttribute("dtos2", dtos);
			model.addAttribute("bonussalary2", bonussalary);
		}

		model.addAttribute("cnt2", cnt2);
		model.addAttribute("cnt", cnt);
	}

	// ------------------급여 대장-----------------------------
	// 아이디 검색 이번년도 급여대장정보 가져오기 아이디 검색.
	@Override
	public void searchPayroll(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		String id = req.getParameter("id");
		int num = 0;
		System.out.println("num :" + num);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("company", company);
		int cnt = dao.IdSearchCnt(map);
		System.out.println("cnt : " + cnt);
		int bonussalary = 0;
		int sumsalarybonus = 0;
		int allsalary = 0;
		int year = 201900;

		String cntyear = String.valueOf(year);
		cntyear = cntyear.substring(0, 4);

		List<join_mgsbcVO> dtos = new ArrayList<join_mgsbcVO>();
		if (cnt > 0) {
			for (int i = 1; i <= 12; i++) {
				if (i == 1) {
					year = 201812;
					System.out.println("year :" + year);
					map.put("year", year);
					List<join_mgsbcVO> dtos1 = dao.IdSearchList(map); // 부서로 검색
					System.out.println("dtos1 :" + dtos1.toString());
					List<join_mgsbcVO> dtos2 = dao.IdSearchList2(map);// 사업장으로 검색
					if (dtos1.size() != 0) {
						dtos1.get(0).setSalaryday(i);
						allsalary = allsalary + dtos1.get(0).getSalary();
						bonussalary = bonussalary + dtos1.get(0).getBonussalary();
						sumsalarybonus = sumsalarybonus + dtos1.get(0).getSumsalarybonus();
					}
					dtos.addAll(dtos1);
					dtos.addAll(dtos2);
					map.remove("year");
					year = 201900;
				} else {
					year += i;
					System.out.println("year :" + year);
					map.put("year", year);
					List<join_mgsbcVO> dtos1 = dao.IdSearchList(map); // 부서로 검색
					System.out.println("dtos1 :" + dtos1.toString());
					List<join_mgsbcVO> dtos2 = dao.IdSearchList2(map);// 사업장으로 검색
					if (dtos1.size() != 0) {
						dtos1.get(0).setSalaryday(i);
						allsalary = allsalary + dtos1.get(0).getSalary();
						bonussalary = bonussalary + dtos1.get(0).getBonussalary();
						sumsalarybonus = sumsalarybonus + dtos1.get(0).getSumsalarybonus();
					}
					dtos.addAll(dtos1);
					dtos.addAll(dtos2);
					map.remove("year");
					year = 201900;
				}
			}
		}
		System.out.println("dtos :" + dtos.toString());
		model.addAttribute("dtos", dtos);
		model.addAttribute("allsalary", allsalary);
		model.addAttribute("bonussalary", bonussalary);
		model.addAttribute("sumsalarybonus", sumsalarybonus);
		model.addAttribute("num", num);
		model.addAttribute("year", year);
		model.addAttribute("cntyear", cntyear);
		model.addAttribute("cnt", cnt);
	}

	// 총 연도로 뽑기
	@Override
	public void searchPayroll2(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		String id = req.getParameter("id");
		int num = 0;
		num = num - 100;
		System.out.println("num :" + num);
		int year = Integer.parseInt(req.getParameter("year")) + num;
		System.out.println("year :" + year);
		String cntyear = String.valueOf(year);

		cntyear = cntyear.substring(0, 4);
		System.out.println("cntyear :" + cntyear);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("company", company);
		map.put("cntyear", cntyear);

		int cnt = dao.searchCnt2(map);
		System.out.println("cnt : " + cnt);
		int bonussalary = 0;
		int sumsalarybonus = 0;
		int allsalary = 0;

		List<join_mgsbcVO> dtos = new ArrayList<join_mgsbcVO>();
		if (cnt > 0) {
			for (int i = 1; i <= 12; i++) {
				if (num != 0) {

					if (i == 1) { // 1월달 급여는 전년도 12월 급여
						year = year + num + 12;
						System.out.println("year :" + year);
						map.put("year", year);
						List<join_mgsbcVO> dtos1 = dao.IdSearchList(map); // 부서로 검색
						System.out.println("dtos1 :" + dtos1.toString());
						List<join_mgsbcVO> dtos2 = dao.IdSearchList2(map);// 사업장으로 검색
						if (dtos1.size() != 0) {
							dtos1.get(0).setSalaryday(12);
							allsalary = allsalary + dtos1.get(0).getSalary();
							bonussalary = bonussalary + dtos1.get(0).getBonussalary();
							sumsalarybonus = sumsalarybonus + dtos1.get(0).getSumsalarybonus();
						}
						dtos.addAll(dtos1);
						dtos.addAll(dtos2);
						map.remove("year");
						year = year - num - 12;
					} else {
						year += i;
						System.out.println("year :" + year);
						map.put("year", year);
						List<join_mgsbcVO> dtos1 = dao.IdSearchList(map); // 부서로 검색
						System.out.println("dtos1 :" + dtos1.toString());
						List<join_mgsbcVO> dtos2 = dao.IdSearchList2(map);// 사업장으로 검색
						if (dtos1.size() != 0) {
							dtos1.get(0).setSalaryday(i - 1);
							allsalary = allsalary + dtos1.get(0).getSalary();
							bonussalary = bonussalary + dtos1.get(0).getBonussalary();
							sumsalarybonus = sumsalarybonus + dtos1.get(0).getSumsalarybonus();
						}
						dtos.addAll(dtos1);
						dtos.addAll(dtos2);
						map.remove("year");
						year = year - i;
					}
				}
			}
		}
		System.out.println("year :" + year);
		System.out.println("dtos :" + dtos.toString());
		model.addAttribute("dtos", dtos);
		model.addAttribute("allsalary", allsalary);
		model.addAttribute("bonussalary", bonussalary);
		model.addAttribute("sumsalarybonus", sumsalarybonus);
		model.addAttribute("num", num);
		model.addAttribute("year", year);
		model.addAttribute("cntyear", cntyear);
		model.addAttribute("cnt", cnt);
	}

	@Override
	public void searchPayroll3(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		String id = req.getParameter("id");
		int num = 0;
		num = num + 100;
		System.out.println("num :" + num);
		int year = Integer.parseInt(req.getParameter("year")) + num;
		System.out.println("year : " + year);
		String cntyear = String.valueOf(year);
		cntyear = cntyear.substring(0, 4);
		System.out.println("cntyear :" + cntyear);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("company", company);
		map.put("cntyear", cntyear);

		int cnt = dao.searchCnt2(map);
		System.out.println("cnt : " + cnt);
		int bonussalary = 0;
		int sumsalarybonus = 0;
		int allsalary = 0;

		List<join_mgsbcVO> dtos = new ArrayList<join_mgsbcVO>();
		if (cnt > 0) {
			for (int i = 1; i <= 12; i++) {
				if (num != 0) {
					System.out.println("year :" + year);
					if (i == 1) { // 1월달 급여는 전년도 12월 급여
						year = year - num + 12;
						System.out.println("year :" + year);
						map.put("year", year);
						List<join_mgsbcVO> dtos1 = dao.IdSearchList(map); // 부서로 검색
						System.out.println("dtos1 :" + dtos1.toString());
						List<join_mgsbcVO> dtos2 = dao.IdSearchList2(map);// 사업장으로 검색
						if (dtos1.size() != 0) {
							dtos1.get(0).setSalaryday(12);
							allsalary = allsalary + dtos1.get(0).getSalary();
							bonussalary = bonussalary + dtos1.get(0).getBonussalary();
							sumsalarybonus = sumsalarybonus + dtos1.get(0).getSumsalarybonus();
						}
						dtos.addAll(dtos1);
						dtos.addAll(dtos2);
						year = year + num - 12;
						map.remove("year");
					} else {
						year += i;
						System.out.println("year :" + year);
						map.put("year", year);
						List<join_mgsbcVO> dtos1 = dao.IdSearchList(map); // 부서로 검색
						System.out.println("dtos1 :" + dtos1.toString());
						List<join_mgsbcVO> dtos2 = dao.IdSearchList2(map);// 사업장으로 검색
						if (dtos1.size() != 0) {
							dtos1.get(0).setSalaryday(i - 1);
							allsalary = allsalary + dtos1.get(0).getSalary();
							bonussalary = bonussalary + dtos1.get(0).getBonussalary();
							sumsalarybonus = sumsalarybonus + dtos1.get(0).getSumsalarybonus();
						}
						dtos.addAll(dtos1);
						dtos.addAll(dtos2);
						map.remove("year");
						year = year - i;
					}
				}
			}
		}
		System.out.println("dtos :" + dtos.toString());
		model.addAttribute("dtos", dtos);
		model.addAttribute("allsalary", allsalary);
		model.addAttribute("bonussalary", bonussalary);
		model.addAttribute("sumsalarybonus", sumsalarybonus);
		model.addAttribute("num", num);
		model.addAttribute("year", year);
		model.addAttribute("cntyear", cntyear);
		model.addAttribute("cnt", cnt);
	}

	// 총 연도로 뽑기
	@Override
	public void yearPayroll(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		String month = req.getParameter("month");
		model.addAttribute("month", month);
		String cntyear = month;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cntyear", cntyear);
		map.put("company", company);

		int cnt = dao.searchCnt2(map);
		int salary = 0;
		int bonussalary = 0;
		int sumsalarybonus = 0;

		month = month + "00";
		int year = Integer.parseInt(month);
		System.out.println("month : " + month);
		List<join_mgsbcVO> dtos = new ArrayList<join_mgsbcVO>();
		if (cnt > 0) {
			for (int i = 1; i <= 12; i++) {
				year = year + i;
				System.out.println("year :" + year);
				map.put("year", year);
				List<join_mgsbcVO> dtos1 = dao.searchList(map); // 부서로 검색
				System.out.println("dtos1 :" + dtos1.toString());
				if (dtos1.size() != 0) {
					dtos1.get(0).setSalaryday(i);
					salary = salary + dtos1.get(0).getSalary();
					bonussalary = bonussalary + dtos1.get(0).getBonussalary();
					sumsalarybonus = sumsalarybonus + dtos1.get(0).getSumsalarybonus();
				}
				dtos.addAll(dtos1);
				year = year - i;
				map.remove("year");
			}
		}
		model.addAttribute("dtos", dtos);
		model.addAttribute("allsalary", salary);
		model.addAttribute("allbonussalary", bonussalary);
		model.addAttribute("allsumsalarybonus", sumsalarybonus);
		model.addAttribute("cnt", cnt);
	}

	// --------------------------------------------------------------------------------------------------------------------------
	// ---------------------------------------------근태관리------------------------------------------------------------------------

	// 시간 변경해주는 설정
	@Override // 32400 -> '09:00' 으로 변경하는 메소드
	public String toTime(int seconds) {
		int hour = seconds / 3600;
		int minute = (seconds % 3600) / 60;

		String hours = "";
		String minutes = "";

		if (hour < 10) {
			hours = "0" + String.valueOf(hour);
		} else {
			hours = String.valueOf(hour);
		}

		if (minute == 0) {
			minutes = "00";
		} else if (minute < 10) {
			minutes = "0" + String.valueOf(minute);
		} else {
			minutes = String.valueOf(minute);
		}

		String time = hours + ":" + minutes;
		return time;
	}

	@Override // 반대로 32400 <- '09:00' 으로 변경하는 메소드
	public int toSecond(String time) {
		String[] times = time.split(":");
		int hour = Integer.parseInt(times[0]);
		int minute = Integer.parseInt(times[1]);

		int seconds = hour * 3600 + minute * 60;
		return seconds;
	}

	// 출근 목록 뽑아오기
	@Override
	public void GoOffList(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		String id = ((MemberVO) req.getSession().getAttribute("loginInfo")).getId();
		String name = ((MemberVO) req.getSession().getAttribute("loginInfo")).getName();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("company", company);

		int selectCnt = dao.GoOffCnt(map);
		System.out.println("cnt : " + selectCnt);

		if (selectCnt > 0) {
			List<join_maVO> dtos = dao.GoOffList(map);
			System.out.println(dtos.get(0).getGo());
			int num = dtos.get(0).getNum();
			System.out.println("num : " + num);
			dtos.get(0).setGos(toTime(dtos.get(0).getGo()));
			String gos = toTime(dtos.get(0).getGo());
			dtos.get(0).setOffs(toTime(dtos.get(0).getOff()));
			dtos.get(0).setWorktimes(toTime(dtos.get(0).getWorktime()));
			dtos.get(0).setOvertimes(toTime(dtos.get(0).getOvertime()));
			dtos.get(0).setNighttimes(toTime(dtos.get(0).getNighttime()));
			dtos.get(0).setPerceptiontimes(toTime(dtos.get(0).getPerceptiontime()));
			dtos.get(0).setDeparturetimes(toTime(dtos.get(0).getDeparturetime()));
			System.out.println(toTime(dtos.get(0).getGo()));
			model.addAttribute("dtos", dtos);
			model.addAttribute("num", num);
			model.addAttribute("gos", gos);
		}
		model.addAttribute("cnt", selectCnt);
		model.addAttribute("id", id);
		model.addAttribute("name", name);
	}

	// 출근시간 인서트
	@Override
	public void goInsert(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		String id = ((MemberVO) req.getSession().getAttribute("loginInfo")).getId();
		String name = ((MemberVO) req.getSession().getAttribute("loginInfo")).getName();

		AttendedSetVO attended = null;
		attended = K_dao.getAttendedSet(company);

		long times = System.currentTimeMillis();
		SimpleDateFormat date = new SimpleDateFormat("YYYY-MM-dd kk:mm");
		String nowTime = date.format(new Date(times)).substring(11, 16);
		System.out.println(nowTime);
		int time = toSecond(nowTime);
		int ptime = toSecond(nowTime) - attended.getGo(); // 지각시간
		System.out.println(time + " " + ptime);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("company", company);
		map.put("time", time);
		map.put("ptime", ptime);

		int insertCnt = dao.goInsert(map);
		System.out.println("insertCnt :" + insertCnt);
		if (insertCnt > 0) {
			List<join_maVO> dtos = dao.GoOffList(map);
			int num = dtos.get(0).getNum();
			dtos.get(0).setGos(toTime(dtos.get(0).getGo()));
			String gos = toTime(dtos.get(0).getGo());
			dtos.get(0).setOffs(toTime(dtos.get(0).getOff()));
			dtos.get(0).setWorktimes(toTime(dtos.get(0).getWorktime()));
			dtos.get(0).setOvertimes(toTime(dtos.get(0).getOvertime()));
			dtos.get(0).setNighttimes(toTime(dtos.get(0).getNighttime()));
			dtos.get(0).setPerceptiontimes(toTime(dtos.get(0).getPerceptiontime()));
			dtos.get(0).setDeparturetimes(toTime(dtos.get(0).getDeparturetime()));
			System.out.println(toTime(dtos.get(0).getGo()));
			model.addAttribute("dtos", dtos);
			model.addAttribute("num", num);
			model.addAttribute("gos", gos);
		}
		model.addAttribute("cnt", insertCnt);
		model.addAttribute("id", id);
		model.addAttribute("name", name);
	}

	// 퇴근시간 업데이트
	@Override
	public void offUpdate(HttpServletRequest req, Model model) {
		int company = ((MemberVO) req.getSession().getAttribute("loginInfo")).getCompany();
		String id = ((MemberVO) req.getSession().getAttribute("loginInfo")).getId();
		String name = ((MemberVO) req.getSession().getAttribute("loginInfo")).getName();
		int num = Integer.parseInt(req.getParameter("num")); // 오늘 출퇴근 번호
		System.out.println("num : " + num);
		String gos = req.getParameter("gos"); // 출근시간
		System.out.println("gos : " + gos);
		int go = toSecond(gos);
		System.out.println("go : " + go);

		// 설정시간 가져오기
		AttendedSetVO attended = null;
		attended = K_dao.getAttendedSet(company);

		long times = System.currentTimeMillis();
		SimpleDateFormat date = new SimpleDateFormat("YYYY-MM-dd kk:mm");
		String nowTime = date.format(new Date(times)).substring(11, 16);
		System.out.println(nowTime);
		int time = toSecond(nowTime); // 퇴근시간
		int wtime = toSecond(nowTime) - go; // 근무 시간
		int ntime = 0; // 야간시간
		int otime = 0; // 연장시간
		int dtime = 0; // 조퇴시간
		
		System.out.println(time + " " + wtime);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("company", company);
		map.put("num", num);
		map.put("wtime", wtime);
		map.put("time", time);

		
		// 연장시간
		if (time > attended.getOver_start()) { 
			System.out.println("연장조건문");
			if (time < attended.getOver_end()) {
				otime = time - attended.getOver_start();
				map.put("otime", otime);
			} else if (time > attended.getOver_end()) {
				otime = 79200;
				map.put("otime", otime);
			}
		} else {
			otime = 0;
			map.put("otime", otime);
		}
		System.out.println("연장시간 : " + otime);
		
		// 야간시간
		if (time > attended.getNight_start()) { 
			System.out.println("야간조건문");
			if (time < attended.getNight_end()) {
				ntime = time - attended.getNight_start();
				map.put("ntime", ntime);
			} else if (time > attended.getNight_end()) {
				ntime = 79200;
				map.put("ntime", ntime);
			}
		}else {
			ntime = 0;
			map.put("ntime", ntime);
		}
		System.out.println("야간조건문 : " + ntime);
		
		
		// 조퇴시간
		if(time < attended.getOff()) {
			System.out.println("조퇴할경우");
			dtime = time;
			map.put("dtime", dtime);
		}else {
			System.out.println("조퇴시간조건문");
			dtime = 0;
			map.put("dtime", dtime);
		}
		System.out.println("조퇴시간 : " + dtime);
		
		System.out.println("map : " + map.toString());
		int updateCnt = dao.offUpdate(map);
		System.out.println("updateCnt : " + updateCnt);
		if (updateCnt > 0) {
			List<join_maVO> dtos = dao.GoOffList(map);
			num = dtos.get(0).getNum();
			dtos.get(0).setGos(toTime(dtos.get(0).getGo()));
			gos = toTime(dtos.get(0).getGo());
			dtos.get(0).setOffs(toTime(dtos.get(0).getOff()));
			dtos.get(0).setWorktimes(toTime(dtos.get(0).getWorktime()));
			dtos.get(0).setOvertimes(toTime(dtos.get(0).getOvertime()));
			dtos.get(0).setNighttimes(toTime(dtos.get(0).getNighttime()));
			dtos.get(0).setPerceptiontimes(toTime(dtos.get(0).getPerceptiontime()));
			dtos.get(0).setDeparturetimes(toTime(dtos.get(0).getDeparturetime()));
			System.out.println(toTime(dtos.get(0).getGo()));
			model.addAttribute("dtos", dtos);
			model.addAttribute("num", num);
			model.addAttribute("gos", gos);
		}
		model.addAttribute("cnt", updateCnt);
		model.addAttribute("id", id);
		model.addAttribute("name", name);
	}

}
