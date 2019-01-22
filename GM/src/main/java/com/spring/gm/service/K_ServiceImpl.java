package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.gm.persistence.K_DAO;
import com.spring.gm.vo.MemberVO;

@Service
public class K_ServiceImpl implements K_Service{

	@Autowired
	K_DAO dao;
	
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
	
	

}
