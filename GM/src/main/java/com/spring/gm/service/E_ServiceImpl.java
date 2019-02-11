package com.spring.gm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.gm.persistence.E_DAO;
import com.spring.gm.vo.GroupsVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.MemoVO;

@Service
public class E_ServiceImpl implements E_Service {

	@Autowired
	E_DAO dao;

	
	// 조직도 - 첫페이지,	 (내가 속한 회사) 전체 구성원 목록
	@Override
	public void E_organizationList(HttpServletRequest req, Model model) {
		// 1. 세션 로그인 되어있는 사용자의 정보를 가져옴
		// 2. 가져온 사용자 정보에서 company 를 가져온다.
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		
		// SQL join
		
		// 3. Mapper (DB) 가서 member테이블에 company가 현재 로그인 된 사용자의 company가 같은 사람만 가지고 온다.
		// SELECT * FROM member WHERE company = #{company}
		List<MemberVO> list = null;	// List : 같은 형태를 하나로 묶는다.( null이라  텅빈 큰 바구니 ), MemberVO : 작은 바구니
		list = dao.getMyCompanyInfo(company);		// company로 해당정보 불러옴 - DB에서 접속한 사용자의 회사정보 company값을 가져와서 list에 넣음
		
		//페이징 처리
		int pageSize = 10;		//한페이지당 출력할 글 갯수
		int pageBlock = 3;		//한 블록당 페이지 갯수
		
		int cnt = 0;			//글 갯수
		int start = 0;			//현재 페이지 시작 글번호
		int end = 0;			//현재 페이지 마지막 글번호
		int number = 0;			//출력용 글번호 (현재 페이지까지 등록된 글 갯수 / 중간에 num이 삭제되더라도 글번호 시퀀스가 유지되도록)
		String pageNum = "";	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
	
		cnt = dao.getMyCompanyMemCnt(company);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum==null) {
			pageNum = "1";	// 첫페이지를 1페이지로 지정
		}
		
		//글 30건 기준
		currentPage = Integer.parseInt(pageNum);	//현재 페이지 : 1
		System.out.println("currentPage : " + currentPage);
		
		//페이지 갯수 6이 나오는 이유 =(30/5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);	// 페이지 갯수 + (나머지가 있으면) 1을 더한다. cnt:글 갯수
		
		//현재 페이지 시작 글번호(페이지별) --1
		//1 = (1 - 1) * 5 + 1;
		start = (currentPage - 1) * pageSize + 1;	
		
		//현재 페이지 마지막 글번호 (페이지별)
		//5 = 1 + 5 - 1;
		end = start + pageSize -1;	
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		if(end > cnt) end = cnt;
		
		//출력용 글번호
		//30 = 30 - (1 - 1) * 5;
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호(현재 페이지까지 등록된 글 갯수)
		
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		
		//시작페이지
		//1 = (1 / 3) * 3 + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;	
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("startPage : " + startPage);
		
		//마지막 페이지
		//3 = 1 + 3 - 1;
		endPage = startPage + pageBlock - 1;	
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("======================");
		
		req.setAttribute("cnt", cnt);			// 글 갯수
		req.setAttribute("number", number);		// 출력용 글번호(현재 페이지까지 등록된 글 갯수)
		req.setAttribute("pageNum", pageNum);	// 페이지 번호
		
		if(cnt > 0) {
			req.setAttribute("startPage", startPage);		// 시작 페이지
			req.setAttribute("endPage", endPage);			// 마지막 페이지
			req.setAttribute("pageBlock", pageBlock);		// 출력할 페이지 갯수(한 블록당 페이지 갯수)
			req.setAttribute("pageCount", pageCount);		// 페이지 갯수
			req.setAttribute("currentPage", currentPage);	// 현재 페이지
		}
		
		// 4. setAttribute로 list를 넘겨줌.
		req.setAttribute("list", list);
		System.out.println("list : " + list);
		
		
		List<GroupsVO> side = null;
		side = dao.getMyCompanyGroupCnt(company);
		
		req.setAttribute("side", side);
		
		String c_name = dao.findCompanyName(company);
		req.setAttribute("c_name", c_name);
		req.setAttribute("company", company);
		// 5. 화면에서 EL태그로 출력
	}

	// 조직도 - 내가 속한 회사의 전체 그룹 목록
	@Override
	public void E_organAllGroupList(HttpServletRequest req, Model model) {
		// 1. 세션 로그인 되어있는 사용자의 정보를 가져옴
		// 2. 가져온 사용자 정보에서 company 를 가져온다.
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		int depart = Integer.parseInt(req.getParameter("depart"));
		
		// SQL join
		
		// 3. Mapper (DB) 가서 member테이블에 company가 현재 로그인 된 사용자의 company가 같은 사람만 가지고 온다.
		// SELECT * FROM member WHERE company = #{company}
		List<MemberVO> list = null;	// List : 같은 형태를 하나로 묶는다.( null이라  텅빈 큰 바구니 ), MemberVO : 작은 바구니
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("company", company);
		map.put("depart", depart);
		
		list = dao.getMyCompanyInfo2(map);		// DB에서 접속한 사용자의 회사정보 company값을 가져와서 list에 넣음
		
		//페이징 처리
		int pageSize = 10;		//한페이지당 출력할 글 갯수
		int pageBlock = 3;		//한 블록당 페이지 갯수
		
		int cnt = 0;			//글 갯수
		int start = 0;			//현재 페이지 시작 글번호
		int end = 0;			//현재 페이지 마지막 글번호
		int number = 0;			//출력용 글번호 (현재 페이지까지 등록된 글 갯수 / 중간에 num이 삭제되더라도 글번호 시퀀스가 유지되도록)
		String pageNum = "";	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
	
		cnt = dao.getMyCompanyMemCnt(company);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum==null) {
			pageNum = "1";	// 첫페이지를 1페이지로 지정
		}
		
		//글 30건 기준
		currentPage = Integer.parseInt(pageNum);	//현재 페이지 : 1
		System.out.println("currentPage : " + currentPage);
		
		//페이지 갯수 6이 나오는 이유 =(30/5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);	// 페이지 갯수 + (나머지가 있으면) 1을 더한다. cnt:글 갯수
		
		//현재 페이지 시작 글번호(페이지별) --1
		//1 = (1 - 1) * 5 + 1;
		start = (currentPage - 1) * pageSize + 1;	
		
		//현재 페이지 마지막 글번호 (페이지별)
		//5 = 1 + 5 - 1;
		end = start + pageSize -1;	
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		if(end > cnt) end = cnt;
		
		//출력용 글번호
		//30 = 30 - (1 - 1) * 5;
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호(현재 페이지까지 등록된 글 갯수)
		
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		
		//시작페이지
		//1 = (1 / 3) * 3 + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;	
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("startPage : " + startPage);
		
		//마지막 페이지
		//3 = 1 + 3 - 1;
		endPage = startPage + pageBlock - 1;	
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("======================");
		
		req.setAttribute("cnt", cnt);			// 글 갯수
		req.setAttribute("number", number);		// 출력용 글번호(현재 페이지까지 등록된 글 갯수)
		req.setAttribute("pageNum", pageNum);	// 페이지 번호
		
		if(cnt > 0) {
			req.setAttribute("startPage", startPage);		// 시작 페이지
			req.setAttribute("endPage", endPage);			// 마지막 페이지
			req.setAttribute("pageBlock", pageBlock);		// 출력할 페이지 갯수(한 블록당 페이지 갯수)
			req.setAttribute("pageCount", pageCount);		// 페이지 갯수
			req.setAttribute("currentPage", currentPage);	// 현재 페이지
		}
		
		// 4. setAttribute로 list를 넘겨줌.
		req.setAttribute("list", list);
		System.out.println("list : " + list);
		// 5. 화면에서 EL태그로 출력		
		List<GroupsVO> side = null;
		side = dao.getMyCompanyGroupCnt(company);
		
		req.setAttribute("side", side);
		
		String c_name = dao.findCompanyName(company);
		req.setAttribute("c_name", c_name);
		req.setAttribute("company", company);
		
	}

	
	
	// 부서 사이드 메뉴
	
	@Override
	public void E_organDepartSide(HttpServletRequest req, Model model) {
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		
		List<GroupsVO> list = null;
		list = dao.getMyCompanyGroupCnt(company);
		
		req.setAttribute("list", list);
		
	}
	
	
}
