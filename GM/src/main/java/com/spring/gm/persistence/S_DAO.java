package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;
import com.spring.gm.vo.MessageVO;



public interface S_DAO {
	
	// 받은 쪽지 갯수
	public int getMessageArticleCnt(String receiver);
	
	// 받은 쪽지 리스트
	public List<MessageVO> getMessageArticleList(Map<String, Object> map);
	
	// 메세지 전송
	public int sendMessage(MessageVO vo);
	
	// 보넨 메세지 저장
	public int sendMessageData(MessageVO vo);
	
	// 조회수
	public int readCnt();
	
	// 메세지 전송 갯수
	public int sendMessageArticleCnt(String sendId);
	
	// 보넨 쪽지 리스트
	public List<MessageVO> sendMessageArticleList(Map<String, Object> map);
	
	// 보넨 쪽지 삭제
	public int sendDelete(Map<String, Integer> map);
	
	// 휴지통 보네기
	public int garbage(Map<String, Integer> map);
	
	// 휴지통 쪽지 갯수
	public int getGarbageCnt(String strId);
	
	// 휴지통 쪽지 리스트
	public List<MessageVO> getGarbageList(Map<String, Object> map);
	
	// 휴지통 삭제 처리
	public int delgarbage(Map<String, Integer> map);

}
