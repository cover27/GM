package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.MessageBoxVO;
import com.spring.gm.vo.MessageVO;

@Repository
public class S_DAOImpl implements S_DAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getMessageArticleCnt(String receiver) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getMessageArticleCnt(receiver);
	}
	
	@Override
	public List<MessageVO> getMessageArticleList(Map<String, Object> map){
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getMessageArticleList(map);
	}
	
	@Override
	public MessageVO content(int num) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		MessageVO vo = dao.content(num);
		return vo;
	}
	
	@Override
	public int readCnt() {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.readCnt();
	}

	@Override
	public int sendMessage(MessageVO vo) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.sendMessage(vo);
	}
	
	@Override
	public int sendMessageData(MessageVO vo) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.sendMessageData(vo);
	}

	@Override
	public int sendMessageArticleCnt(String sendId) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.sendMessageArticleCnt(sendId);
	}

	@Override
	public List<MessageVO> sendMessageArticleList(Map<String, Object> map) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.sendMessageArticleList(map);
	}

	@Override
	public int garbage(Map<String, Integer> map) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.garbage(map);
	}

	@Override
	public int getGarbageCnt(String strId) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getGarbageCnt(strId);
	}

	@Override
	public List<MessageVO> getGarbageList(Map<String, Object> map) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getGarbageList(map);
	}

	@Override
	public int delgarbage(Map<String, Integer> map) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.delgarbage(map);
	}

	@Override
	public int sendDelete(Map<String, Integer> map) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.sendDelete(map);
	}

	@Override
	public int getMessageBoxArticleCnt(String strId) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getMessageBoxArticleCnt(strId);
	}

	@Override
	public List<MessageVO> getMessageBoxArticleList(Map<String, Object> map) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.getMessageBoxArticleList(map);
	}

	@Override
	public int addReadCnt(int num) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.addReadCnt(num);
	}

	@Override
	public int createMessageBox(MessageBoxVO vo) {
		S_DAO dao = sqlSession.getMapper(S_DAO.class);
		return dao.createMessageBox(vo);
	}




}
