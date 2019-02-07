package com.spring.gm.persistence;

import com.spring.gm.vo.Join_payVO;

public interface O_DAO {
	
	//전자결재 - 기안문 생성
	public Join_payVO createAppDocForm(String id); // 부서 조인
	
	public Join_payVO createAppDocForm2(String id); // 회사 조인

}
