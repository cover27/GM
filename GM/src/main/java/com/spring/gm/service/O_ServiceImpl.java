package com.spring.gm.service;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.gm.persistence.O_DAO;
import com.spring.gm.vo.Join_payVO;
import com.spring.gm.vo.MemberVO;

@Service
public class O_ServiceImpl implements O_Service{

	@Autowired
	O_DAO dao;
	
	//전자결재 - 기안문 작성
	@Override
	public void createApprDoc(HttpServletRequest req, Model model) {
		
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		int depart = ((MemberVO)req.getSession().getAttribute("loginInfo")).getDepart();
		
		//기안문 클릭 시 select문
		Join_payVO vo = new Join_payVO();
		
		if(depart < 410000000) { // 부서를 가지고 있는 경우
			vo = dao.createAppDocForm(id);
			System.out.print(vo);
		} else { // 부서가 없어서 회사이름이 들어가는 경우
			vo = dao.createAppDocForm2(id);
			System.out.print(vo);
		}
		model.addAttribute("vo", vo);
		
		
	}

}
