package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.MemoVO;

@Repository
public class E_DAOImpl implements E_DAO {

	@Autowired
	private SqlSession sqlSession;
	

	// 조직도 - 내가 속한 그룹 멤버 수 구하기
	@Override
	public int getMyCompanyMemCnt(int company) {
		return sqlSession.selectOne("com.spring.gm.persistence.E_DAO.getMyCompanyMemCnt", company);
	}
	
	// 조직도 - 사용자가 소속된 회사의 정보
	@Override
	public List<MemberVO> getMyCompanyInfo(int company) {
		return sqlSession.selectList("com.spring.gm.persistence.E_DAO.getMyCompanyInfo", company);
	}

}
