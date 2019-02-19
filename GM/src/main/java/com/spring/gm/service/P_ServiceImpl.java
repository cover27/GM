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
import com.spring.gm.vo.Join_payVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.PaymentInfoVO;
import com.spring.gm.vo.PaymentVO;
import com.spring.gm.vo.join_groupnameVO;

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
		
		int pageSize = 10; 		// 한페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 글갯수		
		int start = 0;			// 현재 페이지 시작 글번호
		int end = 0;			// 현재 페이지 마지막 글번호
		int number = 0;			// 출력용 글번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	// 첫페이지를 1페이지로 지정
		}
		currentPage = Integer.parseInt(pageNum);
		start = (currentPage - 1) * pageSize + 1; 
		end = start + pageSize - 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("agree", 0);
		cnt = dao.getPaymentCnt(map);
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			List<PaymentVO> payment = new ArrayList<PaymentVO>();
			payment = dao.getPaymentList(map);
			
			model.addAttribute("payment", payment);
		}
		
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1
		number = cnt - (currentPage - 1) * pageSize;
		if(end > cnt) end = cnt;
		
		// 시작페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("startPage : " + startPage);
				
		// 마지막 페이지
		endPage = startPage + pageBlock - 1; 
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("================");
		
		model.addAttribute("cnt", cnt);  // 글갯수
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("pageNum", pageNum);  // 페이지번호
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);     // 시작 페이지
			model.addAttribute("endPage", endPage);         // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock);     // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount);     // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}		
		// content에서 유용하게 쓸예정
	}

	@Override
	public void P_payContentForm(HttpServletRequest req, Model model) {
		String num_s = req.getParameter("num");
		int num = Integer.parseInt(num_s);
		String groupid_s = req.getParameter("groupid");
		int groupid = Integer.parseInt(groupid_s);
		PaymentVO eachPayment = new PaymentVO();
		List<PaymentInfoVO> paymentInfo = new ArrayList<PaymentInfoVO>();
		List<join_groupnameVO> groupInfo = new ArrayList<join_groupnameVO>();
		eachPayment = dao.getPayment(groupid);
		paymentInfo = dao.countPayInfo(num);
		groupInfo = dao.getGroupInfo(groupid);
		
		model.addAttribute("eachPayment", eachPayment);
		model.addAttribute("paymentInfo", paymentInfo);
		model.addAttribute("groupInfo", groupInfo);
	}
	
}
