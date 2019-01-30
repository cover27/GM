package android.spring.android.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import android.spring.android.HomeController;
import android.spring.android.persistence.AndroidDAO;
import android.spring.android.vo.Member;

@Controller
public class AndroidController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	AndroidDAO dao;
	
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
		in.put("member_id", id);
		in.put("member_pwd", pwd);
		int cnt = dao.confirmIdPwd(in);

		//웹에서 전달할 값
		Map<String, String> out = new HashMap<String, String>();
		if(cnt != 0) {
			out.put("member_id", id);
		} else {
			out.put("member_id", null);
		}
		
		return out;
	}
	
	//앱 마이페이지
	@ResponseBody
	@RequestMapping("androidMyPageMain")
	public Map<String, Object> androidMyPageMain(HttpServletRequest req) {
		logger.info("androidMyPageMain()");
	
		//회원 정보
		String id = req.getParameter("id");
		Member m = dao.getMemberInfo(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data1", m.getMember_name());
		map.put("data2", 0);
		map.put("data3", 0);
		map.put("data4", 0);
		map.put("member", m);
	
		return map;
	}
}
