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
	public int getMailArticleCnt(String strId) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getMailArticleCnt(strId);
	}
	
	@Override
	public List<MassageVO> getMailArticleList(Map<String, Object> map){
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getMailArticleList(map);
	}
	
	@Override
	public int getMailBoxArticleCnt(String strId) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getMailBoxArticleCnt(strId);
	}

	@Override
	public List<MassageBoxVO> getMailBoxArticleList(Map<String, Object> map) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getMailBoxArticleList(map);
	}

}
