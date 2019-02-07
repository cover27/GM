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
	public int updateBoard(BoardListVO vo) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.updateBoard(vo);
	}
	
	// 답글확인
	@Override
	public int checkReply(BoardListVO vo) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		int cnt = dao.checkReply(vo);
		return cnt;
	}
	
	// 게시글 삭제
	@Override
	public int deleteBoard(int boardnum) {
		int deleteCnt = 0;
		
		BoardListVO vo = getArticle(boardnum);

		
		if(vo.getBoardnum() != 0) {
			int replyCnt = checkReply(vo);
			System.out.println("답글을 가지고 있는가? : "+replyCnt);
			
			if(replyCnt != 0) {
				deleteCnt = deleteAll(vo);
				System.out.println("deleteCnt ::: "+deleteCnt);
				
				if(deleteCnt > 0) {
					updateStep(vo);
				}
			}else {
				D_DAO dao = sqlSession.getMapper(D_DAO.class);
				deleteCnt = dao.deleteBoard(boardnum);
				System.out.println("값2"+deleteCnt);
			}
		}
		System.out.println("값3"+deleteCnt);
		return deleteCnt;
	}
	
	// 게시글 작성
	@Override
	public int insertBoard(BoardListVO vo) {
		int boardnum = vo.getBoardnum();
		int ref = vo.getRef();
		int ref_step = vo.getRef_step();
		int ref_level = vo.getRef_level();
		
		if(boardnum == 0) {
			int cnt = getBoardArticleCnt();
			
			if(cnt > 0) {
				ref = getMaxNum() + 1;
			}else {
				ref=1;
			}
			ref_step=0;
			ref_level=0;
			
		}else {
			updateReply(vo);			
			ref_step++;
			ref_level++;			
		}
		vo.setRef(ref);
		vo.setRef_step(ref_step);
		vo.setRef_level(ref_level);
		
			D_DAO dao = sqlSession.getMapper(D_DAO.class);
			return dao.insertBoard(vo);			
	}
	
	// 게시글 리스트
	@Override
	public BoardListVO getArticle(int boardnum) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		BoardListVO vo = dao.getArticle(boardnum);
		return vo;
	}

	// 게시글 갯수
	@Override
	public void addReadCnt(int boardnum) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		dao.addReadCnt(boardnum);
	}
	

	// 게시판 수정
	@Override
	public int updateBoards(BoardsVO vo) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.updateBoards(vo);
	}

	// 게시판 리스트
	@Override
	public BoardsVO getBoardsArticle(int num) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		BoardsVO vo = dao.getBoardsArticle(num);
		return vo;
	}
	
	// 게시글 끝번호 확인
	@Override
	public int getMaxNum() {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.getMaxNum();
	}

	@Override
	public void updateReply(BoardListVO vo) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		dao.updateReply(vo);
	}

	@Override
	public int deleteAll(BoardListVO vo) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.deleteAll(vo);
	}

	@Override
	public void updateStep(BoardListVO vo) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		dao.updateStep(vo);
	}
	
	
	
}
