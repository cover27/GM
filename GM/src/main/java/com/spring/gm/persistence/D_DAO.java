package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import com.spring.gm.vo.BoardListVO;
import com.spring.gm.vo.BoardsVO;
import com.spring.gm.vo.ReplyListVO;



public interface D_DAO {

	public int insertBoards(BoardsVO VO); // 게시판 생성문
	
	public int getBoardsArticleCnt(); //게시판 갯수
	
	public List<BoardsVO> getBoardsArticleList(Map<String, Object> map); //게시판 목록
	
	public int updateBoard(BoardListVO vo);	//게시글 수정
	
	public int deleteBoard(int boardnum);	//게시글 삭제
	
	public int getBoardArticleCnt();	//게시글 갯수
	
	public List<BoardListVO> getBoardArticleList(Map<String, Object> map);	//게시글 목록
	
	public int insertBoard(BoardListVO vo); // 게시글 생성
	
	public BoardListVO getArticle(int boardnum);	// 게시글 상세
	
	public BoardsVO getBoardsArticle(int num);		// 게시판 상세
	
	public void addReadCnt(int boardnum);	// 조회수 증가
	
	public int checkReply(BoardListVO vo);	// 댓글
	
	public int updateBoards(BoardsVO vo);	// 게시판 수정
	
	public int getMaxNum();
	
	public void updateReply(BoardListVO vo);
	
	public int deleteAll(BoardListVO vo);
	
	public void updateStep(BoardListVO vo);
	
	public int insertReple(ReplyListVO vo);
	
	public List<ReplyListVO> getRepleArticleList(Map<String, Object> map);	// 댓글 목록
	
	public int getRepleArticleCnt();	// 댓글 갯수
	
	public int deleteReple(int replenum);	// 댓글 삭제
	
	public int repleCnt();

	

}
