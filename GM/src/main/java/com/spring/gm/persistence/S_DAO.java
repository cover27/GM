package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import com.spring.gm.vo.BoardsVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.MessageBoxVO;
import com.spring.gm.vo.MessageVO;



public interface S_DAO {
	
	// 받은 쪽지 갯수
	public int getMessageArticleCnt(String receiver);
	
	// 받은 쪽지 리스트
	public List<MessageVO> getMessageArticleList(Map<String, Object> map);
	
	// 쪽지 상세페이지
	public MessageVO content(int num);
	
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
	
	// 보넨 쪽지의 받은 상대방 쪽지 삭제
	public int sendDel(Map<String, Integer> map);
	
	// 휴지통 보네기
	public int garbage(Map<String, Integer> map);
	
	// 휴지통 쪽지 갯수
	public int getGarbageCnt(String strId);
	
	// 휴지통 쪽지 리스트
	public List<MessageVO> getGarbageList(Map<String, Object> map);
	
	// 휴지통 삭제 처리
	public int delgarbage(Map<String, Integer> map);
	
	// 조회수 증가
	public int addReadCnt(int num);
	
	// 보넨 메세지 조회수 증가
	public int sendAddReadCnt(int num);
	
	// 상세페이지 삭제
	public int deleteMessage(int num);
	
	// 보넨메세지 삭제
	public int sendDeleteMessage(int num);
	
	public int sendDelMessage(int num);
	
	public int garbageContentDelete(int num);
	
	// 안읽은 메세지
	public int notReadCnt(String strId);
	
	// 아이디 정보조회
	public MemberVO getMemberInfo(String strId);

}
