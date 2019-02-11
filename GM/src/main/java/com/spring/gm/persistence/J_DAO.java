package com.spring.gm.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.gm.vo.BonusCutVO;
import com.spring.gm.vo.CompaniesVO;
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
	// 회사명 가져오기
	public ArrayList<CompaniesVO> companyName(int company);
	// 날짜만 입력하여 검색시
	public int selectCnt(Map<String, Object> map);
	public ArrayList<join_mgcVO> salarySearchList1_1(Map<String, Object> map);//입사일 년도로 기준
	public ArrayList<join_mgcVO> salarySearchList1_2(Map<String, Object> map);//입사일 년도로 기준
	public ArrayList<join_mgcVO> salarySearchList2_1(Map<String, Object> map);//입사일 월로 기준
	public ArrayList<join_mgcVO> salarySearchList2_2(Map<String, Object> map);//입사일 월로 기준
	public ArrayList<join_mgcVO> salarySearchList3_1(Map<String, Object> map);//입사일 일별로 기준
	public ArrayList<join_mgcVO> salarySearchList3_2(Map<String, Object> map);//입사일 일별로 기준
	// 수당 검색 회원목록 갯수 가져오기(부서 날짜검색 안했을시)
	public int selectNoneDepartCnt(Map<String, Object> map);
	public ArrayList<join_mgcVO> selectNoneDepartList(Map<String, Object> map);
	// 수당 검색 회원목록 갯수 가져오기(아이디 날짜검색 안했을시)
	public int selectNoneIdCnt(Map<String, Object> map);
	public ArrayList<join_mgcVO> selectNoneIdList(Map<String, Object> map);
	public ArrayList<join_mgcVO> selectNoneIdList2(Map<String, Object> map);
	// 수당  검색 회원목록  가져오기(id검색시)
	public ArrayList<join_mgcVO> salaryIdSearchList1_1(Map<String, Object> map);//입사일 년도로 기준
	public ArrayList<join_mgcVO> salaryIdSearchList1_2(Map<String, Object> map);//입사일 년도로 기준
	public ArrayList<join_mgcVO> salaryIdSearchList2_1(Map<String, Object> map);//입사일 월로 기준
	public ArrayList<join_mgcVO> salaryIdSearchList2_2(Map<String, Object> map);//입사일 월로 기준
	public ArrayList<join_mgcVO> salaryIdSearchList3_1(Map<String, Object> map);//입사일 일별로 기준
	public ArrayList<join_mgcVO> salaryIdSearchList3_2(Map<String, Object> map);//입사일 일별로 기준
	
	// 수당  검색 회원목록  가져오기(depart검색시)
	public ArrayList<join_mgcVO> salaryDepartSearchList1(Map<String, Object> map);//입사일 년도로 기준
	public ArrayList<join_mgcVO> salaryDepartSearchList2(Map<String, Object> map);//입사일 월로 기준
	public ArrayList<join_mgcVO> salaryDepartSearchList3(Map<String, Object> map);//입사일 일별로 기준
	// 급여 개인회원수당 정보 가져오기
	public int J_extrapayinfoCnt(String id);
	public ArrayList<BonusCutVO> J_extrapayinfo(String id);
	// 급여 개인회원수당 정보 가져오기
	public int J_extrapayinfoCnt2_1(Map<String, Object> map);
	public int J_extrapayinfoCnt2_2(Map<String, Object> map);
	public int J_extrapayinfoCnt2_3(Map<String, Object> map);
	public ArrayList<BonusCutVO> J_extrapayinfo2_1(Map<String, Object> map);
	public ArrayList<BonusCutVO> J_extrapayinfo2_2(Map<String, Object> map);
	public ArrayList<BonusCutVO> J_extrapayinfo2_3(Map<String, Object> map);
	// 개인 급여수당정보 업데이트
	public int J_extrapayinfoUpdate(Map<String, Object> map);
	// 수당 개인 급여수당정보 수정
	public ArrayList<BonusCutVO> J_ExtrapayInfoModified(int num);
	// 수당 개인 급여수당정보 수정
	public int J_ExtrapayInfoModifiedComplete(Map<String, Object> map);
	// 개인 num에대한 id 값 가져오기
	public BonusCutVO numId(int num);
	// 개인 급여수당정보 삭제하기
	public int deleteInfo(int num);
	
	//-----------------------상여급여 조회------------------------------------
	// 상여 조회(아이디 검색 정보 가져오기)
	public int searchIdCnt(Map<String, Object> map);
	public ArrayList<join_mgcVO> searchIdList(Map<String, Object> map);
	public ArrayList<join_mgcVO> searchIdList2(Map<String, Object> map);
}
