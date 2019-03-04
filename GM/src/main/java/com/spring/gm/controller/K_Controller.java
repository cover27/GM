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
import com.spring.gm.service.S_Service;
import com.spring.gm.vo.BoardListVO;
import com.spring.gm.vo.MemberVO;

@Controller
public class K_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(K_Controller.class);

	@Autowired
	K_Service service;
	
	@Autowired
	S_Service S_service;
		
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
			S_service.messageListCnt(req, model);
		}
		
		// 경주니
		System.out.println("vo확인"+((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank());
		int sys_rank = ((MemberVO) req.getSession().getAttribute("loginInfo")).getSys_rank();
		System.out.println("sys_rank : " +  sys_rank);
		model.addAttribute("sys_rank",sys_rank);
		
		String url = "";
		//최고관리자가 로그인하면 관리자화면으로 이동
		if(sys_rank != 9) {
			url = "common/main";
		} else {
			url = "master/main";
		}
		return url;
	}
	
	// 회원가입 선택
	@RequestMapping("selectCreateAccount")
	public String selectCreateAccount(HttpServletRequest req, Model model) {
		logger.info("URL : selectCreateAccount");
		
		return "common/selectCreateAccount";
	}
	
	// 회원가입화면 - 새 사업장
	@RequestMapping("createCompany")
	public String createCompany(HttpServletRequest req, Model model) {
		logger.info("URL : K_createCompany");
		
		return "common/K_createCompany";
	}
	
	// 회원가입화면 - 기존사업장
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
	
	// 회사 정보입력
	@RequestMapping("companyInfo")
	public String companyInfo(HttpServletRequest req, Model model) {
		logger.info("URL : companyInfo");
				
		return "common/companyInfo";
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
	
	//인사정보등록
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
	
	//인사정보 재등록 - 복구버튼
	@RequestMapping("admin/K_restoMember_pro")
	public String K_restoMember_pro(HttpServletRequest req, Model model) {
		logger.info("URL : K_restoMember_pro");
		
		service.K_restoMember_pro(req, model);
		
		return "admin/sub/K_restoMember_pro";
	}
	
	// 사용자 조직도 관리
	@RequestMapping("admin/K_manageOrgan")
	public String K_manageOrgan(HttpServletRequest req, Model model) {
		logger.info("URL : K_manageOrgan");
		
		service.K_manageOrgan(req, model);
		
		return "admin/K_manageOrgan";
	}
	
	@RequestMapping("admin/K_openOrgan")
	public String K_openOrgan(HttpServletRequest req, Model model) {
		logger.info("URL : K_openOrgan");
		
		service.K_openOrgan(req, model);
		
		return "admin/sub/K_openOrgan";
	}
	
	@RequestMapping("admin/K_createDepart")
	public String K_createDepart(HttpServletRequest req, Model model) {
		logger.info("URL : K_createDepart");
		
		service.K_createDepart(req, model);
		
		return "admin/sub/K_createDepart";
	}
	
	@RequestMapping("admin/K_updateDepart")
	public String K_updateDepart(HttpServletRequest req, Model model) {
		logger.info("URL : K_updateDepart");
		
		service.K_updateDepart(req, model);
		
		return "admin/sub/K_updateDepart";
	}
	
	@RequestMapping("admin/K_updateDepartName")
	public String K_updateDepartName(HttpServletRequest req, Model model) {
		logger.info("URL : K_updateDepartName");
		
		service.K_updateDepartName(req, model);
		
		return "admin/sub/K_updateDepartName";
	}
	
	@RequestMapping("admin/K_deleteDepartName")
	public String K_deleteDepartName(HttpServletRequest req, Model model) {
		logger.info("URL : K_deleteDepartName");
		
		service.K_deleteDepartName(req, model);
		
		return "admin/sub/K_deleteDepartName";
	}
	
	@RequestMapping("admin/K_updateDepartLeader")
	public String K_updateDepartLeader(HttpServletRequest req, Model model) {
		logger.info("URL : K_updateDepartLeader");
		
		service.K_updateDepartLeader(req, model);
		
		return "admin/sub/K_updateDepartLeader";
	}
	
	@RequestMapping("admin/K_departLeader_pro")
	public String K_departLeader_pro(HttpServletRequest req, Model model) {
		logger.info("URL : K_departLeader_pro");
		
		service.K_departLeader_pro(req, model);
		
		return "admin/sub/K_departLeader_pro";
	}
	
	//직급관리
	@RequestMapping("admin/K_manageRank")
	public String K_manageRank(HttpServletRequest req, Model model) {
		logger.info("URL : K_manageRank");
		
		service.K_manageRank(req, model);
		
		return "admin/K_manageRank";
	}
	
	// 직급삭제
	@RequestMapping("admin/K_deleteRank")
	public String K_deleteRank(HttpServletRequest req, Model model) {
		logger.info("URL : K_deleteRank");
		
		service.K_deleteRank(req, model);
		
		return "admin/sub/K_deleteRank";
	}
	
	// 직급추가
	@RequestMapping("admin/K_addRank")
	public String K_addRank(HttpServletRequest req, Model model) {
		logger.info("URL : K_addRank");
		
		service.K_addRank(req, model);
		
		return "admin/sub/K_deleteRank";
	}
	
	//직급 등록
	@RequestMapping("admin/K_manageRank_pro")
	public String K_manageRank_pro(HttpServletRequest req, Model model) {
		logger.info("URL : K_manageRank_pro");
		
		service.K_manageRank_pro(req, model);
		
		return "admin/sub/K_manageRank_pro";
	}
	
	//우리회사 관리자
	@RequestMapping("admin/K_ourManager")
	public String K_ourManager(HttpServletRequest req, Model model) {
		logger.info("URL : K_ourManager");
		
		service.K_ourManager(req, model);
		
		return "admin/K_ourManager";
	}
	
	//사용자 -> 관리자
	@RequestMapping("admin/K_insertManager")
	public String K_insertManager(HttpServletRequest req, Model model) {
		logger.info("URL : K_insertManager");
		
		service.K_insertManager(req, model);
		
		return "admin/sub/K_insertManager";
	}
	
	//관리자 ->사용자
	@RequestMapping("admin/K_deleteManager")
	public String K_deleteManager(HttpServletRequest req, Model model) {
		logger.info("URL : K_deleteManager");
		
		service.K_deleteManager(req, model);
		
		return "admin/sub/K_deleteManager";
	}
	
	//휴무 승인/취소
	@RequestMapping("admin/K_appHoliday")
	public String K_appHoliday(HttpServletRequest req, Model model) {
		logger.info("URL : K_appHoliday");
		
		service.K_appHoliday(req, model);
		
		return "admin/K_appHoliday";
	}
	
	//휴무 승인취소 처리
	@RequestMapping("admin/K_appHoliday_pro")
	public String K_appHoliday_pro(HttpServletRequest req, Model model) {
		logger.info("URL : K_appHoliday_pro");
		
		service.K_appHoliday_pro(req, model);
		
		return "admin/K_appHoliday_pro";
	}
	
	//시스템관리자 - 회사목록
	@RequestMapping("master/companiesList")
	public String companiesList(HttpServletRequest req, Model model) {
		logger.info("URL : companiesList");
		
		service.companiesList(req, model);
		
		return "master/companiesList";
	}
	
	//시스템관리자 - 회사목록 - 상세인원 확인
	@RequestMapping("master/adminList")
	public String adminList(HttpServletRequest req, Model model) {
		logger.info("URL : adminList");
		
		service.adminList(req, model);
		
		return "master/sub/adminList";
	}
	
	//시스템관리자 - 회사 가입 승인
	@RequestMapping("master/appCompanies")
	public String appCompanies(HttpServletRequest req, Model model) {
		logger.info("URL : appCompanies");
		
		service.appCompanies(req, model);
		
		return "master/appCompanies";
	}
	
	//시스템관리자 - 회사 가입승인취소 처리
	@RequestMapping("master/appCompanies_pro")
	public String appCompanies_pro(HttpServletRequest req, Model model) {
		logger.info("URL : appCompanies_pro");
		
		service.appCompanies_pro(req, model);
		
		return "master/appCompanies_pro";
	}
	
	//공지사항
	@RequestMapping("pages/K_noticeBoard")
	public String K_noticeBoard(HttpServletRequest req, Model model) {
		logger.info("URL : K_noticeBoard");
		
		service.K_noticeBoard(req, model);
		
		return "pages/K_noticeBoard";
	}
	
	//공지사항 글쓰기
	@RequestMapping("master/K_noticeWrite")
	public String K_noticeWrite(HttpServletRequest req, Model model) {
		logger.info("URL : K_noticeWrite");
		
		return "master/K_noticeWrite";
	}
	
	//공지사항 글쓰기 처리
	@RequestMapping("master/K_noticeWritePro")
	public String K_noticeWritePro(HttpServletRequest req, Model model) {
		logger.info("URL : K_noticeWritePro");
		
		service.K_noticeWritePro(req, model);
		
		return "master/sub/K_noticeWritePro";
	}
	
	//공지사항 상세 페이지
	@RequestMapping("pages/K_noticeContent")
	public String K_noticeContent(HttpServletRequest req, Model model) {
		logger.info("URL : K_noticeContent");
		
		service.K_noticeContent(req, model);
		
		return "pages/K_noticeContent";
	}
	
	//공지사항 수정
	@RequestMapping("master/K_updateNotice")
	public String K_updateNotice(HttpServletRequest req, Model model) {
		logger.info("URL : K_updateNotice");
		
		service.K_updateNotice(req, model);
		
		return "master/K_updateNotice";
	}
	
	//공지사항 수정 처리
	@RequestMapping("master/K_updateNotice_pro")
	public String K_updateNotice_pro(HttpServletRequest req, Model model) {
		logger.info("URL : K_updateNotice_pro");
		
		service.K_updateNotice_pro(req, model);
		
		return "master/sub/K_updateNotice_pro";
	}
	
	//공지사항 수정
	@RequestMapping("master/K_deleteNotice")
	public String K_deleteNotice(HttpServletRequest req, Model model) {
		logger.info("URL : K_deleteNotice");
		
		service.K_deleteNotice(req, model);
		
		return "master/sub/K_deleteNotice";
	}
	
	//메시지 보내는 창
	@RequestMapping("master/K_sendingMessage")
	public String K_sendingMessage(HttpServletRequest req, Model model) {
		logger.info("URL : K_sendingMessage");
		
		service.K_sendingMessage(req, model);
		
		return "master/sub/K_sendingMessage";
	}
	
	//메시지 보내는 창
	@RequestMapping("master/K_sendMessage_pro")
	public String K_sendMessage_pro(HttpServletRequest req, Model model) {
		logger.info("URL : K_sendMessage_pro");
		
		service.K_sendMessage_pro(req, model);
		
		return "master/sub/K_sendMessage_pro";
	}
}
