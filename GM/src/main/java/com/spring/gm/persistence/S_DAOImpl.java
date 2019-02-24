package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.MessageBoxVO;
import com.spring.gm.vo.MessageVO;

@Repository
public class S_DAOImpl implements S_DAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getMessageArticleCnt(String receiver) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getMessageArticleCnt(receiver);
	}
	
	@Override
	public List<MessageVO> getMessageArticleList(Map<String, Object> map){
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getMessageArticleList(map);
	}
	
	@Override
	public int readCnt() {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.readCnt();
	}
	
	@Override
	public int getMessageBoxArticleCnt(String strId) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getMessageBoxArticleCnt(strId);
	}

	@Override
	public List<MessageBoxVO> getMessageBoxArticleList(Map<String, Object> map) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getMessageBoxArticleList(map);
	}

	@Override
	public int sendMessage(MessageVO vo) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.sendMessage(vo);
	}



}
