package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import com.spring.gm.vo.AddressGroupVO;
import com.spring.gm.vo.GroupsVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.MessageVO;



public interface E_DAO {

	// 같은회사의 사원 명수
	public int getCompanyMemberCnt(int company);
	
	// 같은회사의 사원 목록
	public List<MemberVO> getCompanyMemberList(Map<String, Object> map);

	// 부서 리스트
	public List<GroupsVO> getCompanyList(Map<String, Object> map);
	
	// 부서의 사원 명수
	public int getDepartMemberCnt(int depart);

	// 부서의 사원 목록
	public List<GroupsVO> getDepartMemberList(Map<String, Object> map);
	
	// 자주 연락하는 사람 목록
	public List<AddressGroupVO> getMyFavoriteMemberList(Map<String, Object> map);
	
	// 맴버 상세페이지
	public MemberVO content(String strId);
}
