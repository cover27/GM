package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import com.spring.gm.vo.GroupsVO;
import com.spring.gm.vo.MemberVO;



public interface E_DAO {

	// 같은회사의 사원 명수
	public int getCompanyMemberCnt(int company);
	
	// 같은회사의 사원 목록
	public List<MemberVO> getCompanyMemberList(Map<String, Object> map);
	
	// 같은회사의 사원 명수
	public int getCompanyCnt(int company);

	// 부서 리스트
	public List<GroupsVO> getCompanyList(Map<String, Object> map);

}
