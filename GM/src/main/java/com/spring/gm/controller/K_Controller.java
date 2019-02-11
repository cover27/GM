package com.spring.gm.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.gm.service.K_Service;

@Controller
public class K_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(K_Controller.class);

	@Autowired
	K_Service service;
		
	// 로그인화면
	@RequestMapping("login")
	public String login(HttpServletRequest req, Model model) {
		logger.info("URL : login");
		
		return "common/login";
	}
	
	// 로그인 프로세스
	@RequestMapping("loginPro")
	public String loginPro(HttpServletRequest req, Model model) {
		logger.info("URL : login");
		
		return "common/main";
	}
	
	// 메인화면
	@RequestMapping("main")
	public String main(HttpServletRequest req, Model model) {
		logger.info("URL : main");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String id = authentication.getName();
		
		if(id != null) {
			service.login(req, model, id);
		}
		
		return "common/main";
	}
	
	// 회원가입화면
	@RequestMapping("createAccount")
	public String createAccount(HttpServletRequest req, Model model) {
		logger.info("URL : K_createAccount");
		
		return "common/K_createAccount";
	}
	
	// 아이디 중복확인
	@RequestMapping("confirmId")
	public String confirmId(HttpServletRequest req, Model model) {
		logger.info("URL : K_confirmId");
		
		service.confirmId(req, model);
		
		return "common/K_confirmId";
	}
	
	// 회사 찾기(그냥 클릭했을때 검색안했을경우)
	@RequestMapping("findCompany")
	public String findCompany(HttpServletRequest req, Model model) {
		logger.info("URL : K_findCompany");
		
		service.findCompany(req, model);
		
		return "common/K_findCompany";
	}
	
	// 회사 찾기(그냥 클릭했을때 검색안했을경우)
	@RequestMapping("searchCompany")
	public String searchCompany(HttpServletRequest req, Model model) {
		logger.info("URL : K_searchCompany");
		
		service.searchCompany(req, model);
		
		return "common/K_findCompany";
	}
	
	// 회원등록
	@RequestMapping("registAccount")
	public String registAccount(HttpServletRequest req, Model model) {
		logger.info("URL : K_registAccount");
		
		service.registAccount(req, model);
		
		return "common/K_registAccount";
	}
	
	//우측상단에 로그아웃 누르면 로그아웃되면서 로그인화면으로 가짐
	@RequestMapping("logout")
	public String logout(HttpServletRequest req, Model model) {
		logger.info("URL : logout");
		
		req.getSession().removeAttribute("loginInfo");
		
		return "common/login";
	}
	
	//인사관리 - 대기명단 승인/취소가 기본
	@RequestMapping("admin/K_member_manage")
	public String K_member_manage(HttpServletRequest req, Model model) {
		logger.info("URL : K_member_manage");
		
		service.member_manage(req, model);
		
		return "admin/K_member_manage";
	}
	
	// 대기명단 승인/취소
	@RequestMapping("admin/K_appMember")
	public String K_appMember(HttpServletRequest req, Model model) {
		logger.info("URL : K_appMember");
		
		service.K_appMember(req, model);
		
		return "admin/K_appMember";
	}
	
	//인사정보등록 - 경준씨거 배낄거임 ㅎㅎㅎ 
	@RequestMapping("admin/K_resistMemberInfo")
	public String K_resistMemberInfo(HttpServletRequest req, Model model) {
		logger.info("URL : K_resistMemberInfo");
		String title = req.getParameter("search_title");
		String content = req.getParameter("search_content");
		if((title == null && content == null) || title.equals("allList")  ) {	// 검색 안했을 경우
			service.K_resistMemberInfo(req, model);
		} else if(title != null){
			if(title != null && content.length() > 0) {
				System.out.println("검색 했을 경우") ;
				service.k_searchMemberInfo(req, model);
			} else if(title != null && content.length() <= 0){
				System.out.println("검색 실패하였습니다. 확인해 주세여");
				return "admin/sub/K_SalaryDefaultSettingPro_sub";
			}
		}
		
		return "admin/K_resistMemberInfo";
	}
	
	// 개인정보 가져오기(Ajax)
	@RequestMapping("admin/K_getMemberInfo")
	public String K_getMemberInfo(HttpServletRequest req, Model model) {
		logger.info("URL : K_getMemberInfo");
		service.K_getMemberInfo(req, model);
		
		return "admin/sub/K_openMember";
	}
	
	//개인정보 수정
	@RequestMapping("admin/K_updateMemberInfo")
	public String K_updateMemberInfo(HttpServletRequest req, Model model) {
		logger.info("URL : K_updateMemberInfo");
		service.K_getMemberInfo(req, model);
		
		return "admin/sub/K_updateMemberInfo";
	}
	
	//개인정보 업데이트
	@RequestMapping("/admin/K_infoUpdate")
	public String K_infoUpdate(HttpServletRequest req, Model model) {
		logger.info("URL : K_infoUpdate");
		service.K_infoUpdate(req, model);
		return "admin/sub/K_infoUpdate";
	}
	
	//근태/급여기준정보설정
	@RequestMapping("admin/K_personal")
	public String K_personal(HttpServletRequest req, Model model) {
		logger.info("URL : K_personal");
		
		service.K_personal(req, model);
		
		return "admin/K_personal";
	}
	
	// 근태 및 급여설정 변경
	@RequestMapping("admin/registpersonal")
	public String K_registpersonal(HttpServletRequest req, Model model) {
		logger.info("URL : K_registpersonal");
		
		service.K_registpersonal(req, model);
		
		return "admin/K_registpersonal";
	}
	
	//퇴사자 등록
	@RequestMapping("admin/K_registRetirement")
	public String K_registRetirement(HttpServletRequest req, Model model) {
		logger.info("URL : K_registRetirement");
		
		service.K_registRetirement(req, model);
		
		return "admin/sub/K_registRetirement";
	}
	
	//인사정보 재등록
	@RequestMapping("admin/K_restoMember")
	public String K_restoMember(HttpServletRequest req, Model model) {
		logger.info("URL : K_restoMember");
		
		service.K_restoMember(req, model);
		
		return "admin/K_restoMember";
	}
	
}
