package com.spring.gm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.gm.persistence.K_DAO;
import com.spring.gm.persistence.P_DAO;
import com.spring.gm.vo.GroupsVO;
import com.spring.gm.vo.Join_payVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.PaymentInfoVO;
import com.spring.gm.vo.PaymentVO;

@Service
public class P_ServiceImpl implements P_Service{
	
	@Autowired
	P_DAO dao;
	@Autowired
	K_DAO dao2;
	
	//전자결재 - 기안문 작성
	@Override
	public void createApprDoc(HttpServletRequest req, Model model) {
		
		//아무 것도 작성하지 않고 첫 진입시의 서비스
		if(req.getParameterValues("memName")==null) {
			String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
			int depart = ((MemberVO)req.getSession().getAttribute("loginInfo")).getDepart();
			
			//기안문 클릭 시 select문
			Join_payVO vo = new Join_payVO();
			
			if(depart < 410000000) { // 부서를 가지고 있는 경우
				vo = dao.createAppDocForm(id);
			} else { // 부서가 없어서 회사이름이 들어가는 경우
				vo = dao.createAppDocForm2(id);
			}
			model.addAttribute("vo", vo);
		
		//결재선 적용 후 진입하는 서비스
		}else {
			
			
			
			
			//결재선 정보의 checkbox 다중 선택
			String[] checkBoxSel = req.getParameterValues("id2");
			List<String> list = new ArrayList<String>();
			
			for(int i=0; i<checkBoxSel.length; i++) {
				list.add(checkBoxSel[i]); 
			}
		  
			model.addAttribute("list", list);
		}
		
		
		
	}

	//전자결재 - 결재선 지정
	@Override
	public void addApprLine(HttpServletRequest req, Model model) {
		
		int company=((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		//선빈이가 만든 sql에 회사에 대한 정보가 들어 있음
		String a = dao2.getCompanyName(company);

		
		//회사명, 부서명, 이름명을 dtos에 담고 dtos의 크기를 비교하여 g_name의 null 값을 확인하여 null값을 회사명(a)으로 나타나도록 한다.
		List<Join_payVO> dtos = dao.selectApprLine();
		for(int i = 0; i<dtos.size(); i++) {
			if(dtos.get(i).getG_name()==null) {
				dtos.get(i).setG_name(a);
			}
		}
		System.out.print(dtos);
		
		//a에 회사명 정보가 들어가 있음
		List<String> dname = new ArrayList<String>();
		dname.add(a);
		//전자결재 - 기안문 - 결재선  회사에 그룹등급이 1인 부서명
		List<String> dname2 = dao.getGroupName(company);
		dname.addAll(dname2);
		
		model.addAttribute("dtos", dtos);
		model.addAttribute("dname", dname);
		
		
	}

	//결재요청
	@Override
	public void apprDocReq(HttpServletRequest req, Model model) {
		
	}

	//결재 대기함
	@Override
	public void P_listApprTodoView(HttpServletRequest req, Model model) {
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		
		List<Integer> groupids = new ArrayList<Integer>();
		groupids = dao.getPayGroupId(id);
		List<GroupsVO> groups = new ArrayList<GroupsVO>();
		GroupsVO eachGroup = new GroupsVO();
		for(int i=0; i<groupids.size();i++) {
			eachGroup = dao.getPayGroups(groupids.get(i));
			groups.add(eachGroup);
			eachGroup = null;
		}
		List<PaymentVO> payment = new ArrayList<PaymentVO>();
		PaymentVO eachPayment = new PaymentVO();
		for(int i=0; i<groups.size(); i++) {
			eachPayment = dao.getPayment(groups.get(i).getGroupId());
			payment.add(eachPayment);
			eachPayment = null;
		}
		// content에서 유용하게 쓸예정
		/*List<PaymentInfoVO> paymentInfo = new ArrayList<PaymentInfoVO>();
		PaymentInfoVO eachPayInfo = new PaymentInfoVO();
		Map<String, Object> map = new HashMap<String, Object>();
		for(int i=0;i<payment.size();i++) {
			map.put("num", payment.get(i).getNum());
			map.put("id", id);
			eachPayInfo = dao.countPayInfo(map);
			paymentInfo.add(eachPayInfo);
			paymentInfo = null;
		}*/
		
		model.addAttribute("payment", payment);
	}	
}
