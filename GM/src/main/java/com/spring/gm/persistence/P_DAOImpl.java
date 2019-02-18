package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.GroupsVO;
import com.spring.gm.vo.Join_payVO;
import com.spring.gm.vo.PaymentInfoVO;
import com.spring.gm.vo.PaymentVO;

@Repository
public class P_DAOImpl implements P_DAO{
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	P_DAO dao;
	
	//전자결재 - 기안문 생성 - 부서조인
	@Override
	public Join_payVO createAppDocForm(String id) {
		dao = sqlSession.getMapper(P_DAO.class);
		return dao.createAppDocForm(id);
	}
	//전자결재 - 기안문 생성 - 회사조인
	@Override
	public Join_payVO createAppDocForm2(String id) {
		dao = sqlSession.getMapper(P_DAO.class);
		return dao.createAppDocForm2(id);
	}

	//전자결재 - 기안문 - 결재선 select 조인
	@Override
	public List<Join_payVO> selectApprLine() {
		dao = sqlSession.getMapper(P_DAO.class);
		return dao.selectApprLine();
	}
	//전자결재 - 기안문 - 결재선  회사에 그룹등급이 1인 부서명
	@Override
	public List<String> getGroupName(int company) {
		dao = sqlSession.getMapper(P_DAO.class);
		return dao.getGroupName(company);
	}
	@Override
	public List<Integer> getPayGroupId(String id) {
		return sqlSession.selectList("com.spring.gm.persistence.P_DAO.getPayGroupId", id);
	}
	@Override
	public GroupsVO getPayGroups(int groupid) {
		return sqlSession.selectOne("com.spring.gm.persistence.P_DAO.getPayGroups", groupid);
	}
	@Override
	public PaymentVO getPayment(int groupid) {
		return sqlSession.selectOne("com.spring.gm.persistence.P_DAO.getPayment", groupid);
	}
	@Override
	public PaymentInfoVO countPayInfo(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.gm.persistence.P_DAO.countPayInfo", map);
	}
	
	
}
