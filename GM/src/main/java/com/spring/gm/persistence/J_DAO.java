package com.spring.gm.persistence;

import java.util.ArrayList;
import java.util.Map;

import com.spring.gm.vo.MemberVO;
public interface J_DAO {
	//급여 회원정보 확인
	public int selectCnt();
	//급여 회원정보 가져오기
	public ArrayList<MemberVO> selectList(Map<String, Object> map);

	//급여 개인회원정보 가져오기
	public ArrayList<MemberVO> infoList(String id);
	// 회원 급여 개인정보 업데이트
	public int infoUpdate(Map<String, Object> map);
	
	
	
	//검색 급여 회원정보 가져오기
	public int search_salaryCnt(Map<String, String> map);
	public ArrayList<MemberVO> searchinfoList(Map<String, String> map);
	public ArrayList<MemberVO> searchinfoList2(Map<String, String> map);
}
