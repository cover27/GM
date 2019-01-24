package com.spring.gm.persistence;

import java.util.List;

import com.spring.gm.vo.CompaniesVO;
import com.spring.gm.vo.MemberVO;

public interface K_DAO {

	public MemberVO memberInfo(String id);
	
	public List<CompaniesVO> findCompany();
	
	public List<CompaniesVO> searchCompany(String keyword);
	
	public int registAccount(MemberVO vo);
	
}
