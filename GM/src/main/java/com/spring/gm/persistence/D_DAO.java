package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import com.spring.gm.vo.BoardsVO;

public interface D_DAO {

	public int insertBoards(BoardsVO VO); // 게시판 생성문
	
	public int getBoardsArticleCnt(); //게시판 갯수
	
	public List<BoardsVO> getBoardsArticleList(Map<String, Object> map); //게시판 목록
}
