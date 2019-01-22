package com.spring.gm.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.BoardsVO;

@Repository
public class BoardsDAOImpl implements BoardsDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertCnt(BoardsVO boardsVO) {
	
		return 0;
	}

}
