package com.spring.gm.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.BonusCutVO;
import com.spring.gm.vo.CompaniesVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.SalaryVO;
import com.spring.gm.vo.join_mgcVO2;
import com.spring.gm.vo.join_mgsbVO;
import com.spring.gm.vo.join_msVO;
import com.spring.gm.persistence.J_DAO;

@Repository
public class J_DAOImpl implements J_DAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int selectCnt(int company) {
		int selectCnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.selectCnt", company);
		return selectCnt;
	}
	//급여 회원정보 가져오기(부서번호가 회사명)
	@Override
	public ArrayList<join_mgcVO2> selectList2(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.selectList2(map);
		return dtos;
	}
	//급여 회원정보 가져오기(부서번호가 부서명)
	@Override
	public ArrayList<join_mgcVO2> selectList3(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.selectList3(map);
		return dtos;
	}

	@Override
	public ArrayList<MemberVO> infoList(String id) {
		ArrayList<MemberVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.infoList(id);
		return dtos;
	}

	// 회원 급여 개인정보 업데이트
	@Override
	public int infoUpdate(Map<String, Object> map) {
		int updateCnt = sqlSession.update("com.spring.gm.persistence.J_DAO.infoUpdate", map);
		return updateCnt;
	}

	// 검색 급여 회원정보 가져오기
	@Override
	public int search_salaryCnt(Map<String, Object> map) {
		String search_title = (String) map.get("search_title");
		int selectCnt = 0;
		if (search_title.equals("name")) {
			System.out.println("name 탔다");
			selectCnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.search_salaryCnt", map);
			if (selectCnt != 0) {
				selectCnt = 1;
				System.out.println("name 탔다");
				return selectCnt;
			}
		} else if (search_title.equals("depart")) {
			System.out.println("depart 탔다");
			selectCnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.search_salaryCnt2", map);
			if (selectCnt != 0) {
				selectCnt = 1;
				System.out.println("depart 탔다");
				return selectCnt;
			}
		} else if (search_title.equals("id")) {
			System.out.println("id 탔다");
			selectCnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.search_salaryCnt3", map);
			if (selectCnt != 0) {
				selectCnt = 1;
				System.out.println("id 탔다");
				return selectCnt;
			}
		}
		return selectCnt;
	}

	@Override
	public ArrayList<join_mgcVO2> searchinfoList(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = new ArrayList<join_mgcVO2>();
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		String search_title = (String) map.get("search_title");

		if (search_title.equals("name")) {	//이름 검색
			// 5-2. 게시글 목록 조회
			List<join_mgcVO2> dtos1 = dao.searchinfoList(map);	// depart가 회사번호
			System.out.println("여기 탔다2");
			System.out.println(dtos1.toString());
			List<join_mgcVO2> dtos3 = dao.searchinfoList3(map);	//depart가 부서번호
			System.out.println("여기 탔다3");
			System.out.println(dtos3.toString());
			dtos.addAll(dtos1);
			dtos.addAll(dtos3);
			System.out.println(dtos.toString());
			return dtos;
		} else if (search_title.equals("depart")) {	//부서 검색
			System.out.println("depart 탔다");
			dtos = dao.searchinfoList2(map);
			System.out.println("depart 탔다");
			return dtos;
		} else if (search_title.equals("id")) {	// 사원아이디 검색
			List<join_mgcVO2> dtos4 = dao.searchinfoList4(map);	// depart가 회사번호
			System.out.println("여기 탔다2");
			System.out.println(dtos4.toString());
			List<join_mgcVO2> dtos5 = dao.searchinfoList5(map);	//depart가 부서번호
			System.out.println("여기 탔다3");
			System.out.println(dtos5.toString());
			dtos.addAll(dtos4);
			dtos.addAll(dtos5);
			System.out.println(dtos.toString());
			return dtos;
		}
		return dtos;
	}

	@Override
	public ArrayList<join_mgcVO2> searchinfoList2(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.searchinfoList2(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> searchinfoList3(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.searchinfoList3(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> searchinfoList4(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.searchinfoList4(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> searchinfoList5(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.searchinfoList5(map);
		return dtos;
	}
	
	// 개인 급여등록(이번달 목록 가져오기)
	@Override
	public int J_PayrollRegistrationCnt(Map<String, Object> map) {
		int cnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.J_PayrollRegistrationCnt", map);
		return cnt;
	}
	@Override
	public ArrayList<join_msVO> J_PayrollRegistrationList(Map<String, Object> map) {
		System.out.println("J_PayrollRegistrationList여기탔어용");
		ArrayList<join_msVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.J_PayrollRegistrationList(map);
		return dtos;
	}
	//개인 급여등록(이번달 목록 가져오기) 없으면 인설트할 목록 가져오기
	@Override
	public ArrayList<MemberVO> J_PayrollRegistrationInsertList(Map<String, Object> map) {
		ArrayList<MemberVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.J_PayrollRegistrationInsertList(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgsbVO> J_PayrollRegistrationInsertList2(Map<String, Object> map) {
		ArrayList<join_mgsbVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.J_PayrollRegistrationInsertList2(map);
		return dtos;
	}
	// 개인 급여등록
	@Override
	public int J_PayrollRegistrationInsert(Map<String, Object> map) {
		int cnt = sqlSession.insert("com.spring.gm.persistence.J_DAO.J_PayrollRegistrationInsert", map);
		return cnt;
	}
	//미지급 지급으로 처리
	public int J_PayrollRegistrationchange(Map<String, Object> map) {
		int cnt = sqlSession.update("com.spring.gm.persistence.J_DAO.J_PayrollRegistrationchange", map);
		return cnt;
	}
	//급여등록에서 미지급 지급으로 처리할 시 추가 및 삭감 정보 미지급-> 지급으로 처리
	public int ChangePayments(Map<String, Object> map) {
		int cnt = sqlSession.update("com.spring.gm.persistence.J_DAO.ChangePayments", map);
		return cnt;
	}
	//급여등록에서 미지급 지급으로 처리할 시 추가 및 삭감 정보  지급 -> 미지급으로 처리
	public int ChangeUnpaid(Map<String, Object> map) {
		int cnt = sqlSession.update("com.spring.gm.persistence.J_DAO.ChangeUnpaid", map);
		return cnt;
	}
		
	//정보 삭제
	@Override
	public int J_PayrollRegistrationListDelete(Map<String, Object> map) {
		int cnt = sqlSession.delete("com.spring.gm.persistence.J_DAO.J_PayrollRegistrationListDelete", map);
		return cnt;
	}
	
	
	
	
	
	
	//------------- 기본수당 외 수당관리-------------------------------------------
	// 회사명 가져오기
	@Override
	public ArrayList<CompaniesVO> companyName(int company) {
		ArrayList<CompaniesVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.companyName(company);
		return dtos;
	}
	
	
	// 날짜만 입력하여 검색시
	@Override
	public int selectCnt(Map<String, Object> map) {
		int cnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.selectCnt", map);
		return cnt;
	}
	@Override
	public ArrayList<join_mgcVO2> salarySearchList1_1(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salarySearchList1_1(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> salarySearchList1_2(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salarySearchList1_2(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> salarySearchList2_1(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salarySearchList2_1(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> salarySearchList2_2(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salarySearchList2_2(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> salarySearchList3_1(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salarySearchList3_1(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> salarySearchList3_2(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salarySearchList3_2(map);
		return dtos;
	}
	
	
	
	
	// 수당  검색 회원목록  가져오기(id 검색)
	@Override
	public ArrayList<join_mgcVO2> salaryIdSearchList1_1(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salaryIdSearchList1_1(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> salaryIdSearchList1_2(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salaryIdSearchList1_2(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> salaryIdSearchList2_1(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salaryIdSearchList2_1(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> salaryIdSearchList2_2(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salaryIdSearchList2_2(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> salaryIdSearchList3_1(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salaryIdSearchList3_1(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> salaryIdSearchList3_2(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salaryIdSearchList3_2(map);
		return dtos;
	}
	// 수당  검색 회원목록  가져오기(depart 검색)
	@Override
	public ArrayList<join_mgcVO2> salaryDepartSearchList1(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salaryDepartSearchList1(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> salaryDepartSearchList2(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salaryDepartSearchList2(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> salaryDepartSearchList3(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salaryDepartSearchList3(map);
		return dtos;
	}
	// 급여 개인회원수당 정보 있는지확인
	@Override
	public int J_extrapayinfoCnt(String id) {
		int cnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.J_extrapayinfoCnt", id);
		return cnt;
	}
	// 급여 개인회원수당 정보 가져오기
	@Override
	public ArrayList<BonusCutVO> J_extrapayinfo(String id) {
		ArrayList<BonusCutVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.J_extrapayinfo(id);
		return dtos;
	}
	@Override
	public ArrayList<BonusCutVO> J_extrapayinfo2(Map<String, Object> map) {
		ArrayList<BonusCutVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.J_extrapayinfo2(map);
		return dtos;
	}
	
	
	
	
	
	// 급여 개인회원수당 정보 있는지확인
	@Override
	public int J_extrapayinfoCnt2_1(Map<String, Object> map) {
		int cnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.J_extrapayinfoCnt2_1", map);
		return cnt;
	}
	@Override
	public int J_extrapayinfoCnt2_2(Map<String, Object> map) {
		int cnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.J_extrapayinfoCnt2_2", map);
		return cnt;
	}
	@Override
	public int J_extrapayinfoCnt2_3(Map<String, Object> map) {
		int cnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.J_extrapayinfoCnt2_3", map);
		return cnt;
	}
	@Override
	public ArrayList<BonusCutVO> J_extrapayinfo2_1(Map<String, Object> map) {
		ArrayList<BonusCutVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.J_extrapayinfo2_1(map);
		return dtos;
	}
	@Override
	public ArrayList<BonusCutVO> J_extrapayinfo2_2(Map<String, Object> map) {
		ArrayList<BonusCutVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.J_extrapayinfo2_2(map);
		return dtos;
	}
	@Override
	public ArrayList<BonusCutVO> J_extrapayinfo2_3(Map<String, Object> map) {
		ArrayList<BonusCutVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.J_extrapayinfo2_3(map);
		return dtos;
	}
	
	
	// 개인 급여수당정보 업데이트
	@Override
	public int J_extrapayinfoUpdate(Map<String, Object> map) {
		int cnt = sqlSession.update("com.spring.gm.persistence.J_DAO.J_extrapayinfoUpdate", map);
		return cnt;
	}
	// 개인 급여수당정보 삭제하기
	@Override
	public int deleteInfo(int num) {
		int cnt = sqlSession.delete("com.spring.gm.persistence.J_DAO.deleteInfo", num);
		return cnt;
	}
	//삭제시 급여 금액 수정하기
	@Override
	public int modifySalary(Map<String, Object> map) {
		int cnt = sqlSession.delete("com.spring.gm.persistence.J_DAO.modifySalary", map);
		return cnt;
	}
	@Override
	public int modifySalary2(Map<String, Object> map) {
		int cnt = sqlSession.delete("com.spring.gm.persistence.J_DAO.modifySalary2", map);
		return cnt;
	}
	
	
	
	
	
	
	// 개인 num에대한 id 값 가져오기
	@Override
	public BonusCutVO numId(int num) {
		BonusCutVO vo = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.numId", num);
		return vo;
	}
	@Override
	public int selectNoneDepartCnt(Map<String, Object> map) {
		int cnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.selectNoneDepartCnt", map);
		return cnt;
	}
	@Override
	public int selectNoneIdCnt(Map<String, Object> map) {
		int cnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.selectNoneIdCnt", map);
		return cnt;
	}
	@Override
	public ArrayList<join_mgcVO2> selectNoneDepartList(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.selectNoneDepartList(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> selectNoneIdList(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.selectNoneIdList(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> selectNoneIdList2(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.selectNoneIdList2(map);
		return dtos;
	}
	// 수당 개인 급여수당정보 수정
	@Override
	public ArrayList<BonusCutVO> J_ExtrapayInfoModified(int num) {
		ArrayList<BonusCutVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.J_ExtrapayInfoModified(num);
		return dtos;
	}
	// 수당 개인 급여수당정보 수정완료
	@Override
	public int J_ExtrapayInfoModifiedComplete(Map<String, Object> map) {
		int cnt = sqlSession.update("com.spring.gm.persistence.J_DAO.J_ExtrapayInfoModifiedComplete", map);
		return cnt;
	}
	
	//-----------------------상여급여 조회------------------------------------
	// 상여 조회(아이디 검색 정보 가져오기)
	@Override
	public int searchIdCnt(Map<String, Object> map) {
		int cnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.searchIdCnt", map);
		return cnt;
	}
	@Override
	public ArrayList<join_mgcVO2> searchIdList(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.searchIdList(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> searchIdList2(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.searchIdList2(map);
		return dtos;
	}
	@Override
	public int mgstblCnt(Map<String, Object> map) {
		int cnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.mgstblCnt", map);
		return cnt;
	}
	@Override
	public int mgstblCnt2(Map<String, Object> map) {
		int cnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.mgstblCnt2", map);
		return cnt;
	}
	
	//-----------------------급여 조회------------------------------------
	//급여 부서명 가져오는  셀리리조인 
	@Override
	public ArrayList<join_mgsbVO> mgstbl(Map<String, Object> map) {
		ArrayList<join_mgsbVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.mgstbl(map);
		return dtos;
	}
	//급여 회사명 가져오는  셀리리조인
	@Override
	public ArrayList<join_mgsbVO> mgstbl2(Map<String, Object> map) {
		ArrayList<join_mgsbVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.mgstbl2(map);
		return dtos;
	}
	//Bonus_cut 정보 가져오기
	@Override
	public ArrayList<join_mgsbVO> bonustbl(Map<String, Object> map) {
		ArrayList<join_mgsbVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.bonustbl(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgsbVO> bonustbl2(Map<String, Object> map) {
		ArrayList<join_mgsbVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.bonustbl2(map);
		return dtos;
	}
/*	@Override
	public ArrayList<join_mgsbVO> mgstbl3(Map<String, Object> map) {
		ArrayList<join_mgsbVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.mgstbl3(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgsbVO> mgstbl4(Map<String, Object> map) {
		ArrayList<join_mgsbVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.mgstbl4(map);
		return dtos;
	}*/
	
	
	
	
	
	
	
	
	
	
	
	//-----------------------------급여 계산-------------------------------------------
	//급여 계산 목록 가져오기
	@Override
	public int J_SalaryCalculationSearchCnt(Map<String, Object> map) {
		int cnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.J_SalaryCalculationSearchCnt", map);
		return cnt;
	}
	
	@Override
	public ArrayList<join_mgsbVO> J_SalaryCalculationSearchList(Map<String, Object> map) {
		ArrayList<join_mgsbVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.J_SalaryCalculationSearchList(map);
		return dtos;
	}
	// 검색 날짜가 있을 경우
	@Override
	public int J_SalaryCalculationSearchCnt2(Map<String, Object> map) {
		int cnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.J_SalaryCalculationSearchCnt2", map);
		return cnt;
	}
	@Override
	public ArrayList<join_mgsbVO> J_SalaryCalculationSearchList2(Map<String, Object> map) {
		ArrayList<join_mgsbVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.J_SalaryCalculationSearchList2(map);
		return dtos;
	}
	
	//-----------------------상여 조회------------------------------------
	@Override
	public ArrayList<join_mgsbVO> bonusList(Map<String, Object> map) {
		ArrayList<join_mgsbVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.bonusList(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgsbVO> bonusList2(Map<String, Object> map) {
		ArrayList<join_mgsbVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.bonusList2(map);
		return dtos;
	}
	
	
	//상여 미지급 목록
	@Override
	public int bonusNoneCnt(Map<String, Object> map) {
		int cnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.bonusNoneCnt", map);
		return cnt;
	}
	@Override
	public ArrayList<join_mgsbVO> bonusNoneList(Map<String, Object> map) {
		ArrayList<join_mgsbVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.bonusNoneList(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgsbVO> bonusNoneList2(Map<String, Object> map) {
		ArrayList<join_mgsbVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.bonusNoneList2(map);
		return dtos;
	}
	
	
	
	
	//----------------------------기타-----------------------------------
	//전월 추가 및 삭감 총 금액
	public int bonussalaryCnt(Map<String, Object> map) {
		int cnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.bonussalaryCnt", map);
		return cnt;
	}
	@Override
	public ArrayList<join_mgsbVO> bonussalary(Map<String, Object> map) {
		ArrayList<join_mgsbVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.bonussalary(map);
		return dtos;
	}
	
}
