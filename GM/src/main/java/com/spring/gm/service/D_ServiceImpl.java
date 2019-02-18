package com.spring.gm.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.gm.persistence.D_DAO;
import com.spring.gm.vo.BoardListAndBoardsVO;
import com.spring.gm.vo.BoardListVO;
import com.spring.gm.vo.BoardsVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.ReplyListVO;

@Service
public class D_ServiceImpl implements D_Service{

	@Autowired
	D_DAO dao;
	
	@Override
	// 게시판 작성
	public void insertBoards(HttpServletRequest req, Model model) {
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		BoardsVO vo = new BoardsVO();		// 바구니 생성

		String b_name = req.getParameter("b_name");
		String anon_i = req.getParameter("anon");
		int anon = Integer.parseInt(anon_i);
		int del = 0;
		
		vo.setB_name(b_name);
		vo.setAnon(anon);
		vo.setDel(del);
		
		vo.setGroupId(company);
		int insertCnt = dao.insertBoards(vo);	//jsp로 가져온값들을 insert하고 다시 
		
		model.addAttribute("insertCnt",insertCnt);
		
	}

	@Override
	// 게시판 목록
	public void boardsList(HttpServletRequest req, Model model) {
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		int pageSize = 100; 		// 한페이지당 출력할 글 갯수
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
	
		// 게시판 갯수
		cnt = dao.getBoardsArticleCnt(company);

		
		System.out.println("cnt(게시판 갯수) : " + cnt);

		
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
			map.put("company", company);
			
			List<BoardsVO> dtos = dao.getBoardsArticleList(map);
			

			model.addAttribute("b_dtos", dtos); // 큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글 1건

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
		
		model.addAttribute("cnt", cnt);  // 글갯수
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("pageNum", pageNum);  // 페이지번호
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);     // 시작 페이지
			model.addAttribute("endPage", endPage);         // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock);     // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount);     // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}		
	}

	@Override
	// 게시글 목록
	public void boardList(HttpServletRequest req, Model model) {
		
		int pageSize = 10; 		// 한페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;		// 글갯수
		int start = 0;			// 현재 페이지 시작 글번호
		int end = 0;			// 현재 페이지 마지막 글번호
		int number = 0;			// 출력용 글번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지		
		
		String num_s = req.getParameter("num");
		int num = Integer.parseInt(num_s);
		
		
		cnt = dao.getBoardArticleCnt();
		
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
			map.put("num", num);
			map.put("start", start);
			map.put("end", end);

			
			List<BoardListVO> dtos = dao.getBoardArticleList(map);
			
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글 1건

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

		model.addAttribute("num", num);
		model.addAttribute("cnt", cnt);  // 글갯수
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("pageNum", pageNum);  // 페이지번호
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);     // 시작 페이지
			model.addAttribute("endPage", endPage);         // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock);     // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount);     // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}		
	}
	
	
	// 게시글 수정 처리
	@Override
	public void boardUpdate(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		BoardListVO vo = null;
		vo = dao.getArticle(boardnum);

		
		model.addAttribute("num",num);
		model.addAttribute("vo", vo);
		model.addAttribute("boardnum", boardnum);
		model.addAttribute("pageNum", pageNum);
	}
	
	// 게시글 삭제
	@Override
	public void boardDelete(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int deleteCnt = 0;
		
		BoardListVO vo = new BoardListVO();
		vo.setBoardnum(boardnum);
		
		deleteCnt = dao.deleteBoard(boardnum);

		// 6단계. request나 session에 처리 결과를 저장(jsp에서 받아야 하니깐!)
		model.addAttribute("num", num);
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("boardnum", boardnum);		
		
	}
	
	// 게시글 작성 폼
	@Override
	public void insertBoard(HttpServletRequest req, Model model) {
		
		int boardnum = 0;		// 글 번호 
		int num = 0;
		int ref = 1;		// 답글 그룹화 아이디
		int ref_step = 0;	// 글 순서(행)
		int ref_level = 0;	// 글 레벨(들여쓰기 / 답글에 대한 답글)
		int pageNum = 0;
		
		 
		// 답변글에 대한 글 작성시
		if(req.getParameter("boardnum") != null) {
			num = Integer.parseInt(req.getParameter("num"));
			boardnum = Integer.parseInt(req.getParameter("boardnum"));
			ref = Integer.parseInt(req.getParameter("ref"));
			ref_step = Integer.parseInt(req.getParameter("ref_step"));
			ref_level = Integer.parseInt(req.getParameter("ref_level"));
			
		}
		num = Integer.parseInt(req.getParameter("num"));
		pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		// 6단계. request나 session에 처리 결과를 저장(jsp에서 받아야 하니깐!)
		model.addAttribute("num",num);
		model.addAttribute("boardnum", boardnum);
		model.addAttribute("ref", ref);
		model.addAttribute("ref_step", ref_step);
		model.addAttribute("ref_level", ref_level);
		model.addAttribute("pageNum", pageNum);
	}
	
	// 게시글 상세페이지
	@Override
	public void contentForm(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		
		// 4단계. 다형성 적용, 싱글톤 방식으로 dao 객체 생성
		// BoardDAO dao = BoardDAOImpl.getInstance();
		
		// 5-1단계. 조회수 증가
		dao.addReadCnt(boardnum);
		
		// 5-2단계. 상세페이지 조회
		BoardListVO vo = dao.getArticle(boardnum);
		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("dto", vo);
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		
	}

	// 게시글 작성 처리
	@Override
	public void insertPro(HttpServletRequest req, Model model) {
		
		// 3단계. 입력받은 값을 받아온다.
		int num = Integer.parseInt(req.getParameter("num"));
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int ref = Integer.parseInt(req.getParameter("ref"));
		int ref_step = Integer.parseInt(req.getParameter("ref_step"));
		int ref_level = Integer.parseInt(req.getParameter("ref_level"));

		
		// 화면으로부터 입력받은 값을 vo에 담자
		BoardListVO vo = new BoardListVO();
		vo.setBoardnum(boardnum);
		vo.setNum(num);
		vo.setWriter(req.getParameter("writer"));
		vo.setSubject(req.getParameter("subject"));
		vo.setContent(req.getParameter("content"));
		vo.setRe_num(0);
		vo.setDel(0);
		vo.setReadcnt(0);
		vo.setRef(ref);
		vo.setRef_step(ref_step);
		vo.setRef_level(ref_level);
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		
		// 4단계. 다형성 적용, 싱글톤 방식으로 dao 객체 생성
		/*BoardDAO dao = BoardDAOImpl.getInstance();*/
		
		// 5단계. 글쓰기 처리(vo를 DAO로 전달하여 SQL 실행)
		int insertCnt = dao.insertBoard(vo);
		
		// 6단계. request나 session에 처리 결과를 저장(jsp에서 받아야 하니깐!)
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dto", vo);
		model.addAttribute("insertCnt", insertCnt);
	}
	
	// 게시글 수정 처리
	@Override
	public void boardUpdatePro(HttpServletRequest req, Model model) {
		
		int num = Integer.parseInt(req.getParameter("num"));
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		// 화면으로부터 입력받은 값을 vo에 담자
		BoardListVO vo = new BoardListVO();
		vo.setSubject(req.getParameter("subject"));
		vo.setContent(req.getParameter("content"));
		vo.setBoardnum(boardnum);
		
		// 4단계. 다형성 적용, 싱글톤 방식으로 dao 객체 생성
		/*BoardDAO dao = BoardDAOImpl.getInstance();*/
		
		// 5단계. 글 수정 실행(vo를 DAO로 전달하여 SQL 실행)
		int updateCnt = dao.updateBoard(vo);
		
		// 6단계. request나 session에 처리 결과를 저장(jsp에서 받아야 하니깐!)
		model.addAttribute("num", num);
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("boardnum", boardnum);
	}
	
	// 게시판 수정 폼
	@Override
	public void boardsUpdate(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		String b_name = req.getParameter("b_name");
		int anon = Integer.parseInt(req.getParameter("anon"));
		
		BoardsVO vo = new BoardsVO();
		vo = dao.getBoardsArticle(num);
		
		model.addAttribute("num",num);
		model.addAttribute("bvo", vo);
		model.addAttribute("b_name", b_name);
		model.addAttribute("anon", anon);
		
	}
	
	// 게시판 수정 처리
	@Override
	public void boardsUpdatePro(HttpServletRequest req, Model model) {	
		int num = Integer.parseInt(req.getParameter("num"));
		int anon = Integer.parseInt(req.getParameter("anon"));

		// 화면으로부터 입력받은 값을 vo에 담자
		BoardsVO vo = new BoardsVO();
		vo.setB_name(req.getParameter("b_name"));
		vo.setNum(num);
		vo.setAnon(anon);

		
		// 4단계. 다형성 적용, 싱글톤 방식으로 dao 객체 생성
		/*BoardDAO dao = BoardDAOImpl.getInstance();*/
		
		// 5단계. 글 수정 실행(vo를 DAO로 전달하여 SQL 실행)
		int updateCnt = dao.updateBoards(vo);
		
		// 6단계. request나 session에 처리 결과를 저장(jsp에서 받아야 하니깐!)
		model.addAttribute("num", num);
		model.addAttribute("updateCnt", updateCnt);
	}

	
	// 글작성 처리
	@Override
	public void insertReple(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		String content = req.getParameter("content");
		String writer = req.getParameter("writer");
		
		ReplyListVO vo = new ReplyListVO();
		vo.setBoardnum(boardnum);
		vo.setContent(content);
		vo.setWriter(writer);
		vo.setReref(0);
		vo.setReref_step(0);
		vo.setReref_level(0);
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
		vo.setDel(0);
		
		int insertCnt = dao.insertReple(vo);
		
		dao.addRepleCnt(boardnum);
		
		model.addAttribute("boardnum", boardnum);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dto", vo);
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("num", num);
	}

	@Override
	public void repleList(HttpServletRequest req, Model model) {
		
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
		
		String boardnum_s = req.getParameter("boardnum");
		int boardnum = Integer.parseInt(boardnum_s);
		
		cnt = dao.getRepleArticleCnt();
		
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
			map.put("boardnum", boardnum);
			map.put("start", start);
			map.put("end", end);
			
			List<ReplyListVO> r_dtos = dao.getRepleArticleList(map);
			
			req.setAttribute("r_dtos", r_dtos); // 큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글 1건
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

		model.addAttribute("boardnum", boardnum);
		model.addAttribute("cnt", cnt);  // 글갯수
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("pageNum", pageNum);  // 페이지번호
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);     // 시작 페이지
			model.addAttribute("endPage", endPage);         // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock);     // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount);     // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}		
	}
	
	// 리플 삭제여부
	@Override
	public void deleteReple(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int replenum = Integer.parseInt(req.getParameter("replenum"));
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		int deleteCnt = 0;
		
		ReplyListVO vo = new ReplyListVO();
		vo.setBoardnum(replenum);
		
		deleteCnt=dao.deleteReple(replenum);
		dao.deleteRepleCnt(boardnum);
		
		model.addAttribute("num", num);
		model.addAttribute("boardnum", boardnum);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("number", number);
	}
	
	@Override
	// 게시글 목록
	public void allBoardList(HttpServletRequest req, Model model) {
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		int pageSize = 10; 		// 한페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;		// 글갯수
		int start = 0;			// 현재 페이지 시작 글번호
		int end = 0;			// 현재 페이지 마지막 글번호
		int number = 0;			// 출력용 글번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지	
		
		cnt = dao.getBoardArticleCnt();
		
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
			map.put("company", company);

			
			List<BoardListAndBoardsVO> dtos = dao.getAllBoardArticleList(map);
			
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글 1건

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

		model.addAttribute("cnt", cnt);  // 글갯수
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("pageNum", pageNum);  // 페이지번호

		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);     // 시작 페이지
			model.addAttribute("endPage", endPage);         // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock);     // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount);     // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
			
		}		
		
	}

	@Override
	public void boardsDelete(HttpServletRequest req, Model model) {
		
		int num = Integer.parseInt(req.getParameter("num"));
		
		BoardsVO vo = new BoardsVO();
		vo.setNum(num);
		
		int deleteCnt = dao.deleteBoards(vo);
		
		model.addAttribute("num", num);
		model.addAttribute("deleteCnt", deleteCnt);
		
	}

	@Override
	public void repleUpdate(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int replenum = Integer.parseInt(req.getParameter("replenum"));
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		String content = req.getParameter("content");
		
		ReplyListVO vo = null;
		vo = dao.getRepleArticle(replenum);
		
		
		model.addAttribute("num", num);
		model.addAttribute("boardnum", boardnum);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("r_dtos", vo);
		model.addAttribute("number", number);
		model.addAttribute("content", content);
		model.addAttribute("replenum", replenum);
		
	}

	@Override
	public void repleUpdatePro(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int replenum = Integer.parseInt(req.getParameter("replenum"));
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		int updateCnt = 0;
		
		ReplyListVO vo = new ReplyListVO();
		vo.setReplenum(replenum);
		vo.setContent(req.getParameter("content"));
		
		updateCnt=dao.updateReple(vo);
		
		model.addAttribute("num", num);
		model.addAttribute("boardnum", boardnum);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("number", number);
		model.addAttribute("replenum", replenum);
		
	}

	@Override
	public void boardDel(HttpServletRequest req, Model model) {
		int deleteCnt = 0;
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int num = Integer.parseInt(req.getParameter("nums"));
		String [] boardArr = req.getParameterValues("checkRow");
		
		if(boardArr != null && boardArr.length > 0) {
			for(int i=0; i<boardArr.length; i++) {
				Map<String, Integer> map = new HashMap<String, Integer>();
					map.put("boardnum", Integer.parseInt(boardArr[i]));
					deleteCnt = dao.delBoard(map);
			}
		}
		
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("num", num);
	}

	@Override
	public void boardMove(HttpServletRequest req, Model model) {
		int updateCnt = 0;
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		//int num = Integer.parseInt(req.getParameter("num"));
		String [] moveArr = req.getParameterValues("checkRow");
		String [] nums = req.getParameterValues("num");

		
		if(moveArr != null && moveArr.length > 0) {
			for(int i=0; i<moveArr.length; i++) {
				Map<String, Integer> map = new HashMap<String, Integer>();
					map.put("boardnum", Integer.parseInt(moveArr[i]));
					map.put("num", Integer.parseInt(nums[i]));
					updateCnt = dao.boardMove(map);
			}
		}
		
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("pageNum", pageNum);
		//model.addAttribute("num", num);		
		
	}
	
	public void allBoardAdmin(HttpServletRequest req, Model model) {
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		int pageSize = 10; 		// 한페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;		// 글갯수
		int start = 0;			// 현재 페이지 시작 글번호
		int end = 0;			// 현재 페이지 마지막 글번호
		int number = 0;			// 출력용 글번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지	
		
		cnt = dao.getBoardArticleCnt();
		
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
			map.put("company", company);

			
			List<BoardListAndBoardsVO> dtos = dao.getAllBoardArticleList(map);
			
			model.addAttribute("ad_dtos", dtos); // 큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글 1건

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

		model.addAttribute("cnt", cnt);  // 글갯수
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("pageNum", pageNum);  // 페이지번호

		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);     // 시작 페이지
			model.addAttribute("endPage", endPage);         // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock);     // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount);     // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
			
		}		
		
	}

}
