package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import com.spring.gm.vo.MessageBoxVO;
import com.spring.gm.vo.MessageVO;



public interface S_DAO {
	
	// 받은 쪽지 갯수
	public int getMessageArticleCnt(String receiver);
	
	// 받은 쪽지 리스트
	public List<MessageVO> getMessageArticleList(Map<String, Object> map);
	
	public int getMessageBoxArticleCnt(String strId); //메일박스 갯수
	
	public List<MessageBoxVO> getMessageBoxArticleList(Map<String, Object> map); //게시판 목록
	
	public int sendMessage(MessageVO vo); // 메세지 전송문
	
	public int readCnt();	// 댓글 갯수

}
