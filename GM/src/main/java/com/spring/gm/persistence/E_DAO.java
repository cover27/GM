package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;


import com.spring.gm.vo.AddressMemVO;
import com.spring.gm.vo.GroupsVO;
import com.spring.gm.vo.MemberVO;



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
	
	// 자주 연락하는 사람 명수
	public int getMyFavoriteMemberCnt(String strId);
	
	// 자주 연락하는 사람 목록
	public List<AddressMemVO> getMyFavoriteMemberList(Map<String, Object> map);
	
	// 맴버 상세페이지
	public MemberVO content(String strId);
	
	// 자주 연락하는 사람 추가
	public int addMember(AddressMemVO vo);
	
	// 자주 연락하는 사람들 추가
	public int addMembers(AddressMemVO vo);
	
	// 자주 연락하는 사람 삭제
	public int deleteMember(AddressMemVO vo);
	
	// 아이디 체크
	public int idCheck(Map<String, Object> map);
}
