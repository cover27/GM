package com.spring.gm.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.join_mgcVO;
public interface J_DAO {
	//급여 회원정보 확인
	public int selectCnt(int company);
	//급여 회원정보 가져오기(부서번호가 회사명)
	public ArrayList<join_mgcVO> selectList2(Map<String, Object> map);
	//급여 회원정보 가져오기(부서번호가 부서명)
	public ArrayList<join_mgcVO> selectList3(Map<String, Object> map);
	//급여 개인회원정보 가져오기
	public ArrayList<MemberVO> infoList(String id);
	// 회원 급여 개인정보 업데이트
	public int infoUpdate(Map<String, Object> map);
	
	
	//검색 급여 회원정보 가져오기
	public int search_salaryCnt(Map<String, Object> map);
	public ArrayList<join_mgcVO> searchinfoList(Map<String, Object> map);
	public ArrayList<join_mgcVO> searchinfoList3(Map<String, Object> map);
	public ArrayList<join_mgcVO> searchinfoList2(Map<String, Object> map);
	public ArrayList<join_mgcVO> searchinfoList4(Map<String, Object> map);
	public ArrayList<join_mgcVO> searchinfoList5(Map<String, Object> map);
}
