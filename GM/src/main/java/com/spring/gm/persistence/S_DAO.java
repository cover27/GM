package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import com.spring.gm.vo.MassageBoxVO;
import com.spring.gm.vo.MassageVO;


public interface S_DAO {
	
	public int getMailArticleCnt(String strId);
	
	public List<MassageVO> getMailArticleList(Map<String, Object> map);
	
	public int getMailBoxArticleCnt(String strId); //메일박스 갯수
	
	public List<MassageBoxVO> getMailBoxArticleList(Map<String, Object> map); //게시판 목록
}
