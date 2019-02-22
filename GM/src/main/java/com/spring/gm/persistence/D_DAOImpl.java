package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.BoardListAndBoardsVO;
import com.spring.gm.vo.BoardListVO;
import com.spring.gm.vo.BoardsVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.ReplyListVO;


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
	public int getBoardsArticleCnt(int company) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.getBoardsArticleCnt(company);
	}

	@Override
	// 게시판 목록
	public List<BoardsVO> getBoardsArticleList(Map<String, Object> map) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.getBoardsArticleList(map);
	}

	@Override
	// 게시글 갯수
	public int getBoardArticleCnt(int company) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.getBoardArticleCnt(company);
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
			int cnt = getBoardArticleCnt(vo.getCompany());
			
			if(cnt > 0) {
				ref = getMaxNum() + 1;
				System.out.println("ref확인 : "+ref);
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

	// 댓글 작성
	@Override
	public int insertReple(ReplyListVO vo) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.insertReple(vo);
	}

	// 댓글 목록
	@Override
	public List<ReplyListVO> getRepleArticleList(Map<String, Object> map) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.getRepleArticleList(map);
	}

	// 댓글 갯수
	@Override
	public int getRepleArticleCnt() {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.getRepleArticleCnt();
	}

	@Override
	public int deleteReple(int replenum) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.deleteReple(replenum);
	}

	@Override
	public int repleCnt(int boardnum) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.repleCnt(boardnum);
	}
	
	// 댓글 + 1
	@Override
	public int addRepleCnt(int boardnum) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.addRepleCnt(boardnum);
	}

	@Override
	public int deleteRepleCnt(int boardnum) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.deleteRepleCnt(boardnum);
	}

	@Override
	public List<BoardListAndBoardsVO> getAllBoardArticleList(Map<String, Object> map) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.getAllBoardArticleList(map);
	}

	@Override
	public int deleteBoards(BoardsVO vo) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.deleteBoards(vo);
	}

	@Override
	public int updateReple(ReplyListVO vo) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.updateReple(vo);
	}

	@Override
	public ReplyListVO getRepleArticle(int replenum) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		ReplyListVO vo = dao.getRepleArticle(replenum);
		return vo;
	}

	@Override
	public int delBoard(Map<String, Integer> map) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.delBoard(map);
	}

	@Override
	public int boardMove(Map<String, Integer> map) {
		D_DAO dao = sqlSession.getMapper(D_DAO.class);
		return dao.boardMove(map);
	}
	
	@Override
	public int confirmIdPwd(Map<String, String> map) {
		D_DAO mapper = sqlSession.getMapper(D_DAO.class);
		int cnt = mapper.confirmIdPwd(map);
		return cnt;
	}

	@Override
	public MemberVO getMemberInfo(String id) {
		D_DAO mapper = sqlSession.getMapper(D_DAO.class);
		MemberVO m = mapper.getMemberInfo(id);
		return m;
	}

	
}
