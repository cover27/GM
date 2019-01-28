package com.spring.gm.persistence;


import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.MemberVO;

import com.spring.gm.persistence.J_DAO;

@Repository
public class J_DAOImpl implements J_DAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int selectCnt() {
		int selectCnt = sqlSession.selectOne("com.spring.gm.persistence.J_DAO.selectCnt");
		return selectCnt;
	}

	@Override
	public ArrayList<MemberVO> selectList(Map<String, Object> map) {
		ArrayList<MemberVO> dtos = null;
		J_DAO dao = sqlSession.getMapper(J_DAO.class);
		dtos = dao.selectList(map);
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
}
