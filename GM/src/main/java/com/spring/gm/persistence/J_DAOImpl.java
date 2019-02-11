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
import com.spring.gm.vo.join_mgcVO;
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
	public ArrayList<join_mgcVO> selectList2(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.selectList2(map);
		return dtos;
	}
	//급여 회원정보 가져오기(부서번호가 부서명)
	@Override
	public ArrayList<join_mgcVO> selectList3(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
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
	public ArrayList<join_mgcVO> searchinfoList(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = new ArrayList<join_mgcVO>();
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		String search_title = (String) map.get("search_title");

		if (search_title.equals("name")) {	//이름 검색
			// 5-2. 게시글 목록 조회
			List<join_mgcVO> dtos1 = dao.searchinfoList(map);	// depart가 회사번호
			System.out.println("여기 탔다2");
			System.out.println(dtos1.toString());
			List<join_mgcVO> dtos3 = dao.searchinfoList3(map);	//depart가 부서번호
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
			List<join_mgcVO> dtos4 = dao.searchinfoList4(map);	// depart가 회사번호
			System.out.println("여기 탔다2");
			System.out.println(dtos4.toString());
			List<join_mgcVO> dtos5 = dao.searchinfoList5(map);	//depart가 부서번호
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
	public ArrayList<join_mgcVO> searchinfoList2(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.searchinfoList2(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO> searchinfoList3(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.searchinfoList3(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO> searchinfoList4(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.searchinfoList4(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO> searchinfoList5(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.searchinfoList5(map);
		return dtos;
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
	public ArrayList<join_mgcVO> salarySearchList1_1(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salarySearchList1_1(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO> salarySearchList1_2(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salarySearchList1_2(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO> salarySearchList2_1(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salarySearchList2_1(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO> salarySearchList2_2(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salarySearchList2_2(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO> salarySearchList3_1(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salarySearchList3_1(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO> salarySearchList3_2(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salarySearchList3_2(map);
		return dtos;
	}
	
	
	
	
	// 수당  검색 회원목록  가져오기(id 검색)
	@Override
	public ArrayList<join_mgcVO> salaryIdSearchList1_1(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salaryIdSearchList1_1(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO> salaryIdSearchList1_2(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salaryIdSearchList1_2(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO> salaryIdSearchList2_1(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salaryIdSearchList2_1(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO> salaryIdSearchList2_2(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salaryIdSearchList2_2(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO> salaryIdSearchList3_1(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salaryIdSearchList3_1(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO> salaryIdSearchList3_2(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salaryIdSearchList3_2(map);
		return dtos;
	}
	// 수당  검색 회원목록  가져오기(depart 검색)
	@Override
	public ArrayList<join_mgcVO> salaryDepartSearchList1(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salaryDepartSearchList1(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO> salaryDepartSearchList2(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.salaryDepartSearchList2(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO> salaryDepartSearchList3(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
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
	public ArrayList<join_mgcVO> selectNoneDepartList(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.selectNoneDepartList(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO> selectNoneIdList(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.selectNoneIdList(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO> selectNoneIdList2(Map<String, Object> map) {
		ArrayList<join_mgcVO> dtos = null;
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
}
