package com.spring.gm.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.gm.persistence.K_DAO;
import com.spring.gm.persistence.O_DAO;
import com.spring.gm.vo.B_ManageInfoVO;
import com.spring.gm.vo.B_ManageVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.ScheduleVO;

@Service
public class O_ServiceImpl implements O_Service{

	@Autowired
	O_DAO dao;
	@Autowired
	K_DAO dao2;
	
	//전자결재 - 기안문 작성
	/*
	 * @Override public void createApprDoc(HttpServletRequest req, Model model) {
	 * 
	 * //아무 것도 작성하지 않고 첫 진입시의 서비스 if(req.getParameterValues("memName")==null) {
	 * String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
	 * int depart =
	 * ((MemberVO)req.getSession().getAttribute("loginInfo")).getDepart();
	 * 
	 * //기안문 클릭 시 select문 Join_payVO vo = new Join_payVO();
	 * 
	 * if(depart < 410000000) { // 부서를 가지고 있는 경우 vo = dao.createAppDocForm(id); }
	 * else { // 부서가 없어서 회사이름이 들어가는 경우 vo = dao.createAppDocForm2(id); }
	 * model.addAttribute("vo", vo);
	 * 
	 * //결재선 적용 후 진입하는 서비스 }else {
	 * 
	 * 
	 * 
	 * 
	 * //결재선 정보의 checkbox 다중 선택 String[] checkBoxSel =
	 * req.getParameterValues("id2"); List<String> list = new ArrayList<String>();
	 * 
	 * for(int i=0; i<checkBoxSel.length; i++) { list.add(checkBoxSel[i]); }
	 * 
	 * model.addAttribute("list", list); }
	 * 
	 * 
	 * 
	 * }
	 * 
	 * //전자결재 - 결재선 지정
	 * 
	 * @Override public void addApprLine(HttpServletRequest req, Model model) {
	 * 
	 * int
	 * company=((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
	 * //선빈이가 만든 sql에 회사에 대한 정보가 들어 있음 String a = dao2.getCompanyName(company);
	 * 
	 * 
	 * //회사명, 부서명, 이름명을 dtos에 담고 dtos의 크기를 비교하여 g_name의 null 값을 확인하여 null값을 회사명(a)으로
	 * 나타나도록 한다. List<Join_payVO> dtos = dao.selectApprLine(); for(int i = 0;
	 * i<dtos.size(); i++) { if(dtos.get(i).getG_name()==null) {
	 * dtos.get(i).setG_name(a); } } System.out.print(dtos);
	 * 
	 * //a에 회사명 정보가 들어가 있음 List<String> dname = new ArrayList<String>();
	 * dname.add(a); //전자결재 - 기안문 - 결재선 회사에 그룹등급이 1인 부서명 List<String> dname2 =
	 * dao.getGroupName(company); dname.addAll(dname2);
	 * 
	 * model.addAttribute("dtos", dtos); model.addAttribute("dname", dname);
	 * 
	 * 
	 * }
	 */

	//일정 - 페이지넘
	@Override
	public void calendarPageNum(HttpServletRequest req, Model model) {
		//3단계. 화면으로부터 입력받은 값을 받아온다.
		//페이징 처리
		int pageSize = 10;		//한페이지당 출력할 글 갯수
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

	//일정화면 조회
	@Override
	public void calendarSelect(HttpServletRequest req, Model model) {
		
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		
		List<ScheduleVO> dtos = dao.selectCalendar(id);
		
		model.addAttribute("dtos", dtos);
	}
	
	//일정 등록 write
	@Override
	public void calendarWrite(HttpServletRequest req, Model model) {
		
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		int num=0;
		int del=0;
		int equipnum=0;
		int teamSchedule=0;
		int groupId=0;
		
		model.addAttribute("id", id);
		model.addAttribute("num", num);
		model.addAttribute("equipnum", equipnum);
		model.addAttribute("teamSchedule", teamSchedule);
		model.addAttribute("groupId", groupId);
		model.addAttribute("del", del);
	}
	
	//일정 등록 insert-pro
	@Override
	public void calendarPro(HttpServletRequest req, Model model) {
		
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		int num=Integer.parseInt(req.getParameter("num"));
		int del=0;
		int equipnum=0;
		int teamSchedule=0;
		int groupId=0;
		
		ScheduleVO vo = new ScheduleVO();
		vo.setNum(num);
		vo.setId(id);
		vo.setEquipnum(equipnum);
		vo.setTeamSchedule(teamSchedule);
		vo.setScheduleKind(req.getParameter("scheduleKind"));
		vo.setSubject(req.getParameter("subject"));
		vo.setLocation(req.getParameter("location"));
		vo.setContent(req.getParameter("content"));
		//date 타입을 timeStamp로 형 변환(begin, end)
		java.util.Date d = null;
		try {
			d = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(req.getParameter("begin").replace("T"," "));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Timestamp ts = new Timestamp(d.getTime());
		vo.setBegin(ts);
		java.util.Date d2 = null;
		try {
			d2 = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(req.getParameter("end").replace("T"," "));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Timestamp ts2 = new Timestamp(d2.getTime());
		
		vo.setEnd(ts2);
		//date 타입을 timeStamp로 형 변환 끝(begin, end)
		vo.setGroupId(groupId);
		vo.setDel(del);
		
		int insertCnt = dao.insertCalendar(vo);
		
		model.addAttribute("insertCnt", insertCnt);
		
		
	}

	//일정 상세 화면
	@Override
	public void calendarDetail(HttpServletRequest req, Model model) {
		
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		int num = Integer.parseInt(req.getParameter("num"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("num", num);
		
		ScheduleVO vo = dao.modifyBeforeCalendar(map);
		
		model.addAttribute("vo", vo);
		
	}

	//일정 수정
	@Override
	public void calendarModify(HttpServletRequest req, Model model) {		
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		
		ScheduleVO vo = new ScheduleVO();
		vo.setNum(Integer.parseInt(req.getParameter("num"))); 
		vo.setScheduleKind(req.getParameter("scheduleKind"));
		vo.setSubject(req.getParameter("subject"));
		vo.setLocation(req.getParameter("location"));
		vo.setContent(req.getParameter("content"));
		//date 타입을 timeStamp로 형 변환(begin, end)
		java.util.Date d = null;
		try {
			d = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(req.getParameter("begin").replace("T"," "));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Timestamp ts = new Timestamp(d.getTime());
		vo.setBegin(ts);
		java.util.Date d2 = null;
		try {
			d2 = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(req.getParameter("end").replace("T"," "));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Timestamp ts2 = new Timestamp(d2.getTime());
		vo.setEnd(ts2);
		//date 타입을 timeStamp로 형 변환 끝(begin, end)
				
		int updateCnt = dao.updateCalendar(vo);
		System.out.println("updateCnt" + updateCnt);
		
		model.addAttribute("updateCnt", updateCnt);
	}

	//일정 삭제
	@Override
	public void calendarDelete(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		
		int deleteCnt = dao.deleteCalendar(num);
		System.out.println("deleteCnt" + deleteCnt);
		
		model.addAttribute("deleteCnt", deleteCnt);
	}
	
	//일정 메인 화면 view
	@Override
	public void O_calendarMainView(HttpServletRequest req, Model model) {
		
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		
		ScheduleVO svo = new ScheduleVO();
		svo = dao.calendarMainView(id);
		
		System.out.println("svo" + svo);
		
		model.addAttribute("svo", svo);
	}

	//업무관리 등록 화면
	@Override
	public void createSelfTaskWrite(HttpServletRequest req, Model model) {
		
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		int todonum=0;
		int groupId=0;
		String state="미완료";
		int del=0;
		Timestamp reg_date = new Timestamp(System.currentTimeMillis());

		model.addAttribute("id", id);
		model.addAttribute("todonum", todonum);
		model.addAttribute("groupId", groupId);
		model.addAttribute("state", state);
		model.addAttribute("del", del);
		model.addAttribute("reg_date", reg_date);

	}

	//업무관리 등록 insert-pro
	@Override
	public void createSelfTaskPro(HttpServletRequest req, Model model) {
		
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		int company=((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		
		B_ManageVO vo = new B_ManageVO();
		vo.setTodonum(Integer.parseInt(req.getParameter("todonum")));
		vo.setId(id);
		vo.setGroupId(company);
		vo.setB_name(req.getParameter("b_name"));
		vo.setSubject(req.getParameter("subject"));
		vo.setContent(req.getParameter("content"));
		vo.setBegin(Date.valueOf(req.getParameter("begin")));
		vo.setEnd(Date.valueOf(req.getParameter("end")));
		vo.setState(req.getParameter("state"));
		vo.setDel(Integer.parseInt(req.getParameter("del")));
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		int insertCnt = dao.insertTodo(vo);
		
		if(insertCnt != 0) {
			B_ManageInfoVO vo2 = new B_ManageInfoVO();
			String content = "";
			vo2.setId(req.getParameter("id"));
			vo2.setState(req.getParameter("state"));
			vo2.setContent(content);
			int insertCnt2 = dao.insertTodoInfo(vo2);
			model.addAttribute("insertCnt2", insertCnt2);
		}
		
		model.addAttribute("insertCnt", insertCnt);
		
	}

	//업무관리 내가 한 업무요청
	@Override
	public void orderList(HttpServletRequest req, Model model) {
		
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		
		//3단계. 화면으로부터 입력받은 값을 받아온다.
		//페이징 처리
		int pageSize = 10;		//한페이지당 출력할 글 갯수
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
		int search = 0;
		if(req.getParameter("search") != null) {
			search = Integer.parseInt(req.getParameter("search"));
		}
		if(search == 0) {
			req.getSession().removeAttribute("searchMap");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchUserName", null);
		map.put("toggleSearchType", null);
		map.put("searchApprTitle", null);
		map.put("searchStartDate", null);
		map.put("searchEndDate", null);
		
		if(req.getSession().getAttribute("searchMap") != null) {
			map = (Map<String, Object>)req.getSession().getAttribute("searchMap");
			req.getSession().removeAttribute("searchMap");
		}
		map.put("id", id);
		
		cnt = dao.getOrderCnt(map);

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
			
			map.put("start", start);
			map.put("end", end);
			
			List<B_ManageVO> dtos = dao.getOrderList(map);
			
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

	//업무관리 내가 한 요청업무 상세 조회
	@Override
	public void readOrderList(HttpServletRequest req, Model model) {
		
		int todonum = Integer.parseInt(req.getParameter("todonum"));
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		
		List<B_ManageVO> dtos = dao.readOrderList(todonum);
		System.out.println("dtos :" + dtos);
		List<B_ManageInfoVO> dtos2 = dao.readOrderListInfo(todonum);
		System.out.println("dtos2 :" + dtos2);
	
		int donum = dtos2.get(0).getDonum();
		String statecf = dtos.get(0).getState();
		
		model.addAttribute("dtos", dtos);
		model.addAttribute("dtos2", dtos2);
		model.addAttribute("todonum", todonum);
		model.addAttribute("donum", donum);
		model.addAttribute("id", id);
		model.addAttribute("statecf", statecf);
		
		
	}

	//업무관리 업무요청 수정 화면
	@Override
	public void updateTaskView(HttpServletRequest req, Model model) {
		
		int todonum = Integer.parseInt(req.getParameter("todonum"));
		
		B_ManageVO vo = dao.udpateTaskView(todonum);
		
		model.addAttribute("vo", vo);
		model.addAttribute("todonum", todonum);
		
		
	}

	//업무관리 업무요청 수정 pro
	@Override
	public void updateTaskPro(HttpServletRequest req, Model model) {
		
		int todonum = Integer.parseInt(req.getParameter("todonum"));
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		
		B_ManageVO vo = new B_ManageVO();
		vo.setSubject(req.getParameter("subject"));
		vo.setBegin(Date.valueOf(req.getParameter("begin")));
		vo.setEnd(Date.valueOf(req.getParameter("end")));
		vo.setB_name(req.getParameter("b_name"));
		vo.setContent(req.getParameter("content"));
		vo.setState(req.getParameter("state"));
		vo.setReg_date2(new Timestamp(System.currentTimeMillis()));
		vo.setTodonum(todonum);
		vo.setId(id);
		
		
		System.out.println("akadskfkk" + vo.toString());
		
		int updateCnt = dao.updateTaskPro(vo);
		
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("todonum", todonum);
		
	}

	//업무관리 업무요청 삭제 pro
	@Override
	public void updateTaskDeletePro(HttpServletRequest req, Model model) {
		
		int todonum = Integer.parseInt(req.getParameter("todonum"));
		
		int deleteCnt = dao.deleteTaskPro(todonum);
		
		model.addAttribute("deleteCnt", deleteCnt);
	}

	//업무관리 수신 업무 요청 화면
	@Override
	public void listTodo(HttpServletRequest req, Model model) {
		
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		
		//3단계. 화면으로부터 입력받은 값을 받아온다.
		//페이징 처리
		int pageSize = 10;		//한페이지당 출력할 글 갯수
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
		int search = 0;
		if(req.getParameter("search") != null) {
			search = Integer.parseInt(req.getParameter("search"));
		}
		if(search == 0) {
			req.getSession().removeAttribute("searchMap");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchUserName", null);
		map.put("toggleSearchType", null);
		map.put("searchApprTitle", null);
		map.put("searchStartDate", null);
		map.put("searchEndDate", null);
		
		if(req.getSession().getAttribute("searchMap") != null) {
			map = (Map<String, Object>)req.getSession().getAttribute("searchMap");
			req.getSession().removeAttribute("searchMap");
		}
		map.put("id", id);
		cnt = dao.reciveListCnt(map);

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
			
			map.put("start", start);
			map.put("end", end);
			
			List<B_ManageVO> dtos = dao.reciveList(map);
			
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

	//업무요청 - 수신 업무 요청 상세 조회 처리 - pro
	@Override
	public void readSubTodoSuccessPro(HttpServletRequest req, Model model) {
		
		int donum = Integer.parseInt(req.getParameter("donum"));
		int todonum = Integer.parseInt(req.getParameter("todonum"));
		int appcan = Integer.parseInt(req.getParameter("appcan"));

		B_ManageVO vo = new B_ManageVO();
		B_ManageInfoVO vo2 = new B_ManageInfoVO();

		if(appcan == 0) {
			vo.setTodonum(todonum);
			vo.setState("완료");
			int updateCnt2 = dao.updateRecive(vo);
			if(updateCnt2 != 0) {
				vo2.setDonum(donum);
				System.out.println("content : " + req.getParameter("content"));
				vo2.setContent(req.getParameter("content"));
				vo2.setReg_date(new Timestamp(System.currentTimeMillis()));
				vo2.setState("완료");
			}
		} else {
			vo.setTodonum(todonum);
			vo.setState("반려");
			int updateCnt2 = dao.updateRecive(vo);
			if(updateCnt2 != 0) {
				vo2.setDonum(donum);
				System.out.println("content : " + req.getParameter("content"));
				vo2.setContent(req.getParameter("content"));
				vo2.setReg_date(new Timestamp(System.currentTimeMillis()));
				vo2.setState("반려");
			}
		}
		
		int updateCnt = dao.updateRecivePro(vo2);
		System.out.println("content22222222 : " + req.getParameter("content"));
		
		System.out.println("updateCnt : " + updateCnt);
		
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("donum", donum);
		
	}

	//업무요청 - 업무 완료함 화면
	@Override
	public void completeList(HttpServletRequest req, Model model) {
		
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		
		//3단계. 화면으로부터 입력받은 값을 받아온다.
		//페이징 처리
		int pageSize = 10;		//한페이지당 출력할 글 갯수
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
		int search = 0;
		if(req.getParameter("search") != null) {
			search = Integer.parseInt(req.getParameter("search"));
		}
		if(search == 0) {
			req.getSession().removeAttribute("searchMap");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchUserName", null);
		map.put("toggleSearchType", null);
		map.put("searchApprTitle", null);
		map.put("searchStartDate", null);
		map.put("searchEndDate", null);
		
		if(req.getSession().getAttribute("searchMap") != null) {
			map = (Map<String, Object>)req.getSession().getAttribute("searchMap");
			req.getSession().removeAttribute("searchMap");
		}
		map.put("id", id);
		
		map.put("state", "완료");
		cnt = dao.completeListCnt(map);

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
			
			map.put("start", start);
			map.put("end", end);
			
			List<B_ManageVO> dtos = dao.completeList(map);
			
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

	//관리자 메뉴 - 업무 문서 관리
	@Override
	public void adminTodoList(HttpServletRequest req, Model model) {
		
		//3단계. 화면으로부터 입력받은 값을 받아온다.
		//페이징 처리
		int pageSize = 17;		//한페이지당 출력할 글 갯수
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
		int search = 0;
		if(req.getParameter("search") != null) {
			search = Integer.parseInt(req.getParameter("search"));
		}
		if(search == 0) {
			req.getSession().removeAttribute("searchMap");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchUserName", null);
		map.put("toggleSearchType", null);
		map.put("searchApprTitle", null);
		map.put("searchStartDate", null);
		map.put("searchEndDate", null);
		
		if(req.getSession().getAttribute("searchMap") != null) {
			map = (Map<String, Object>)req.getSession().getAttribute("searchMap");
			req.getSession().removeAttribute("searchMap");
		}
		cnt = dao.adminListCnt(map);

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
			
			map.put("start", start);
			map.put("end", end);
			map.put("number", number);
			
			List<B_ManageVO> dtos = dao.adminList(map);
			
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

	//업무관리의 view 페이지 검색기능
	@Override
	public void W_searchTodoTool(HttpServletRequest req, Model model) {
		
		String sel_Payment = req.getParameter("sel_Payment");
		String searchUserName = req.getParameter("searchUserName");
		String toggleSearchType = req.getParameter("toggleSearchType");
		String searchApprTitle = req.getParameter("searchApprTitle");
		String searchStartDate = req.getParameter("searchStartDate");
		String searchEndDate = req.getParameter("searchEndDate");
		
		Date start = null;
		Date end = null;
		
		if(searchStartDate.length() != 0) {
			start = Date.valueOf(searchStartDate);
		}
		if(searchEndDate.length() != 0) {
			end = Date.valueOf(searchEndDate);
		}
		model.addAttribute("sel", sel_Payment);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchUserName", searchUserName);
		map.put("toggleSearchType", toggleSearchType);
		map.put("searchApprTitle", searchApprTitle);
		map.put("searchStartDate", start);
		map.put("searchEndDate", end);
		
		req.getSession().setAttribute("searchMap", map);
	}



	

	
	

	

	


}
