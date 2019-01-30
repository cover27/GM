package com.spring.gm.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		}
		return selectCnt;
	}

	@Override
	public ArrayList<MemberVO> searchinfoList(Map<String, Object> map) {
		ArrayList<MemberVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		String search_title = (String) map.get("search_title");

		if (search_title.equals("name")) {
			System.out.println("name 탔다");
			dtos = dao.searchinfoList(map);
			System.out.println("name 탔다");
			return dtos;
		} else if (search_title.equals("depart")) {
			System.out.println("depart 탔다");
			dtos = dao.searchinfoList2(map);
			System.out.println("depart 탔다");
			return dtos;
		}
		return dtos;
	}

	@Override
	public ArrayList<MemberVO> searchinfoList2(Map<String, Object> map) {
		ArrayList<MemberVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.searchinfoList2(map);
		return dtos;
	}
}
