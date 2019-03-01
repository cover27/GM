package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.GroupsVO;
import com.spring.gm.vo.MemberVO;

@Repository
public class E_DAOImpl implements E_DAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getCompanyMemberCnt(int company) {
		E_DAO dao = sqlSession.getMapper(E_DAO.class);
		return dao.getCompanyMemberCnt(company);
	}

	@Override
	public List<MemberVO> getCompanyMemberList(Map<String, Object> map) {
		E_DAO dao = sqlSession.getMapper(E_DAO.class);
		return dao.getCompanyMemberList(map);
	}
	
	@Override
	public int getCompanyCnt(int company) {
		E_DAO dao = sqlSession.getMapper(E_DAO.class);
		return dao.getCompanyCnt(company);
	}

	@Override
	public List<GroupsVO> getCompanyList(Map<String, Object> map) {
		E_DAO dao = sqlSession.getMapper(E_DAO.class);
		return dao.getCompanyList(map);
	}

}
