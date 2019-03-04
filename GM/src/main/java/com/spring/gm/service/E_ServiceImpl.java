package com.spring.gm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.gm.persistence.E_DAO;
import com.spring.gm.vo.AddressGroupVO;
import com.spring.gm.vo.GroupsVO;
import com.spring.gm.vo.MemberVO;



@Service
public class E_ServiceImpl implements E_Service {

	@Autowired
	E_DAO dao;

	@Override
	public void myCompanyMember(HttpServletRequest req, Model model) {
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
		
		cnt = dao.getCompanyMemberCnt(company);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	// 첫페이지를 1페이지로 지정
		}
		
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1
		
		start = (currentPage - 1) * pageSize + 1; 
		
		end = start + pageSize - 1;
		
		if(end > cnt) end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize;  // 출력용 글번호

		if(cnt > 0) {
			//게시판 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("company", company);

			
			List<MemberVO> dtos = dao.getCompanyMemberList(map);
			
			model.addAttribute("mem_dtos", dtos); // 큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글 1건

		}
		
		// 시작페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
				
		// 마지막 페이지
		endPage = startPage + pageBlock - 1; 
		if(endPage > pageCount) endPage = pageCount;
		
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
	public void departList(HttpServletRequest req, Model model) {
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("company", company);

		List<GroupsVO> dtos = dao.getCompanyList(map);

		model.addAttribute("c_dtos", dtos); // 큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글 1건

	}

	@Override
	public void departMember(HttpServletRequest req, Model model) {
		int depart = Integer.parseInt(req.getParameter("groupId"));
		int pageSize = 100; 		// 한페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int memcnt = 0;			// 맴버 명수
		int start = 0;			// 현재 페이지 시작 글번호
		int end = 0;			// 현재 페이지 마지막 글번호
		int number = 0;			// 출력용 글번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		memcnt = dao.getDepartMemberCnt(depart);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	// 첫페이지를 1페이지로 지정
		}
		
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		
		pageCount = (memcnt / pageSize) + (memcnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1
		
		start = (currentPage - 1) * pageSize + 1; 
		
		end = start + pageSize - 1;
		
		if(end > memcnt) end = memcnt;
		
		number = memcnt - (currentPage - 1) * pageSize;  // 출력용 글번호

		if(memcnt > 0) {
			//게시판 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("depart", depart);

			
			List<GroupsVO> dtos = dao.getDepartMemberList(map);
			
			model.addAttribute("demem_dtos", dtos); // 큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글 1건

		}
		
		// 시작페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
				
		// 마지막 페이지
		endPage = startPage + pageBlock - 1; 
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("memcnt", memcnt);  // 글갯수
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("pageNum", pageNum);  // 페이지번호
		
		if(memcnt > 0) {
			model.addAttribute("startPage", startPage);     // 시작 페이지
			model.addAttribute("endPage", endPage);         // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock);     // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount);     // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
	}

	@Override
	public void myFavoriteMemberList(HttpServletRequest req, Model model) {
		String strId = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", strId);

		List<AddressGroupVO> dtos = dao.getMyFavoriteMemberList(map);

		model.addAttribute("mf_dtos", dtos); // 큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글 1건

	}

	@Override
	public void memberContents(HttpServletRequest req, Model model) {
		String strId = req.getParameter("id");
		String name = req.getParameter("name");
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		
		MemberVO vo = dao.content(strId);
		
		model.addAttribute("cont_dto", vo);
		model.addAttribute("id", strId);
		model.addAttribute("name", name);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		
		
	}
}
