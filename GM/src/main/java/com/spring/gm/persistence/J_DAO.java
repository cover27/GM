package com.spring.gm.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.gm.vo.BonusCutVO;
import com.spring.gm.vo.CompaniesVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.SalaryVO;
import com.spring.gm.vo.join_mgcVO2;
import com.spring.gm.vo.join_mgsbVO;
import com.spring.gm.vo.join_mgsbcVO;
import com.spring.gm.vo.join_mgcVO2;
import com.spring.gm.vo.join_msVO;
public interface J_DAO {
	//급여 회원정보 확인
	public int selectCnt(int company);
	//급여 회원정보 가져오기(부서번호가 회사명)
	public ArrayList<join_mgcVO2> selectList2(Map<String, Object> map);
	//급여 회원정보 가져오기(부서번호가 부서명)
	public ArrayList<join_mgcVO2> selectList3(Map<String, Object> map);
	//급여 개인회원정보 가져오기
	public ArrayList<MemberVO> infoList(String id);
	// 회원 급여 개인정보 업데이트
	public int infoUpdate(Map<String, Object> map);
	
	
	//검색 급여 회원정보 가져오기
	public int search_salaryCnt(Map<String, Object> map);
	public ArrayList<join_mgcVO2> searchinfoList(Map<String, Object> map);
	public ArrayList<join_mgcVO2> searchinfoList3(Map<String, Object> map);
	public ArrayList<join_mgcVO2> searchinfoList2(Map<String, Object> map);
	public ArrayList<join_mgcVO2> searchinfoList4(Map<String, Object> map);
	public ArrayList<join_mgcVO2> searchinfoList5(Map<String, Object> map);
	
	// 개인 급여등록(이번달 목록 가져오기)
	public int J_PayrollRegistrationCnt(Map<String, Object> map);
	public ArrayList<join_msVO> J_PayrollRegistrationList(Map<String, Object> map);
	public ArrayList<MemberVO> J_PayrollRegistrationInsertList(Map<String, Object> map);
	public ArrayList<join_mgsbVO> J_PayrollRegistrationInsertList2(Map<String, Object> map);
	// 개인 급여등록
	public int J_PayrollRegistrationInsert(Map<String, Object> map);
	//미지급 지급으로 처리
	public int J_PayrollRegistrationchange(Map<String, Object> map);
	//급여등록에서 미지급 지급으로 처리할 시 추가 및 삭감 정보 미지급-> 지급으로 처리
	public int ChangePayments(Map<String, Object> map);
	//급여등록에서 미지급 지급으로 처리할 시 추가 및 삭감 정보  지급 -> 미지급으로 처리
	public int ChangeUnpaid(Map<String, Object> map);
	
	//정보 삭제
	public int J_PayrollRegistrationListDelete(Map<String, Object> map);
	//삭제시 급여 금액 수정하기
	public int modifySalary(Map<String, Object> map); //빼기
	public int modifySalary2(Map<String, Object> map);	//더하기
	
	//전월 추가 및 삭감 총 금액
	public int bonussalaryCnt(Map<String, Object> map);
	public ArrayList<join_mgsbVO> bonussalary(Map<String, Object> map);

	
	
	
	//급여 조회&수당(cnt)
	public int mgstblCnt(Map<String, Object> map);
	public int mgstblCnt2(Map<String, Object> map);
	//급여 조회&수당(List)
	//급여 부서명 가져오는  셀리리조인 
	public ArrayList<join_mgsbVO> mgstbl(Map<String, Object> map);
	//급여 회사명 가져오는  셀리리조인
	public ArrayList<join_mgsbVO> mgstbl2(Map<String, Object> map);
	/*public ArrayList<join_mgsbVO> mgstbl3(Map<String, Object> map);
	public ArrayList<join_mgsbVO> mgstbl4(Map<String, Object> map);*/
	//Bonus_cut 정보 가져오기
	public ArrayList<join_mgsbVO> bonustbl(Map<String, Object> map);
	public ArrayList<join_mgsbVO> bonustbl2(Map<String, Object> map);
	public ArrayList<join_mgsbVO> bonustbl3(Map<String, Object> map);
	public ArrayList<join_mgsbVO> bonustbl4(Map<String, Object> map);
	
	//------------- 기본수당 외 수당관리-------------------------------------------
	// 회사명 가져오기
	public ArrayList<CompaniesVO> companyName(int company);
	// 날짜만 입력하여 검색시
	public int selectCnt(Map<String, Object> map);
	public ArrayList<join_mgcVO2> salarySearchList1_1(Map<String, Object> map);//입사일 년도로 기준
	public ArrayList<join_mgcVO2> salarySearchList1_2(Map<String, Object> map);//입사일 년도로 기준
	public ArrayList<join_mgcVO2> salarySearchList2_1(Map<String, Object> map);//입사일 월로 기준
	public ArrayList<join_mgcVO2> salarySearchList2_2(Map<String, Object> map);//입사일 월로 기준
	public ArrayList<join_mgcVO2> salarySearchList3_1(Map<String, Object> map);//입사일 일별로 기준
	public ArrayList<join_mgcVO2> salarySearchList3_2(Map<String, Object> map);//입사일 일별로 기준
	// 수당 검색 회원목록 갯수 가져오기(부서 날짜검색 안했을시)
	public int selectNoneDepartCnt(Map<String, Object> map);
	public ArrayList<join_mgcVO2> selectNoneDepartList(Map<String, Object> map);
	// 수당 검색 회원목록 갯수 가져오기(아이디 날짜검색 안했을시)
	public int selectNoneIdCnt(Map<String, Object> map);
	public ArrayList<join_mgcVO2> selectNoneIdList(Map<String, Object> map);
	public ArrayList<join_mgcVO2> selectNoneIdList2(Map<String, Object> map);
	// 수당  검색 회원목록  가져오기(id검색시)
	public ArrayList<join_mgcVO2> salaryIdSearchList1_1(Map<String, Object> map);//입사일 년도로 기준
	public ArrayList<join_mgcVO2> salaryIdSearchList1_2(Map<String, Object> map);//입사일 년도로 기준
	public ArrayList<join_mgcVO2> salaryIdSearchList2_1(Map<String, Object> map);//입사일 월로 기준
	public ArrayList<join_mgcVO2> salaryIdSearchList2_2(Map<String, Object> map);//입사일 월로 기준
	public ArrayList<join_mgcVO2> salaryIdSearchList3_1(Map<String, Object> map);//입사일 일별로 기준
	public ArrayList<join_mgcVO2> salaryIdSearchList3_2(Map<String, Object> map);//입사일 일별로 기준
	
	// 수당  검색 회원목록  가져오기(depart검색시)
	public ArrayList<join_mgcVO2> salaryDepartSearchList1(Map<String, Object> map);//입사일 년도로 기준
	public ArrayList<join_mgcVO2> salaryDepartSearchList2(Map<String, Object> map);//입사일 월로 기준
	public ArrayList<join_mgcVO2> salaryDepartSearchList3(Map<String, Object> map);//입사일 일별로 기준
	// 급여 개인회원수당 정보 가져오기
	public int J_extrapayinfoCnt(String id);
	public ArrayList<BonusCutVO> J_extrapayinfo(String id);
	public ArrayList<BonusCutVO> J_extrapayinfo2(Map<String, Object> map);
	// 급여 개인회원수당 정보 가져오기
	public int J_extrapayinfoCnt2_1(Map<String, Object> map);
	public int J_extrapayinfoCnt2_2(Map<String, Object> map);
	public int J_extrapayinfoCnt2_3(Map<String, Object> map);
	public ArrayList<BonusCutVO> J_extrapayinfo2_1(Map<String, Object> map);
	public ArrayList<BonusCutVO> J_extrapayinfo2_2(Map<String, Object> map);
	public ArrayList<BonusCutVO> J_extrapayinfo2_3(Map<String, Object> map);
	// 개인 급여수당정보 업데이트
	public int J_extrapayinfoUpdate(Map<String, Object> map);
	// 급여 등록시 수당 없으면 0원으로 처리
	public int insertProcess(String id);
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
	public ArrayList<join_mgcVO2> searchIdList(Map<String, Object> map);
	public ArrayList<join_mgcVO2> searchIdList2(Map<String, Object> map);
	
	
	//-----------------------------급여 계산-------------------------------------------
	//급여 계산 목록 가져오기
	//검색 날짜가 없을경우 오늘 날짜년도로 뽑음
	public int J_SalaryCalculationSearchCnt(Map<String, Object> map);
	public ArrayList<join_mgsbVO> J_SalaryCalculationSearchList(Map<String, Object> map);
	// 검색 날짜가 있을 경우
	public int J_SalaryCalculationSearchCnt2(Map<String, Object> map);
	public ArrayList<join_mgsbVO> J_SalaryCalculationSearchList2(Map<String, Object> map);
	
	
	//-----------------------상여 조회------------------------------------
	public ArrayList<join_mgsbVO> bonusList(Map<String, Object> map);
	public ArrayList<join_mgsbVO> bonusList2(Map<String, Object> map);
	
	//상여 미지급 목록
	public int bonusNoneCnt(Map<String, Object> map);
	public int bonusNoneCnt2(Map<String, Object> map);
	public ArrayList<join_mgsbVO> bonusNoneList(Map<String, Object> map);
	public ArrayList<join_mgsbVO> bonusNoneList2(Map<String, Object> map);
	
	
	//------------------급여 대장-----------------------------
		//아이디 검색 이번년도 급여대장정보 가져오기 아이디 검색.
	public int IdSearchCnt(Map<String, Object> map);
	public ArrayList<join_mgsbcVO> IdSearchList(Map<String, Object> map);
	public ArrayList<join_mgsbcVO> IdSearchList2(Map<String, Object> map);
	
	public int searchCnt2(Map<String, Object> map);
	public ArrayList<join_mgsbcVO> searchList(Map<String, Object> map);
}
