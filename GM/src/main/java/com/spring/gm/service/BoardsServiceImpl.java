package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.gm.vo.BoardsVO;

@Service
public class BoardsServiceImpl implements BoardsService{

	@Override
	public void insertBoards(HttpServletRequest req, Model model) {
		
		int insertCnt = 0;
		
		int num = Integer.parseInt(req.getParameter("num"));
		int groupId = Integer.parseInt(req.getParameter("groupId"));
		String b_name = req.getParameter("b_name");
		int anon = Integer.parseInt(req.getParameter("anon"));
		
		BoardsVO boardsVO = new BoardsVO();
		boardsVO.setNum(num);
		boardsVO.setGroupId(groupId);
		boardsVO.setB_name(b_name);
		boardsVO.setAnon(anon);
		boardsVO.setDel(0);
		
		 
	}

}
