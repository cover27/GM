package com.spring.gm.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.gm.vo.BonusCutVO;
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
	
	//------------- 기본수당 외 수당관리-------------------------------------------
	// 급여 개인회원수당 정보 가져오기
	public int J_extrapayinfoCnt(String id);
	public ArrayList<BonusCutVO> J_extrapayinfo(String id);
	// 개인 급여수당정보 업데이트
	public int J_extrapayinfoUpdate(Map<String, Object> map);
	// 개인 num에대한 id 값 가져오기
	public BonusCutVO numId(int num);
	// 개인 급여수당정보 삭제하기
	public int deleteInfo(int num);
}
