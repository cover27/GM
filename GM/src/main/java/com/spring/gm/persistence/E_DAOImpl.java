package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.MemoVO;

@Repository
public class E_DAOImpl implements E_DAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 메모 갯수
	@Override
	public int getMemoCnt() {
		int selectCnt = sqlSession.selectOne("com.spring.gm.persistence.E_DAO.getMemoCnt");
		return selectCnt;
	}

	// 메모 목록 조회
	@Override
	public List<MemoVO> getMemoList(Map<String, Integer> map) {
		//큰 바구니 선언
		List<MemoVO> dtos = null;
		
		dtos = sqlSession.selectOne("com.spring.gm.persistence.E_DAO.getMemoList", map);
		return dtos;
	}

	

}
