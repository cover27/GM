package com.spring.gm.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.gm.persistence.K_DAO;
import com.spring.gm.vo.AttendedSetVO;
import com.spring.gm.vo.CompaniesVO;
import com.spring.gm.vo.DayoffVO;
import com.spring.gm.vo.MemberVO;

@Service
public class K_ServiceImpl implements K_Service{

	@Autowired
	K_DAO dao;
	
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
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		
		List<MemberVO> list = null;
		list = dao.getMembers(company);
		
		req.setAttribute("list", list);
	}

	@Override
	public void K_personal(HttpServletRequest req, Model model) {
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		AttendedSetVO attended = null;
		List<DayoffVO> dayoffList = null;
		
		attended = dao.getAttendedSet(company);
		dayoffList = dao.getDayoffList(company);
		int holiday = dao.getHoliday(company);
		
		req.setAttribute("attended", attended);
		req.setAttribute("dayoffList", dayoffList);
		req.setAttribute("holiday", holiday);
	}
	
}
