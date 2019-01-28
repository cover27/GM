package com.spring.gm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.gm.persistence.D_DAO;
import com.spring.gm.vo.BoardListVO;
import com.spring.gm.vo.BoardsVO;


@Service
public class D_ServiceImpl implements D_Service{

	@Autowired
	D_DAO dao;
	
	@Override
	// 게시판 작성
	public void insertBoards(HttpServletRequest req, Model model) {
		
		BoardsVO vo = new BoardsVO();		// 바구니 생성
		String group = req.getParameter("groupId");	
		int groupId = Integer.parseInt(group);
		String b_name = req.getParameter("b_name");
		String anon_i = req.getParameter("anon");
		int anon = Integer.parseInt(anon_i);
		int del = 0;
		
		vo.setGroupId(groupId);		// 가져온 값들을 바구니에 담음
		vo.setB_name(b_name);
		vo.setAnon(anon);
		vo.setDel(del);
		
		
		int insertCnt = dao.insertBoards(vo);	//jsp로 가져온값들을 insert하고 다시 
		
		req.setAttribute("insertCnt",insertCnt);
		
	}

	@Override
	// 게시판 목록
	public void boardsList(HttpServletRequest req, Model model) {
		
		int pageSize = 10; 		// 한페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 글갯수
		int start = 0;			// 현재 페이지 시작 글번호
		int end = 0;			// 현재 페이지 마지막 글번호
		int number = 0;			// 출력용 글번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		int groupId = 0;
	
		cnt = dao.getBoardsArticleCnt();
		
		System.out.println("cnt : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	// 첫페이지를 1페이지로 지정
		}
		
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1
		
		start = (currentPage - 1) * pageSize + 1; 
		
		end = start + pageSize - 1;
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		if(end > cnt) end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize;  // 출력용 글번호
		
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		
		if(cnt > 0) {
			//게시판 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("groupId", groupId);
			map.put("start", start);
			map.put("end", end);
			
			List<BoardsVO> dtos = dao.getBoardsArticleList(map);
			
			req.setAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글 1건
		}
		
		// 시작페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("startPage : " + startPage);
				
		// 마지막 페이지
		endPage = startPage + pageBlock - 1; 
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("================");
		
		req.setAttribute("cnt", cnt);  // 글갯수
		req.setAttribute("number", number); // 출력용 글번호
		req.setAttribute("pageNum", pageNum);  // 페이지번호
		
		if(cnt > 0) {
			req.setAttribute("startPage", startPage);     // 시작 페이지
			req.setAttribute("endPage", endPage);         // 마지막 페이지
			req.setAttribute("pageBlock", pageBlock);     // 출력할 페이지 갯수
			req.setAttribute("pageCount", pageCount);     // 페이지 갯수
			req.setAttribute("currentPage", currentPage); // 현재페이지
		}		
	}

	@Override
	// 게시글 목록
	public void boardList(HttpServletRequest req, Model model) {
		
		int pageSize = 10; 		// 한페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 글갯수
		int start = 0;			// 현재 페이지 시작 글번호
		int end = 0;			// 현재 페이지 마지막 글번호
		int number = 0;			// 출력용 글번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지		
	
		cnt = dao.getBoardArticleCnt();
		
		System.out.println("cnt : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	// 첫페이지를 1페이지로 지정
		}
		
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1
		
		start = (currentPage - 1) * pageSize + 1; 
		
		end = start + pageSize - 1;
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		if(end > cnt) end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize;  // 출력용 글번호
		
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		
		if(cnt > 0) {
			//게시판 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			List<BoardListVO> dtos = dao.getBoardArticleList(map);
			
			req.setAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글 1건
		}
		
		// 시작페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("startPage : " + startPage);
				
		// 마지막 페이지
		endPage = startPage + pageBlock - 1; 
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("================");
		
		req.setAttribute("cnt", cnt);  // 글갯수
		req.setAttribute("number", number); // 출력용 글번호
		req.setAttribute("pageNum", pageNum);  // 페이지번호
		
		if(cnt > 0) {
			req.setAttribute("startPage", startPage);     // 시작 페이지
			req.setAttribute("endPage", endPage);         // 마지막 페이지
			req.setAttribute("pageBlock", pageBlock);     // 출력할 페이지 갯수
			req.setAttribute("pageCount", pageCount);     // 페이지 갯수
			req.setAttribute("currentPage", currentPage); // 현재페이지
		}		
	}

	@Override
	public void boardUpdate(HttpServletRequest req, Model model) {
		
		BoardsVO vo = new BoardsVO();		// 바구니 생성
		String group = req.getParameter("groupId");	
		int groupId = Integer.parseInt(group);
		String b_name = req.getParameter("b_name");
		String anon_i = req.getParameter("anon");
		int anon = Integer.parseInt(anon_i);
		
		vo.setGroupId(groupId);		// 가져온 값들을 바구니에 담음
		vo.setB_name(b_name);
		vo.setAnon(anon);
		
		
		int upateCnt = dao.updateBoards(vo);	//jsp로 가져온값들을 insert하고 다시 
		
		req.setAttribute("upateCnt",upateCnt);
		
	}

	@Override
	public void boardDelete(HttpServletRequest req, Model model) {
		
		BoardsVO vo = new BoardsVO();		// 바구니 생성
		String delNumber = req.getParameter("del");
		int del = Integer.parseInt(delNumber);
		
		vo.setDel(del);
		
		int deleteCnt = dao.deleteBoards(vo);	//jsp로 가져온값들을 insert하고 다시 
		
		req.setAttribute("deleteCnt", deleteCnt);
		
	}
	
	

}
