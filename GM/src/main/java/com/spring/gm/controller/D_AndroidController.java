package com.spring.gm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.gm.HomeController;
import com.spring.gm.persistence.D_DAO;
import com.spring.gm.vo.MemberVO;


@Controller
public class D_AndroidController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Autowired
	D_DAO dao;
	
	//앱 로그인
	@ResponseBody//웹에서 안드로이드로 값을 전달하기 위한 어노테이션
	@RequestMapping("androidSignIn")
	public Map<String, String> androidSignIn(HttpServletRequest req){
		logger.info("androidSignIn()");
		
		//안드로이드에서 전달한 값
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		System.out.println("id:" + id + " pwd:" + pwd);
		
		Map<String, String> in = new HashMap<String, String>();
		in.put("id", id);
		in.put("pwd", pwd);
		int cnt = dao.confirmIdPwd(in);

		//웹에서 안드로이드로 전달할 값(JSON 형태로 전달) : gson 라이브러리에 전달하기 위하여 키와 값으로 만들어진 내용이 전달되어야 함.
		Map<String, String> map = new HashMap<String, String>();
		if(cnt != 0) {
			map.put("id", id);
		} else {
			map.put("id", null);
		}
		
		return map;
	}
	
	//앱 마이페이지
	@ResponseBody
	@RequestMapping("androidMyPageMain")
	public Map<String, Object> androidMyPageMain(HttpServletRequest req) {
		logger.info("androidMyPageMain()");
	
		//회원 정보
		String id = req.getParameter("id");
		MemberVO m = dao.getMemberInfo(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data1", m.getName());
		map.put("data2", 0);
		map.put("data3", 0);
		map.put("data4", 0);
		map.put("member", m);
	
		return map;
	}
	
}

