package com.spring.gm.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.Join_payVO;


@Repository
public class O_DAOImpl implements O_DAO {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	O_DAO dao;
	
	//전자결재 - 기안문 생성
	@Override
	public Join_payVO createAppDocForm(String id) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.createAppDocForm(id);
	}

	@Override
	public Join_payVO createAppDocForm2(String id) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.createAppDocForm2(id);
	}
	
	

}
