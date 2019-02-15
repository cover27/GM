package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import com.spring.gm.vo.GroupsVO;
import com.spring.gm.vo.Join_payVO;
import com.spring.gm.vo.PaymentInfoVO;
import com.spring.gm.vo.PaymentVO;

public interface P_DAO {
	
	//전자결재 - 기안문 생성
	public Join_payVO createAppDocForm(String id); // 부서 조인
	public Join_payVO createAppDocForm2(String id); // 회사 조인
	
	//전자결재 - 기안문 - 결재선
	public List<Join_payVO> selectApprLine(); //결재선 조회 조인문
	public List<String> getGroupName(int company);//결재선 부서명
	
	//본인이 속한 결제그룹리스트를 가져오는 함수
	public List<Integer> getPayGroupId(String id);
	public GroupsVO getPayGroups(int groupid);
	public PaymentVO getPayment(int groupid);
	public PaymentInfoVO countPayInfo(Map<String, Object> map);
}
