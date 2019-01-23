package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.BoardsVO;

@Repository
public class D_DAOImpl implements D_DAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	// 게시판 생성문
	public int insertBoards(BoardsVO vo) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.insertBoards(vo);
	}

	@Override
	public int getArticleCnt() {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.getArticleCnt();
	}

	@Override
	public List<BoardsVO> getArticleList(Map<String, Object> map) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.getArticleList(map);
	}
	
	

	
}
