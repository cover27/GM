package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.gm.persistence.D_DAO;
import com.spring.gm.vo.BoardsVO;


@Service
public class D_ServiceImpl implements D_Service{

	@Autowired
	D_DAO dao;
	
	@Override
	public void insertBoards(HttpServletRequest req, Model model) {
		
		BoardsVO vo = new BoardsVO();
		String group = req.getParameter("groupId");
		int groupId = Integer.parseInt(group);
		String b_name = req.getParameter("b_name");
		String anon_i = req.getParameter("anon");
		int anon = Integer.parseInt(anon_i);
		int del = 0;
		
		vo.setGroupId(groupId);
		vo.setB_name(b_name);
		vo.setAnon(anon);
		vo.setDel(del);
		
		
		int insertCnt = dao.insertBoards(vo);
		
		req.setAttribute("insertCnt",insertCnt);
	}

}
