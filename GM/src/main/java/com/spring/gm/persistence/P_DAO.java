package com.spring.gm.persistence;

import java.util.List;

import com.spring.gm.vo.Join_payVO;

public interface P_DAO {
	
	//전자결재 - 기안문 생성
		public Join_payVO createAppDocForm(String id); // 부서 조인
		public Join_payVO createAppDocForm2(String id); // 회사 조인
		
		//전자결재 - 기안문 - 결재선
		public List<Join_payVO> selectApprLine(); //결재선 조회 조인문
		public List<String> getGroupName(int company);//결재선 부서명
	
}
