package com.spring.gm.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.BonusCutVO;
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
	// 급여 개인회원수당 정보 가져오기
	@Override
	public ArrayList<BonusCutVO> J_extrapayinfo(String id) {
		ArrayList<BonusCutVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.J_extrapayinfo(id);
		return dtos;
	}
}
