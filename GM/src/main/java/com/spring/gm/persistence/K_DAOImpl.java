package com.spring.gm.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.MemberVO;

@Repository
public class K_DAOImpl implements K_DAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public MemberVO memberInfo(String id) {
		return sqlSession.selectOne("com.spring.gm.persistence.K_DAO.memberInfo", id);
	}

	
	
}
