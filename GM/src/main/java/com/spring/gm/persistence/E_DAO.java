package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import com.spring.gm.vo.GroupsVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.MemoVO;

public interface E_DAO {

	// 조직도 - 내가 속한 그룹멤버 수 구하기
	public int getMyCompanyMemCnt(int company);
	
	// 조직도 - 사용자가 소속된 회사 멤버 목록
	public List<MemberVO> getMyCompanyInfo(int company);
	
	// 조직도 - 내가 속한 회사의 전체 그룹 수 구하기
	public List<GroupsVO> getMyCompanyGroupCnt(int company);
	
	// 조직도 - 부서 aside 용
	public List<MemberVO> getMyCompanyInfo2(Map<String, Object> map);
	
	// 조직도 - 로그인 정보 회사 이름 찾기
	public String findCompanyName(int company);
	
	// 조직도 - 개인 그룹 목록
//	public List<MemberVO> getMyCompanyInfo3(Map<String, Object> map);
}
