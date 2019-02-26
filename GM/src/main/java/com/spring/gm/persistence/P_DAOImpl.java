package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.Join_payVO;
import com.spring.gm.vo.Join_payVO2;
import com.spring.gm.vo.PaymentInfoVO;
import com.spring.gm.vo.PaymentVO;
import com.spring.gm.vo.join_groupnameVO;

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
	public List<Join_payVO2> selectApprLine(int company) {
		dao = sqlSession.getMapper(P_DAO.class);
		return dao.selectApprLine(company);
	}
	@Override
	public Join_payVO2 getApprline(String id) {
		dao = sqlSession.getMapper(P_DAO.class);
		return dao.getApprline(id);
	}
	//전자결재 - 기안문 - 결재선  회사에 그룹등급이 1인 부서명
	@Override
	public List<String> getGroupName(int company) {
		dao = sqlSession.getMapper(P_DAO.class);
		return dao.getGroupName(company);
	}
	@Override
	public int insertGroupPayment(int company) {
		return sqlSession.insert("com.spring.gm.persistence.P_DAO.insertGroupPayment", company);
	}
	@Override
	public int getSeqGroups() {
		return sqlSession.selectOne("com.spring.gm.persistence.P_DAO.getSeqGroups");
	}
	@Override
	public int insertPayment(Map<String, Object> map) {
		return sqlSession.insert("com.spring.gm.persistence.P_DAO.insertPayment", map);
	}
	@Override
	public int getPaymentNum(int groupid) {
		return sqlSession.selectOne("com.spring.gm.persistence.P_DAO.getPaymentNum", groupid);
	}
	@Override
	public int insertGroupinfoPayment(Map<String, Object> map) {
		return sqlSession.insert("com.spring.gm.persistence.P_DAO.insertGroupinfoPayment", map);
	}
	@Override
	public int insertPaymentInfo(Map<String, Object> map) {
		return sqlSession.insert("com.spring.gm.persistence.P_DAO.insertPaymentInfo", map);
	}
	@Override
	public int getPaymentCnt(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.gm.persistence.P_DAO.getPaymentCnt", map);
	}
	@Override
	public List<PaymentVO> getPaymentList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.gm.persistence.P_DAO.getPaymentList", map);
	}
	@Override
	public int getPaymentCnt2(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.gm.persistence.P_DAO.getPaymentCnt2", map);
	}
	@Override
	public List<PaymentVO> getPaymentList2(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.gm.persistence.P_DAO.getPaymentList2", map);
	}
	@Override
	public int getPaymentCnt3(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.gm.persistence.P_DAO.getPaymentCnt3", map);
	}
	@Override
	public List<PaymentVO> getPaymentList3(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.gm.persistence.P_DAO.getPaymentList3", map);
	}
	@Override
	public int getPaymentCnt4(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.gm.persistence.P_DAO.getPaymentCnt4", map);
	}
	@Override
	public List<PaymentVO> getPaymentList4(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.gm.persistence.P_DAO.getPaymentList4", map);
	}
	@Override
	public int getPaymentCnt5(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.gm.persistence.P_DAO.getPaymentCnt5", map);
	}
	@Override
	public List<PaymentVO> getPaymentList5(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.gm.persistence.P_DAO.getPaymentList5", map);
	}
	@Override
	public int P_deletePayment(Map<String, Object> map) {
		return sqlSession.update("com.spring.gm.persistence.P_DAO.P_deletePayment", map);
	}
	@Override
	public PaymentVO getPayment(int groupid) {
		return sqlSession.selectOne("com.spring.gm.persistence.P_DAO.getPayment", groupid);
	}
	@Override
	public List<PaymentInfoVO> countPayInfo(int num) {
		return sqlSession.selectList("com.spring.gm.persistence.P_DAO.countPayInfo", num);
	}
	@Override
	public List<join_groupnameVO> getGroupInfo(int groupid) {
		return sqlSession.selectList("com.spring.gm.persistence.P_DAO.getGroupInfo", groupid);
	}
	@Override
	public int getMyOrder(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.gm.persistence.P_DAO.getMyOrder", map);
	}
	@Override
	public int countNextMem(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.gm.persistence.P_DAO.countNextMem", map);
	}
	@Override
	public int finalApproveCheck(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.gm.persistence.P_DAO.finalApproveCheck", map);
	}
	@Override
	public int beforeApproveCheck(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.gm.persistence.P_DAO.beforeApproveCheck", map);
	}
	@Override
	public int updateApprove(Map<String, Object> map) {
		return sqlSession.update("com.spring.gm.persistence.P_DAO.updateApprove", map);
	}
	@Override
	public int updatePayment(Map<String, Object> map) {
		return sqlSession.update("com.spring.gm.persistence.P_DAO.updatePayment", map);
	}
	@Override
	public int checkRefer(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.gm.persistence.P_DAO.checkRefer", map);
	}
	
}
