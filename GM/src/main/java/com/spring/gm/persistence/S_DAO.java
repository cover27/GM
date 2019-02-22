package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import com.spring.gm.vo.MassageBoxVO;
import com.spring.gm.vo.MassageVO;


public interface S_DAO {
	
	public int getMessageArticleCnt(String strId);
	
	public List<MassageVO> getMessageArticleList(Map<String, Object> map);
	
	public int getMessageBoxArticleCnt(String strId); //메일박스 갯수
	
	public List<MassageBoxVO> getMessageBoxArticleList(Map<String, Object> map); //게시판 목록
}
