package com.spring.gm.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.gm.persistence.K_DAO;
import com.spring.gm.persistence.O_DAO;
import com.spring.gm.vo.Join_payVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.ScheduleVO;
import com.spring.gm.vo.Join_payVO;

@Service
public class O_ServiceImpl implements O_Service{

	@Autowired
	O_DAO dao;
	@Autowired
	K_DAO dao2;
	
	//전자결재 - 기안문 작성
	@Override
	public void createApprDoc(HttpServletRequest req, Model model) {
		
		//아무 것도 작성하지 않고 첫 진입시의 서비스
		if(req.getParameterValues("memName")==null) {
			String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
			int depart = ((MemberVO)req.getSession().getAttribute("loginInfo")).getDepart();
			
			//기안문 클릭 시 select문
			Join_payVO vo = new Join_payVO();
			
			if(depart < 410000000) { // 부서를 가지고 있는 경우
				vo = dao.createAppDocForm(id);
			} else { // 부서가 없어서 회사이름이 들어가는 경우
				vo = dao.createAppDocForm2(id);
			}
			model.addAttribute("vo", vo);
		
		//결재선 적용 후 진입하는 서비스
		}else {
			
			
			
			
			//결재선 정보의 checkbox 다중 선택
			String[] checkBoxSel = req.getParameterValues("id2");
			List<String> list = new ArrayList<String>();
			
			for(int i=0; i<checkBoxSel.length; i++) {
				list.add(checkBoxSel[i]); 
			}
		  
			model.addAttribute("list", list);
		}
		
		
		
	}

	//전자결재 - 결재선 지정
	@Override
	public void addApprLine(HttpServletRequest req, Model model) {
		
		int company=((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		//선빈이가 만든 sql에 회사에 대한 정보가 들어 있음
		String a = dao2.getCompanyName(company);

		
		//회사명, 부서명, 이름명을 dtos에 담고 dtos의 크기를 비교하여 g_name의 null 값을 확인하여 null값을 회사명(a)으로 나타나도록 한다.
		List<Join_payVO> dtos = dao.selectApprLine();
		for(int i = 0; i<dtos.size(); i++) {
			if(dtos.get(i).getG_name()==null) {
				dtos.get(i).setG_name(a);
			}
		}
		System.out.print(dtos);
		
		//a에 회사명 정보가 들어가 있음
		List<String> dname = new ArrayList<String>();
		dname.add(a);
		//전자결재 - 기안문 - 결재선  회사에 그룹등급이 1인 부서명
		List<String> dname2 = dao.getGroupName(company);
		dname.addAll(dname2);
		
		model.addAttribute("dtos", dtos);
		model.addAttribute("dname", dname);
		
		
	}

	//결재요청
	@Override
	public void apprDocReq(HttpServletRequest req, Model model) {
		
		
	}

	//일정 - 페이지넘
	@Override
	public void calendarPageNum(HttpServletRequest req, Model model) {
		//3단계. 화면으로부터 입력받은 값을 받아온다.
		//페이징 처리
		int pageSize = 5;		//한페이지당 출력할 글 갯수
		int pageBlock = 5;		//한 블록당 페이지 갯수
		
		int cnt = 0;			//글 갯수
		int start = 0;			//현재 페이지 시작 글번호
		int end = 0;			//현재 페이지 마지막 글번호
		int number = 0;			//출력용 글번호
		String pageNum = "";	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지
		
		//4단계. 다형성 적용, 싱글톤 방식으로 DAO 객체 생성
				
		//5-1단계. 글 갯수 구하기
		cnt = dao.getCalendarCnt();

		System.out.println("cnt : " + cnt); //먼저 테이블에 30건을 insert함
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum==null) {
			pageNum = "1";	//첫페이지를 1페이지로 지정
		}
			
		//글 30건 기준
		currentPage = Integer.parseInt(pageNum);	//현재 페이지 : 1
		System.out.println("currentPage : " + currentPage);
		
		//페이지 갯수 6이 나오는 이유 =(30/5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);	//페이지 갯수 + 나머지 있으면 1
		System.out.println("pageCount : " + pageCount);
		
		
		//현재 페이지 시작 글번호(페이지별) --1
		start = (currentPage - 1) * pageSize + 1;	//1 = (1 - 1) * 5 + 1;
		
		//현재 페이지 마지막 글번호 (페이지별)
		end = start + pageSize -1;	//5 = 1 + 5 - 1;
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		if(end > cnt) end = cnt;
		
		//출력용 글번호
		//30 = 30 - (1 - 1) * 5;
		number = cnt - (currentPage - 1) * pageSize;	//출력용 글번호
		
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		
		if(cnt > 0) {
			//5-2단계. 게시글 목록 조회
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			
			List<ScheduleVO> dtos = dao.getCalendarList(map);
			
			model.addAttribute("dtos", dtos);	//큰바구니 : 게시글 목록 	cf)작은바구니 : 게시글 1건
		}
			
		//6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
		//시작페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;	//1 = (1 / 3) * 3 + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("startPage : " + startPage);
		
		//마지막 페이지
		endPage = startPage + pageBlock - 1;	//3 = 1 + 3 - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("======================");
		
		model.addAttribute("cnt", cnt);	//글 갯수
		model.addAttribute("number", number);	//출력용 글번호
		model.addAttribute("pageNum", pageNum);	//페이지 번호
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);		//시작 페이지
			model.addAttribute("endPage", endPage);			//마지막 페이지
			model.addAttribute("pageBlock", pageBlock);		//출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount);		//페이지 갯수
			model.addAttribute("currentPage", currentPage);	//현재 페이지
		}
		
	}


}
