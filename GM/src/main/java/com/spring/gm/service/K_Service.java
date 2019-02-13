package com.spring.gm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface K_Service {
	
	public void login(HttpServletRequest req, Model model, String id);
	
	public void confirmId(HttpServletRequest req, Model model);
	
	public void findCompany(HttpServletRequest req, Model model);
	
	public void searchCompany(HttpServletRequest req, Model model);
	
	public void registAccount(HttpServletRequest req, Model model);
	
	public void member_manage(HttpServletRequest req, Model model);
	
	public void K_appMember(HttpServletRequest req, Model model);
	
	public void K_resistMemberInfo(HttpServletRequest req, Model model);
	
	public void K_personal(HttpServletRequest req, Model model);
	
	public void K_registpersonal(HttpServletRequest req, Model model);
	
	public String toTime(int seconds);
	
	public int toSecond(String time);
	
	public void K_getMemberInfo(HttpServletRequest req, Model model);
	
	public void k_searchMemberInfo(HttpServletRequest req, Model model);
	
	public void K_infoUpdate(HttpServletRequest req, Model model);
	
	public void K_registRetirement(HttpServletRequest req, Model model);
	
	public void K_restoMember(HttpServletRequest req, Model model);
	
	public void K_restoMember_pro(HttpServletRequest req, Model model);
	
	public void K_manageOrgan(HttpServletRequest req, Model model);
	
	public void K_openOrgan(HttpServletRequest req, Model model);
	
	public void K_createDepart(HttpServletRequest req, Model model);
	
	public void K_updateDepart(HttpServletRequest req, Model model);
	
	public void K_updateDepartName(HttpServletRequest req, Model model);
	
	public void K_deleteDepartName(HttpServletRequest req, Model model);
	
	public void K_updateDepartLeader(HttpServletRequest req, Model model);
	
	public void K_departLeader_pro(HttpServletRequest req, Model model);
	
	public void K_manageRank(HttpServletRequest req, Model model);
	
	public void K_ourManager(HttpServletRequest req, Model model);
	
}
