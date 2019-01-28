package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import com.spring.gm.vo.BoardListVO;
import com.spring.gm.vo.BoardsVO;

public interface D_DAO {

	public int insertBoards(BoardsVO VO); // 게시판 생성문
	
	public int getBoardsArticleCnt(); //게시판 갯수
	
	public List<BoardsVO> getBoardsArticleList(Map<String, Object> map); //게시판 목록
	
	public int updateBoards(BoardsVO vo);	//게시판 수정
	
	public int deleteBoards(BoardsVO vo);	//게시판 삭제
	
	public int getBoardArticleCnt();	//게시글 갯수
	
	public List<BoardListVO> getBoardArticleList(Map<String, Object> map);	//게시글 목록
}
