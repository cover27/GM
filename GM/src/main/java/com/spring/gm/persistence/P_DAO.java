package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import com.spring.gm.vo.Join_payVO;
import com.spring.gm.vo.PaymentInfoVO;
import com.spring.gm.vo.PaymentVO;
import com.spring.gm.vo.join_groupnameVO;

public interface P_DAO {
	
	//전자결재 - 기안문 생성
	public Join_payVO createAppDocForm(String id); // 부서 조인
	public Join_payVO createAppDocForm2(String id); // 회사 조인
	
	//전자결재 - 기안문 - 결재선
	public List<Join_payVO> selectApprLine(int company); //결재선 조회 조인문
	public List<String> getGroupName(int company);//결재선 부서명
	
	//본인이 속한 결제그룹리스트를 가져오는 함수
	public int getPaymentCnt(Map<String, Object> map);
	public List<PaymentVO> getPaymentList(Map<String, Object> map);
	public int getPaymentCnt2(Map<String, Object> map);
	public List<PaymentVO> getPaymentList2(Map<String, Object> map);
	public int getPaymentCnt3(Map<String, Object> map);
	public List<PaymentVO> getPaymentList3(Map<String, Object> map);
	public int getPaymentCnt4(Map<String, Object> map);
	public List<PaymentVO> getPaymentList4(Map<String, Object> map);
	public int getPaymentCnt5(Map<String, Object> map);
	public List<PaymentVO> getPaymentList5(Map<String, Object> map);
	
	//삭제
	public int P_deletePayment(Map<String, Object> map);
	
	public PaymentVO getPayment(int groupid);
	
	public List<PaymentInfoVO> countPayInfo(int num);
	public List<join_groupnameVO> getGroupInfo(int groupid);
	
	public int getMyOrder(Map<String, Object> map);
	public int countNextMem(Map<String, Object> map);
	public int finalApproveCheck(Map<String, Object> map);
	public int beforeApproveCheck(Map<String, Object> map);
	public int updateApprove(Map<String, Object> map);
	public int updatePayment(Map<String, Object> map);
	public int checkRefer(Map<String, Object> map);
}
