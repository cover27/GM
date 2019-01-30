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
import com.spring.gm.persistence.K_DAO;
import com.spring.gm.persistence.K_DAOImpl;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.join_mgcVO;

import sun.security.jca.GetInstance;

@Service
public class J_ServiceImpl implements J_Service {

	@Autowired
	J_DAO dao;
	
	//전체 급여 회원 뽑기
	@Override
	public void salaryList(HttpServletRequest req, Model model) {
		String pagenum = req.getParameter("pageNum");
		System.out.println("pagenum :" + pagenum);
 
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
			List<join_mgcVO> dtos2 = dao.selectList2(map);	// depart가 회사번호
			System.out.println("여기 탔다2");
			System.out.println(dtos2.toString());
			List<join_mgcVO> dtos3 = dao.selectList3(map);	//depart가 부서번호
			System.out.println("여기 탔다3");
			System.out.println(dtos3.toString());
			dtos.addAll(dtos2);
			dtos.addAll(dtos3);
			System.out.println(dtos.toString());
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
 
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
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
			List<MemberVO> dtos = dao.searchinfoList(map);
			System.out.println(dtos.toString());
			model.addAttribute("dtos", dtos);
			model.addAttribute("cnt", cnt);
		}
	}

}
