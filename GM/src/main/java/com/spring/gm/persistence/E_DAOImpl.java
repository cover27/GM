package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.GroupsVO;
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

	// 조직도 - 내가 속한 회사의 전체 그룹 수 구하기
	@Override
	public List<GroupsVO> getMyCompanyGroupCnt(int company) {
		return sqlSession.selectList("com.spring.gm.persistence.E_DAO.getMyCompanyGroupCnt", company);
	}

	// 조직도 - 부서 aside 용
	@Override
	public List<MemberVO> getMyCompanyInfo2(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.gm.persistence.E_DAO.getMyCompanyInfo2", map);
	}

	// 조직도 - 로그인 정보 회사 이름 찾기
	@Override
	public String findCompanyName(int company) {
		return sqlSession.selectOne("com.spring.gm.persistence.E_DAO.findCompanyName", company);
	}


}
