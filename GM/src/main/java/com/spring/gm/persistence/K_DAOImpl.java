package com.spring.gm.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.CompaniesVO;
import com.spring.gm.vo.MemberVO;

@Repository
public class K_DAOImpl implements K_DAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public MemberVO memberInfo(String id) {
		return sqlSession.selectOne("com.spring.gm.persistence.K_DAO.memberInfo", id);
	}
	
	@Override
	public List<CompaniesVO> findCompany() {
		return sqlSession.selectList("com.spring.gm.persistence.K_DAO.findCompany");
	}
	
	@Override
	public List<CompaniesVO> searchCompany(String keyword) {
		return sqlSession.selectList("com.spring.gm.persistence.K_DAO.searchCompany", keyword);
	}

	@Override
	public int registAccount(MemberVO vo) {
		return sqlSession.insert("com.spring.gm.persistence.K_DAO.registAccount", vo);
	}
	
}
