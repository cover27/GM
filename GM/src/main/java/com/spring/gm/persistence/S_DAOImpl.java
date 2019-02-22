package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.MassageBoxVO;
import com.spring.gm.vo.MassageVO;

@Repository
public class S_DAOImpl implements S_DAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getMessageArticleCnt(String strId) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getMessageArticleCnt(strId);
	}
	
	@Override
	public List<MassageVO> getMessageArticleList(Map<String, Object> map){
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getMessageArticleList(map);
	}
	
	@Override
	public int getMessageBoxArticleCnt(String strId) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getMessageBoxArticleCnt(strId);
	}

	@Override
	public List<MassageBoxVO> getMessageBoxArticleList(Map<String, Object> map) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getMessageBoxArticleList(map);
	}

}
