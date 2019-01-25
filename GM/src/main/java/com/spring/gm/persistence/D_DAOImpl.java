package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.BoardListVO;
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
	// 게시판 갯수
	public int getBoardsArticleCnt() {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.getBoardsArticleCnt();
	}

	@Override
	// 게시판 목록
	public List<BoardsVO> getBoardsArticleList(Map<String, Object> map) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.getBoardsArticleList(map);
	}

	@Override
	// 게시글 갯수
	public int getBoardArticleCnt() {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.getBoardArticleCnt();
	}

	@Override
	// 게시글 목록
	public List<BoardListVO> getBoardArticleList(Map<String, Object> map) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.getBoardArticleList(map);
	}

	@Override
	public int updateBoards(BoardsVO vo) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.updateBoards(vo);
	}

	@Override
	public int deleteBoards(BoardsVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

	
}
