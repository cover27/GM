package com.spring.gm.service;

import java.sql.Date;
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
import com.spring.gm.vo.AttendedSetVO;
import com.spring.gm.vo.CompaniesVO;
import com.spring.gm.vo.DayoffVO;
import com.spring.gm.vo.GradeVO;
import com.spring.gm.vo.GroupInfoVO;
import com.spring.gm.vo.GroupsVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.join_mgcVO2;
import com.spring.gm.vo.join_mgiVO;

@Service
public class K_ServiceImpl implements K_Service{

	@Autowired
	K_DAO dao;
	@Autowired
	J_DAO dao2;
	
	@Override
	public void login(HttpServletRequest req, Model model, String id) {
		 
		 MemberVO vo = null; 
		  
		 vo = dao.memberInfo(id); // 아이디로 해당 정보를 불러옴 
		 req.getSession().setAttribute("loginInfo", vo);
		
	}

	@Override
	public void confirmId(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		MemberVO vo = null;
		int checkCnt = 0;
		
		vo = dao.memberInfo(id);
		if(vo == null) {
			checkCnt = 1;
		}
		
		req.setAttribute("checkCnt", checkCnt);
		req.setAttribute("id", id);
	}
	
	@Override
	public void findCompany(HttpServletRequest req, Model model) {
		List<CompaniesVO> list = null;
		
		list = dao.findCompany();
		req.setAttribute("list", list);
	}

	@Override
	public void searchCompany(HttpServletRequest req, Model model) {
		String keyword = req.getParameter("keyword");
		List<CompaniesVO> list = null;
		
		list = dao.searchCompany(keyword);
		req.setAttribute("list", list);
	}

	@Override
	public void registAccount(HttpServletRequest req, Model model) {
		int insertCnt = 0;
		
		MemberVO vo = new MemberVO();
		vo.setId(req.getParameter("id"));
		vo.setPwd(req.getParameter("pwd"));
		vo.setName(req.getParameter("name"));
		vo.setEng_name(req.getParameter("eng_name"));
		vo.setJumin1(Integer.parseInt(req.getParameter("jumin1")));
		vo.setJumin2(Integer.parseInt(req.getParameter("jumin2")));
		vo.setGender(Integer.parseInt(req.getParameter("gender")));
		vo.setMarry(Integer.parseInt(req.getParameter("marry")));
		if(Integer.parseInt(req.getParameter("marry")) == 1) { //미혼이라서 안쓰면 오류남
			Date wdday = Date.valueOf(req.getParameter("wdday"));
			vo.setWdday(wdday);
		}
		vo.setFrgn(Integer.parseInt(req.getParameter("frgn")));
		vo.setNation(req.getParameter("nation"));
		String tel = req.getParameter("hp1") + req.getParameter("hp2") + req.getParameter("hp3");
		vo.setTel(tel);
		String tel_hm = req.getParameter("hm1") + req.getParameter("hm2") + req.getParameter("hm3");
		vo.setTel_hm(tel_hm);
		String email = req.getParameter("email1") + "@" + req.getParameter("email2");
		vo.setEmail_in(email);
		vo.setAddress(req.getParameter("address"));
		vo.setEng_address(req.getParameter("eng_address"));
		vo.setDepart(Integer.parseInt(req.getParameter("depart")));
		vo.setCompany(Integer.parseInt(req.getParameter("depart")));
		java.sql.Date today = new java.sql.Date(new java.util.Date().getTime());
		vo.setEnterday(today);
		vo.setYear(0);
		vo.setSys_rank(0);
		vo.setDel(0);
		
		insertCnt = dao.registAccount(vo);
		if(insertCnt == 1) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", vo.getId());
			map.put("pwd", vo.getPwd());
			dao.registUsers(map);
			
			Map<String, String> map2 = new HashMap<String, String>();
			map2.put("id", vo.getId());
			map2.put("auth", "USER");
			dao.registAuthorities(map2);
		}
		
		req.setAttribute("insertCnt", insertCnt);
	}

	@Override
	public void member_manage(HttpServletRequest req, Model model) {
		List<MemberVO> list = null;
		
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		
		list = dao.getWait(company);
		req.setAttribute("list", list);
	}

	@Override
	public void K_appMember(HttpServletRequest req, Model model) {
		int appcan = Integer.parseInt(req.getParameter("appcan"));
		int state = 0;
		
		if(req.getParameterValues("check") != null){ //클릭이 되어 있어야됨
			String[] checks = req.getParameterValues("check");
			if(appcan == 0) { //승인한다면
				for(int i=0; i<checks.length; i++) {
					Map<String, String> map = new HashMap<String, String>();
					map.put("id", checks[i]);
					map.put("auth", "USER");
					dao.updateAuthorities(map);
					
					Map<String, Object> map2 = new HashMap<String, Object>();
					map2.put("id", checks[i]);
					map2.put("rank", 2); // sysrank -> 2는 일반 사용자
					dao.updateSysrank(map2);
					
					
				}
				
			} else { //취소한다면 -> member's sysrank -> 4(승인거절자) 로 바꿈(메일로 승인 거절됨을 알림)
				for(int i=0; i<checks.length; i++) {
					Map<String, Object> map2 = new HashMap<String, Object>();
					map2.put("id", checks[i]);
					map2.put("rank", 4);
					dao.updateSysrank(map2);
				}
			}
			state = 1;
		} else { // 클릭이 안되어 있음. 클릭하라고 경고창쓰
			state = -1;
		}
		req.setAttribute("state", state);
	}

	@Override
	public void K_resistMemberInfo(HttpServletRequest req, Model model) {
		
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
		int retire = 0;
		
		if(req.getParameter("retire") == null||!req.getParameter("retire").equals("on")) {
			retire = 0;
		} else {
			retire = 1;
		}
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("company", company);
		map2.put("retire", retire);
		cnt = dao.selectCnt(map2);
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
			map.put("retire", retire);
			List<join_mgcVO2> dtos = new ArrayList<join_mgcVO2>();
			List<join_mgcVO2> dtos2 = dao.selectList2(map);	// depart가 회사번호
			System.out.println("여기 탔다2");
			System.out.println(dtos2.toString());
			List<join_mgcVO2> dtos3 = dao.selectList3(map);	//depart가 부서번호
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

	@Override
	public void K_personal(HttpServletRequest req, Model model) {
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		AttendedSetVO attended = null;
		List<DayoffVO> dayoffList = null;
		
		attended = dao.getAttendedSet(company);
		attended.setGos(toTime(attended.getGo()));
		attended.setOffs(toTime(attended.getOff()));
		attended.setRest_starts(toTime(attended.getRest_start()));
		attended.setRest_ends(toTime(attended.getRest_end()));
		attended.setOver_starts(toTime(attended.getOver_start()));
		attended.setOver_ends(toTime(attended.getOver_end()));
		attended.setNight_starts(toTime(attended.getNight_start()));
		attended.setNight_ends(toTime(attended.getNight_end()));
		dayoffList = dao.getDayoffList(company);
		int holiday = dao.getHoliday(company);
		
		req.setAttribute("attended", attended);
		req.setAttribute("dayoffList", dayoffList);
		req.setAttribute("holiday", holiday);
	}

	@Override
	public void K_registpersonal(HttpServletRequest req, Model model) {
		int holiday = Integer.parseInt(req.getParameter("holiday"));
		String[] year_s = req.getParameterValues("year");
		int[] year = new int[year_s.length];
		for(int i=0; i<year.length; i++) {
			year[i] = Integer.parseInt(year_s[i]);
		}
		String[] day_s = req.getParameterValues("day");
		int[] day = new int[day_s.length];
		for(int i=0; i<day.length; i++) {
			day[i] = Integer.parseInt(day_s[i]);
		}
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		
		AttendedSetVO att = new AttendedSetVO();
		att.setCompany(company);
		att.setGo(toSecond(req.getParameter("go")));
		att.setOff(toSecond(req.getParameter("off")));
		att.setRest_start(toSecond(req.getParameter("rest_start")));
		att.setRest_end(toSecond(req.getParameter("rest_end")));
		att.setOver_start(toSecond(req.getParameter("over_start")));
		att.setOver_end(toSecond(req.getParameter("over_end")));
		att.setNight_start(toSecond(req.getParameter("night_start")));
		att.setNight_end(toSecond(req.getParameter("night_end")));
		att.setOver_sal(Integer.parseInt(req.getParameter("over_sal")));
		att.setNight_sal(Integer.parseInt(req.getParameter("night_sal")));
		
		int cnt = dao.UpdateAttendedSet(att);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("company", company);
		map.put("holiday", holiday);
		cnt *= dao.UpdateHoliday(map);
		
		cnt *= dao.deleteDayOff(company);
		
		for(int i=0; i<year.length; i++) {
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("company", company);
			map2.put("year", year[i]);
			map2.put("day", day[i]);
			cnt *= dao.insertDayoff(map2);
		}
		
		req.setAttribute("cnt", cnt);
	}

	@Override // 32400 -> '09:00' 으로 변경하는 메소드 
	public String toTime(int seconds) {
		int hour = seconds/3600;
		int minute = (seconds%3600)/60;
		
		String hours = "";
		String minutes = "";
		
		if(hour < 10) {
			hours = "0"+String.valueOf(hour);
		} else {
			hours = String.valueOf(hour);
		}
		
		if(minute == 0) {
			minutes = "00";
		} else if(minute < 10){
			minutes = "0" + String.valueOf(minute);
		} else {
			minutes = String.valueOf(minutes);
		}
		
		String time = hours + ":" + minutes;
		return time;
	}

	@Override // 반대로 32400 <- '09:00' 으로 변경하는 메소드 
	public int toSecond(String time) {
		String[] times = time.split(":");
		int hour = Integer.parseInt(times[0]);
		int minute = Integer.parseInt(times[1]);
		
		int seconds = hour*3600 + minute*60;
		return seconds;
	}

	@Override
	public void K_getMemberInfo(HttpServletRequest req, Model model) {
		String strId = req.getParameter("id");
		List<GroupsVO> groupsList = new ArrayList<GroupsVO>();
		List<GradeVO> gradeList = new ArrayList<GradeVO>();
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

		MemberVO dto = dao.memberInfo(id);
		groupsList = dao.getGroups(dto.getCompany());
		gradeList = dao.getGrade(dto.getCompany());
		String bf_groups = null;
		String bf_grade = null;
		for(int i=0; i<groupsList.size(); i++) {
			if(dto.getDepart() == groupsList.get(i).getGroupId()) {
				bf_groups = groupsList.get(i).getG_name();
			}
		}
		if(bf_groups == null) {
			bf_groups = dao.getCompanyName(dto.getCompany());
		}
		
		for(int i=0; i<gradeList.size(); i++) {
			if(dto.getRank() == gradeList.get(i).getRank()) {
				bf_grade = gradeList.get(i).getR_name();
			}
		}
		if(bf_grade == null) {
			bf_grade = "unknown";
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("groupsList", groupsList);
		model.addAttribute("gradeList", gradeList);
		model.addAttribute("bf_groups", bf_groups);
		model.addAttribute("bf_grade", bf_grade);
		model.addAttribute("company", dao.getCompanyName(dto.getCompany()));
	}

	@Override
	public void k_searchMemberInfo(HttpServletRequest req, Model model) {
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		
		System.out.println("회사 번호 :" + company);

		String search_title = req.getParameter("search_title");
		String search_content = req.getParameter("search_content");
		int retire = 0;
		
		if(req.getParameter("retire") == null||!req.getParameter("retire").equals("on")) {
			retire = 0;
		} else {
			retire = 1;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_title", search_title);
		map.put("search_content", search_content);
		map.put("company", company);
		map.put("retire", retire);
		
		int cnt = dao.search_salaryCnt(map);
		System.out.println(cnt);
		
		
		if (cnt == 1) {
			List<join_mgcVO2> dtos = dao.searchinfoList(map);
			System.out.println(dtos.toString());
			model.addAttribute("dtos", dtos);
			model.addAttribute("cnt", cnt);
		}
	}

	@Override
	public void K_infoUpdate(HttpServletRequest req, Model model) {
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		String id = req.getParameter("id");
		int depart = Integer.parseInt(req.getParameter("depart"));
		int rank = Integer.parseInt(req.getParameter("rank"));
		int wrkdvd = Integer.parseInt(req.getParameter("wrkdvd"));
		Date enterday = Date.valueOf(req.getParameter("enterday"));
		MemberVO vo = dao.memberInfo(id);
		int setDepart = vo.getDepart();
		int rank_mem = 0;
		
		System.out.println("id:"+id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("depart", depart);
		map.put("rank", rank);
		map.put("wrkdvd", wrkdvd);
		map.put("enterday", enterday);
		
		if(depart == setDepart) {
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("id", id);
			map2.put("setDepart", setDepart);
			GroupInfoVO vo2 = dao.getGroupInfo(map2);
			rank_mem = vo2.getRank_mem();
		}
		
		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("id", id);
		map3.put("setDepart", setDepart);
		dao.deleteGroupInfo(map3);
		if(depart != company) {
			Map<String, Object> map4 = new HashMap<String, Object>();
			map4.put("id", id);
			map4.put("depart", depart);
			map4.put("rank_mem", rank_mem);
			dao.insertGroupInfo(map4);
		}
		
		int updateCnt = dao.updateAdminMemberInfo(map);
		model.addAttribute("updateCnt", updateCnt);
	}

	@Override
	public void K_registRetirement(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		int updateCnt1 = dao.retireMember(id);
		int updateCnt2 = dao.retireUsers(id);
		int updateCnt = 0;
		
		if(updateCnt1==1 && updateCnt2==1) {
			updateCnt = 1;
		}
		model.addAttribute("updateCnt", updateCnt);
	}

	@Override
	public void K_restoMember(HttpServletRequest req, Model model) {
		
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
		
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		String name = null;
		if(req.getParameter("name") != null) {
			name = req.getParameter("name");
		}
		List<GroupsVO> groupsList = new ArrayList<GroupsVO>();
		List<GradeVO> gradeList = new ArrayList<GradeVO>();
		List<MemberVO> retireList = new ArrayList<MemberVO>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("retire", 1);
		map.put("company", company);
		map.put("name", name);
		
		if(name == null) {
			cnt = dao.selectCnt(map);
		} else {
			cnt = dao.selectCnt_name(map);
		}
		
		pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1"; // 첫페이지를 1페이지로 지정
		}
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		
		if (end > cnt)
			end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize;
		
		if (cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			if(name == null) {
				retireList = dao.getMemberList(map);
			} else {
				retireList = dao.getMemberList_name(map);
			}
			
			groupsList = dao.getGroups(company);
			gradeList = dao.getGrade(company);
			
			model.addAttribute("retireList", retireList);
			model.addAttribute("groupsList", groupsList);
			model.addAttribute("gradeList", gradeList);
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
 
		String companyName = dao.getCompanyName(company);
		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("pageNum", pageNum); // 페이지번호
		model.addAttribute("company", companyName); //회사 이름
		model.addAttribute("name", name); // 검색어
		
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
	}

	@Override
	public void K_restoMember_pro(HttpServletRequest req, Model model) {
		String id = req.getParameter("check");
		int depart = Integer.parseInt(req.getParameter("depart"));
		int rank = Integer.parseInt(req.getParameter("rank"));
		int updateCnt = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("depart", depart);
		map.put("rank", rank);
		
		int updateCnt1 = dao.updateRestoMember(map);
		int updateCnt2 = dao.updateRestoUsers(id);
		
		if(updateCnt1 !=0 && updateCnt2 != 0) {
			updateCnt = 1;
		}
		
		model.addAttribute("updateCnt", updateCnt);
	}

	@Override
	public void K_manageOrgan(HttpServletRequest req, Model model) {
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		String companyName = dao.getCompanyName(company);
		List<GroupsVO> groupsList = new ArrayList<GroupsVO>();
		groupsList = dao.getGroups(company);
		
		model.addAttribute("groupsList", groupsList);
		model.addAttribute("companyName", companyName);
	}

	@Override
	public void K_openOrgan(HttpServletRequest req, Model model) {
		String depart_s = req.getParameter("depart");
		int departLength = depart_s.length();
		String depart_sub = depart_s.substring(0, departLength-5);
		int depart = Integer.parseInt(depart_sub);
		
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		String companyName = dao.getCompanyName(company);
		if(depart == 0) {
			depart = company;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("company", company);
		map.put("depart", depart);
		List<join_mgiVO> mgiList = new ArrayList<join_mgiVO>();
		
		if(depart == company) {
			mgiList = dao.getMgiList2(company);
			for(int i = 0; i<mgiList.size(); i++) {
				mgiList.get(i).setLeader(0);
				mgiList.get(i).setDepartName(companyName);
			}
		} else {
			mgiList = dao.getMgiList(map);
		}
		model.addAttribute("mgiList", mgiList);
	}

	@Override
	public void K_createDepart(HttpServletRequest req, Model model) {
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		
		String departName = null;
		int insertCnt = 0;
		if(req.getParameter("departName").length() != 0) {
			departName = req.getParameter("departName");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("company", company);
			map.put("departName", departName);
			
			insertCnt = dao.createDepart(map);
		} else {
			insertCnt = -1;
		}
		
		model.addAttribute("insertCnt", insertCnt);
	}

	@Override
	public void K_updateDepart(HttpServletRequest req, Model model) {
		int depart = Integer.parseInt(req.getParameter("depart"));
		String departName = dao.getDepartName(depart);
		
		model.addAttribute("depart", depart);
		model.addAttribute("departName", departName);
	}

	@Override
	public void K_updateDepartName(HttpServletRequest req, Model model) {
		int depart = Integer.parseInt(req.getParameter("depart"));
		String dname = req.getParameter("dname");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("depart", depart);
		map.put("dname", dname);
		int updateCnt = dao.updateDepartName(map);
		
		model.addAttribute("updateCnt", updateCnt);
	}

	@Override
	public void K_deleteDepartName(HttpServletRequest req, Model model) {
		int depart = Integer.parseInt(req.getParameter("depart"));
		int count = dao.countDepartMember(depart);
		int deleteCnt = 0;
		if(count == 0) {
			deleteCnt = dao.deleteDepart(depart);
		} else {
			deleteCnt = -1;
		}
		
		model.addAttribute("deleteCnt", deleteCnt);
	}

	@Override
	public void K_updateDepartLeader(HttpServletRequest req, Model model) {
		int depart = Integer.parseInt(req.getParameter("depart"));
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("company", company);
		map.put("depart", depart);
		List<join_mgiVO> mgiList = new ArrayList<join_mgiVO>();
		mgiList = dao.getMgiList(map);
		
		model.addAttribute("mgiList", mgiList);
		model.addAttribute("depart", depart);
	}

	@Override
	public void K_departLeader_pro(HttpServletRequest req, Model model) {
		int depart = Integer.parseInt(req.getParameter("depart"));
		String id = req.getParameter("check");
		int updateCnt1 = 0;
		int updateCnt2 = 0;
		int updateCnt = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("depart", depart);
		
		updateCnt1 = dao.changeleader1(depart);
		updateCnt2 = dao.changeleader2(map);
		if(updateCnt1!=0 && updateCnt2!=0) {
			updateCnt = 1;
		}
		
		model.addAttribute("updateCnt", updateCnt);
	}
	
	// 직급관리
	@Override
	public void K_manageRank(HttpServletRequest req, Model model) {
		
	}

	//우리회사 관리자
	@Override
	public void K_ourManager(HttpServletRequest req, Model model) {
		
	}	
	
}
