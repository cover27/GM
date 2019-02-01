package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.MemoVO;

public interface E_DAO {

	// 조직도 - 내가 속한 그룹멤버 수 구하기
	public int getMyCompanyMemCnt(int company);
	
	// 조직도 - 사용자가 소속된 회사 멤버 목록
	public List<MemberVO> getMyCompanyInfo(int company);
	
	//
}
