package com.spring.gm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.gm.persistence.J_DAO;
import com.spring.gm.vo.MemberVO;

import sun.security.jca.GetInstance;

@Service
public class J_ServiceImpl implements J_Service {

	@Autowired
	J_DAO dao;

	@Override
	public void salaryList(HttpServletRequest req, Model model) {
		String pagenum = req.getParameter("pageNum");
		System.out.println("pagenum :" + pagenum);
		
		int pageSize = 5; // 한페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 5단계-1. 글갯수 구하기
		cnt = dao.selectCnt();

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
			// ArrayList<boardVO> dtos = dao.getArticleList(start, end);

			List<MemberVO> dtos = dao.selectList(map);
			System.out.println("여기 탔다");
			req.setAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글 1건
		}

		// 6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)

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

		req.setAttribute("cnt", cnt); // 글갯수
		req.setAttribute("number", number); // 출력용 글번호
		req.setAttribute("pageNum", pageNum); // 페이지번호

		if (cnt > 0) {
			req.setAttribute("startPage", startPage); // 시작 페이지
			req.setAttribute("endPage", endPage); // 마지막 페이지
			req.setAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			req.setAttribute("pageCount", pageCount); // 페이지 갯수
			req.setAttribute("currentPage", currentPage); // 현재페이지
		}
	}

	@Override
	public void infoList(HttpServletRequest req, Model model) {
		String strId = req.getParameter("id");
		
		/* 장훈수정 시작 */
		// id 뒤에 자꾸 붙어서 나오는?null이라는 문자열을 없애기
		
		/*
		// 방법1
		String id = strId.replace("?null", "");
		System.out.println(id);
		*/
		
		// 방법2
		System.out.println(strId.length());
		int idLength = strId.length();
		System.out.println(idLength - 5);
		String id = strId.substring(0, idLength - 5);
		
		/* 장훈수정 끝 */
		
		
		System.out.println("id :" + id );
		
		List<MemberVO> dtos = dao.infoList(id);
		System.out.println("여기 탔다");
		req.setAttribute("dtos", dtos);
	}

}
