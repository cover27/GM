package com.spring.gm.service;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.spring.gm.persistence.K_DAO;
import com.spring.gm.persistence.P_DAO;
import com.spring.gm.vo.AttachVO;
import com.spring.gm.vo.Join_payVO2;
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
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		Join_payVO2 eachPayLine = dao.getApprline(id);
		
		//아무 것도 작성하지 않고 첫 진입시의 서비스
		if(req.getSession().getAttribute("payLine") == null || req.getParameter("before") == null) {
			req.getSession().removeAttribute("payLine");
			List<Join_payVO2> payLine = new ArrayList<Join_payVO2>();
			eachPayLine.setOrder(1);
			payLine.add(eachPayLine);
			req.getSession().setAttribute("payLine", payLine);
			
		//결재선 적용 후 진입하는 서비스
		}
		
		model.addAttribute("vo", eachPayLine);
	}

	//전자결재 - 결재선 지정
	@Override
	public void addApprLine(HttpServletRequest req, Model model) {
		
		int company=((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		//선빈이가 만든 sql에 회사에 대한 정보가 들어 있음
		String a = dao2.getCompanyName(company);
		
		//회사명, 부서명, 이름명을 dtos에 담고 dtos의 크기를 비교하여 g_name의 null 값을 확인하여 null값을 회사명(a)으로 나타나도록 한다.
		List<Join_payVO2> dtos = dao.selectApprLine(company);
		for(int i = 0; i<dtos.size(); i++) {
			if(dtos.get(i).getG_name()==null) {
				dtos.get(i).setG_name(a);
			}
		}
		
		//a에 회사명 정보가 들어가 있음
		List<String> dname = new ArrayList<String>();
		dname.add(a);
		//전자결재 - 기안문 - 결재선  회사에 그룹등급이 1인 부서명
		List<String> dname2 = dao.getGroupName(company);
		dname.addAll(dname2);
		
		model.addAttribute("dtos", dtos);
		model.addAttribute("dname", dname);
		
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		Join_payVO2 eachPayLine = dao.getApprline(id);
		List<Join_payVO2> payLine = new ArrayList<Join_payVO2>();
		eachPayLine.setOrder(1);
		payLine.add(eachPayLine);
		req.getSession().setAttribute("payLine", payLine);
		
	}
	
	@Override
	public void P_payLinePro(HttpServletRequest req, Model model) {
		int company=((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		String a = dao2.getCompanyName(company);
		List<Join_payVO2> dtos = dao.selectApprLine(company);
		for(int i = 0; i<dtos.size(); i++) {
			if(dtos.get(i).getG_name()==null) {
				dtos.get(i).setG_name(a);
			}
		}
		List<String> dname = new ArrayList<String>();
		dname.add(a);
		//전자결재 - 기안문 - 결재선  회사에 그룹등급이 1인 부서명
		List<String> dname2 = dao.getGroupName(company);
		dname.addAll(dname2);
		
		model.addAttribute("dtos", dtos);
		model.addAttribute("dname", dname);
		
		String[] ids = req.getParameterValues("id");
		String[] orders = req.getParameterValues("order");
		int counts = 1;
		List<Join_payVO2> payLine = new ArrayList<Join_payVO2>();
		Join_payVO2 eachPayLine = new Join_payVO2();
		for(int i=0;i<ids.length;i++) {
			eachPayLine = dao.getApprline(ids[i]);
			if(Integer.parseInt(orders[i]) != 0) {
				eachPayLine.setOrder(counts);
				counts++;
			} else {
				eachPayLine.setOrder(0);
			}
			payLine.add(eachPayLine);
		}
		
		String strId = req.getParameter("select");
		int pay = Integer.parseInt(req.getParameter("pay"));
		System.out.println("select : "+strId);
		System.out.println("pay : "+pay);
		int order = 0;
		int count = 0;
		for(int i=0; i<payLine.size(); i++) {
			if(payLine.get(i).getOrder() != 0) {
				count += 1;
			}
		}
		if(pay == 2) {
			order = 0;
		} else {
			order = count+1;
		}
		
		eachPayLine = dao.getApprline(strId);
		eachPayLine.setOrder(order);
		payLine.add(eachPayLine);
		req.getSession().setAttribute("payLine", payLine);
	}
	
	@Override
	public void P_resistPayLine(HttpServletRequest req, Model model) {
		String[] ids = req.getParameterValues("id");
		String[] orders = req.getParameterValues("order");
		String before = req.getParameter("before");
		int counts = 1;
		
		List<Join_payVO2> payLine = new ArrayList<Join_payVO2>();
		Join_payVO2 eachPayLine = new Join_payVO2();
		for(int i=0;i<ids.length;i++) {
			eachPayLine = dao.getApprline(ids[i]);
			if(Integer.parseInt(orders[i]) != 0) {
				eachPayLine.setOrder(counts);
				counts++;
			} else {
				eachPayLine.setOrder(0);
			}
			payLine.add(eachPayLine);
		}
		
		model.addAttribute("before", before);
		req.getSession().setAttribute("payLine", payLine);
	}

	//결재요청
	@Override
	public void apprDocReq(MultipartFile file, HttpServletRequest req, Model model) {
		int company=((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		String id=((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		String name=((MemberVO)req.getSession().getAttribute("loginInfo")).getName();
		String subject = req.getParameter("subject");
		String content = req.getParameter("formEditorData");
		String[] ids = req.getParameterValues("id");
		String[] orders = req.getParameterValues("order");
		int cnt = 1;
		
		int insertCnt = dao.insertGroupPayment(company);
		cnt = (cnt!=0&&insertCnt!=0)?1:0;
		int groupid = dao.getSeqGroups();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("groupid", groupid);
		map.put("id", id);
		map.put("name", name);
		map.put("subject", subject);
		map.put("content", content);
		System.out.println("groupid : "+groupid);
		System.out.println("subject : "+subject);
		System.out.println("content : "+content);
		insertCnt = dao.insertPayment(map);
		cnt = (cnt!=0&&insertCnt!=0)?1:0;
		int paymentNum = dao.getPaymentNum(groupid);
		map.put("num", paymentNum);
		for(int i=0; i<ids.length;i++) {
			map.put("id", ids[i]);
			map.put("order", Integer.parseInt(orders[i]));
			int insertCnt2 = dao.insertGroupinfoPayment(map);
			cnt = (cnt!=0&&insertCnt2!=0)?1:0;
			if(Integer.parseInt(orders[i]) == 0) {
				map.put("result", "합의대기");
				map.put("refer", 1);
				map.put("agree", 0);
			} else if(Integer.parseInt(orders[i]) == 1) {
				map.put("result", "요청");
				map.put("refer", 0);
				map.put("agree", 1);
			} else if(Integer.parseInt(orders[i]) > 1) {
				map.put("result", "결재대기");
				map.put("refer", 0);
				map.put("agree", 0);
			}
			int insertCnt3 = dao.insertPaymentInfo(map);
			cnt = (cnt!=0&&insertCnt3!=0)?1:0;
		}
		
		if(file != null) {
			String stored_title = getRandomString();
			String title = file.getOriginalFilename();
			long size = file.getSize();
			
			// 선빈 pc임 첨부파일 쓸거면 각자 자기 pc url 적어놓으셈
			// 선빈 : C:\\DEV43_\\git\\GM\\GM\\src\\main\\webapp\\resources\\files\\
			// 장훈
			// 원영
			// 킹정
			// 경준
			
			File f = new File("C:\\DEV43_\\git\\GM\\GM\\src\\main\\webapp\\resources\\files\\"+stored_title);
			
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("title", title);
			map2.put("contentNum", paymentNum);
			map2.put("stored_title", stored_title);
			map2.put("filesize", size);
			System.out.println("title : "+title);
			System.out.println("size : "+size);
			System.out.println("contentNum : "+paymentNum);
			System.out.println("stored_title : "+stored_title);
			int attachCnt = dao.insertAttach(map2);
			cnt = (cnt!=0&&attachCnt!=0)?1:0;
		}
		
		model.addAttribute("cnt", cnt);
		
	}

	//랜덤파일이름 만들기
	@Override
	public String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	//결재 대기함
	@Override
	public void P_listApprTodoView(HttpServletRequest req, Model model) {
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		
		int pageSize = 10; 		// 한페이지당 출력할 글 갯수
		int pageBlock = 5;		// 한 블럭당 페이지 갯수
		
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
		
		int search = 0;
		if(req.getParameter("search") != null) {
			search = Integer.parseInt(req.getParameter("search"));
		}
		if(search == 0) {
			req.getSession().removeAttribute("searchMap");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchUserName", null);
		map.put("toggleSearchType", null);
		map.put("searchApprTitle", null);
		map.put("searchStartDate", null);
		map.put("searchEndDate", null);
		
		if(req.getSession().getAttribute("searchMap") != null) {
			map = (Map<String, Object>)req.getSession().getAttribute("searchMap");
			req.getSession().removeAttribute("searchMap");
		}
		
		map.put("id", id);
		map.put("agree", 0);
		map.put("state", "진행");
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
	}

	@Override
	public void P_payContentForm(HttpServletRequest req, Model model) {
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
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
		
		model.addAttribute("id", id);
		model.addAttribute("num", num);
		model.addAttribute("eachPayment", eachPayment);
		model.addAttribute("paymentInfo", paymentInfo);
		model.addAttribute("groupInfo", groupInfo);
		
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		attachList = dao.getAttachList(num);
		model.addAttribute("attachList", attachList);
		
	}
	
	@Override
	public AttachVO downloadFile(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("fileNum"));
		System.out.println("num : "+num);
		return dao.getAttachFile(num);
	}

	@Override
	public void P_deletePayment(HttpServletRequest req, Model model) {
		String num_s = req.getParameter("num");
		int num = Integer.parseInt(num_s);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("del", 1);
		
		int cnt = dao.P_deletePayment(map);
		model.addAttribute("cnt", cnt);
	}

	@Override
	public void P_restoPayment(HttpServletRequest req, Model model) {
		String num_s = req.getParameter("num");
		int num = Integer.parseInt(num_s);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("del", 0);
		
		int cnt = dao.P_deletePayment(map);
		model.addAttribute("cnt", cnt);
	}

	//결재버튼을 눌렀을 때 이므로 paymentinfo's rank가 1이상인 경우
	@Override
	public void P_payApprove(HttpServletRequest req, Model model) {
		String num_s = req.getParameter("num");
		int num = Integer.parseInt(num_s);
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		int cnt = 0; // 상태값
		
		// 본인 위에 다른 결재자가 있는지 확인 해봐야 한다.
		int order = 0; //본인의 결재순위
		int nextMem = 0; //이후에 있는 결재자 수
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("id", id);
		order = dao.getMyOrder(map); // 지금 사용자는 몇번째 단계인가?
		System.out.println("order : "+order);
		map.put("order", order+1);
		map.put("order2", order-1);
		nextMem = dao.countNextMem(map); // 현재 사용자 위에 사람이 있는가? 0 이면 없음 아니면 있음
		System.out.println("nextMem : "+nextMem);
		
		if(nextMem == 0) { // 위에 사람이 없는 경우 -> 최종결재자인 경우 본인 이외의 모든사람이 결재를 완료한 상태여야 함
			if(dao.finalApproveCheck(map) == 0) { //결재, 합의중에 하나라도 안한사람이 0이라면 = 전부다 결재를 했다면
				cnt = 1;
			} else {
				cnt = 2;
			}
		} else { //위에 사람이 있는경우 본인 이전의 사람이 결재를 했으면 결재를 할 수 있음
			if(dao.beforeApproveCheck(map) == 1) { // 이전사람이 결재를 했다면
				cnt = 1;
			} else {
				cnt = 2;
			}
		}
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("num", num);
		model.addAttribute("id", id);
	}

	@Override
	public void P_payApprove_pro(HttpServletRequest req, Model model) {
		String num_s = req.getParameter("num");
		int num = Integer.parseInt(num_s);
		String id = req.getParameter("id");
		String content = req.getParameter("content");
		int cnt = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("id", id);
		map.put("content", content);
		int order = dao.getMyOrder(map);
		map.put("order", order+1);
		int nextMem = dao.countNextMem(map);
		map.put("result", "결재완료");
		int updatecnt = dao.updateApprove(map);
		if(nextMem == 0) {
			map.put("state", "결재완료");
			int updatecnt2 = dao.updatePayment(map);
			if(updatecnt!=0&&updatecnt2!=0) {
				cnt = 1;
			}
		} else {
			cnt = updatecnt;
		}
		
		model.addAttribute("cnt", cnt);
	}

	@Override
	public void P_payDeny(HttpServletRequest req, Model model) {
		String num_s = req.getParameter("num");
		int num = Integer.parseInt(num_s);
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		int cnt = 0; // 상태값
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("id", id);
		int refer = dao.checkRefer(map);
		
		if(refer == 1) { // 합의
			cnt = 1;
		} else { // 결재라인
			int order = dao.getMyOrder(map);
			map.put("order", order+1);
			map.put("order2", order-1);
			int nextMem = dao.countNextMem(map);
			if(nextMem == 0) { // 위에 사람이 없는 경우 -> 최종결재자인 경우 본인 이외의 모든사람이 결재를 완료한 상태여야 함
				if(dao.finalApproveCheck(map) == 0) { //결재, 합의중에 하나라도 안한사람이 0이라면 = 전부다 결재를 했다면
					cnt = 1;
				} else {
					cnt = 2;
				}
			} else { //위에 사람이 있는경우 본인 이전의 사람이 결재를 했으면 결재를 할 수 있음
				if(dao.beforeApproveCheck(map) == 1) { // 이전사람이 결재를 했다면
					cnt = 1;
				} else {
					cnt = 2;
				}
			}
		}
		model.addAttribute("num", num);
		model.addAttribute("id", id);
		model.addAttribute("cnt", cnt);
	}

	@Override
	public void P_payDeny_pro(HttpServletRequest req, Model model) {
		String num_s = req.getParameter("num");
		int num = Integer.parseInt(num_s);
		String id = req.getParameter("id");
		String content = req.getParameter("content");
		int cnt = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("id", id);
		map.put("content", content);
		map.put("result", "반려");
		int updateCnt1 = dao.updateApprove(map);
		map.put("state", "반려");
		int updateCnt2 = dao.updatePayment(map);
		if(updateCnt1!=0&&updateCnt2!=0) {
			cnt = 1;
		}
		
		model.addAttribute("cnt", cnt);
	}
	
	//합의팝업
	@Override
	public void P_payAgree(HttpServletRequest req, Model model) {
		String num_s = req.getParameter("num");
		int num = Integer.parseInt(num_s);
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		
		model.addAttribute("num", num);
		model.addAttribute("id", id);
	}

	@Override // 합의진행
	public void P_payAgree_pro(HttpServletRequest req, Model model) {
		String num_s = req.getParameter("num");
		int num = Integer.parseInt(num_s);
		String id = req.getParameter("id");
		String content = req.getParameter("content");
		int cnt = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("id", id);
		map.put("content", content);
		map.put("result", "합의완료");
		cnt = dao.updateApprove(map);
		
		model.addAttribute("cnt", cnt);
	}
	
	@Override
	public void P_SearchPaymentTool(HttpServletRequest req, Model model) {
		String sel_Payment = req.getParameter("sel_Payment");
		String searchUserName = req.getParameter("searchUserName");
		String toggleSearchType = req.getParameter("toggleSearchType");
		String searchApprTitle = req.getParameter("searchApprTitle");
		String searchStartDate = req.getParameter("searchStartDate");
		Date start = null;
		Date end = null;
		if(searchStartDate.length() != 0) {
			start = Date.valueOf(searchStartDate);
		}
		String searchEndDate = req.getParameter("searchEndDate");
		if(searchEndDate.length() != 0) {
			end = Date.valueOf(searchEndDate);
		}
		String retire_s = "";
		if(req.getParameter("retire") != null) {
			retire_s = req.getParameter("retire");
		}
		int retire = 0;
		if(retire_s.length() != 0) {
			retire = Integer.parseInt(retire_s);
		}
		
		model.addAttribute("sel", sel_Payment);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchUserName", searchUserName);
		map.put("toggleSearchType", toggleSearchType);
		map.put("searchApprTitle", searchApprTitle);
		map.put("searchStartDate", start);
		map.put("searchEndDate", end);
		map.put("retire", retire);
		
		req.getSession().setAttribute("searchMap", map);
	}

	@Override //결재진행함
	public void P_listApprCompleteView(HttpServletRequest req, Model model) {
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		
		int pageSize = 10; 		// 한페이지당 출력할 글 갯수
		int pageBlock = 5;		// 한 블럭당 페이지 갯수
		
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
		
		int search = 0;
		if(req.getParameter("search") != null) {
			search = Integer.parseInt(req.getParameter("search"));
		}
		if(search == 0) {
			req.getSession().removeAttribute("searchMap");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchUserName", null);
		map.put("toggleSearchType", null);
		map.put("searchApprTitle", null);
		map.put("searchStartDate", null);
		map.put("searchEndDate", null);
		
		if(req.getSession().getAttribute("searchMap") != null) {
			map = (Map<String, Object>)req.getSession().getAttribute("searchMap");
			req.getSession().removeAttribute("searchMap");
		}
		
		map.put("id", id);
		map.put("agree", 1);
		map.put("state", "진행");
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
	}

	@Override //완료문서함
	public void P_readApprAllListView(HttpServletRequest req, Model model) {
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		
		int pageSize = 10; 		// 한페이지당 출력할 글 갯수
		int pageBlock = 5;		// 한 블럭당 페이지 갯수
		
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
		
		int search = 0;
		if(req.getParameter("search") != null) {
			search = Integer.parseInt(req.getParameter("search"));
		}
		if(search == 0) {
			req.getSession().removeAttribute("searchMap");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchUserName", null);
		map.put("toggleSearchType", null);
		map.put("searchApprTitle", null);
		map.put("searchStartDate", null);
		map.put("searchEndDate", null);
		
		if(req.getSession().getAttribute("searchMap") != null) {
			map = (Map<String, Object>)req.getSession().getAttribute("searchMap");
			req.getSession().removeAttribute("searchMap");
		}
		
		map.put("id", id);
		map.put("refer", 0);
		map.put("state", "완료");
		cnt = dao.getPaymentCnt3(map);
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			List<PaymentVO> payment = new ArrayList<PaymentVO>();
			payment = dao.getPaymentList3(map); 
			
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
	}

	@Override
	public void P_listApprRejectView(HttpServletRequest req, Model model) {
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		
		int pageSize = 10; 		// 한페이지당 출력할 글 갯수
		int pageBlock = 5;		// 한 블럭당 페이지 갯수
		
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
		
		int search = 0;
		if(req.getParameter("search") != null) {
			search = Integer.parseInt(req.getParameter("search"));
		}
		if(search == 0) {
			req.getSession().removeAttribute("searchMap");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchUserName", null);
		map.put("toggleSearchType", null);
		map.put("searchApprTitle", null);
		map.put("searchStartDate", null);
		map.put("searchEndDate", null);
		
		if(req.getSession().getAttribute("searchMap") != null) {
			map = (Map<String, Object>)req.getSession().getAttribute("searchMap");
			req.getSession().removeAttribute("searchMap");
		}
		map.put("id", id);
		map.put("state", "반려");
		cnt = dao.getPaymentCnt2(map);
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			List<PaymentVO> payment = new ArrayList<PaymentVO>();
			payment = dao.getPaymentList2(map);
			
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
	}

	@Override //참조/열람문서함
	public void P_listApprReferenceView(HttpServletRequest req, Model model) {
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		
		int pageSize = 10; 		// 한페이지당 출력할 글 갯수
		int pageBlock = 5;		// 한 블럭당 페이지 갯수
		
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
		
		int search = 0;
		if(req.getParameter("search") != null) {
			search = Integer.parseInt(req.getParameter("search"));
		}
		if(search == 0) {
			req.getSession().removeAttribute("searchMap");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchUserName", null);
		map.put("toggleSearchType", null);
		map.put("searchApprTitle", null);
		map.put("searchStartDate", null);
		map.put("searchEndDate", null);
		
		if(req.getSession().getAttribute("searchMap") != null) {
			map = (Map<String, Object>)req.getSession().getAttribute("searchMap");
			req.getSession().removeAttribute("searchMap");
		}
		map.put("id", id);
		map.put("refer", 1);
		map.put("state", "완료");
		cnt = dao.getPaymentCnt3(map);
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			List<PaymentVO> payment = new ArrayList<PaymentVO>();
			payment = dao.getPaymentList3(map); 
			
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
	}

	// 결재요청함
	@Override
	public void P_listApprMyRequestView(HttpServletRequest req, Model model) {
		String id = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		
		int pageSize = 10; 		// 한페이지당 출력할 글 갯수
		int pageBlock = 5;		// 한 블럭당 페이지 갯수
		
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
		
		int search = 0;
		if(req.getParameter("search") != null) {
			search = Integer.parseInt(req.getParameter("search"));
		}
		if(search == 0) {
			req.getSession().removeAttribute("searchMap");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchUserName", null);
		map.put("toggleSearchType", null);
		map.put("searchApprTitle", null);
		map.put("searchStartDate", null);
		map.put("searchEndDate", null);
		
		if(req.getSession().getAttribute("searchMap") != null) {
			map = (Map<String, Object>)req.getSession().getAttribute("searchMap");
			req.getSession().removeAttribute("searchMap");
		}
		
		map.put("id", id);
		map.put("state", "진행");
		cnt = dao.getPaymentCnt4(map);
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			List<PaymentVO> payment = new ArrayList<PaymentVO>();
			payment = dao.getPaymentList4(map); 
			
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
	}

	//결재문서관리
	@Override
	public void P_managePayment(HttpServletRequest req, Model model) {
		int company = ((MemberVO)req.getSession().getAttribute("loginInfo")).getCompany();
		int search = 0;
		if(req.getParameter("search") != null) {
			search = Integer.parseInt(req.getParameter("search"));
		}
		
		int pageSize = 10; 		// 한페이지당 출력할 글 갯수
		int pageBlock = 5;		// 한 블럭당 페이지 갯수
		
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
		
		if(search == 0) {
			req.getSession().removeAttribute("searchMap");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchUserName", null);
		map.put("toggleSearchType", null);
		map.put("searchApprTitle", null);
		map.put("searchStartDate", null);
		map.put("searchEndDate", null);
		map.put("retire", 0);
		
		if(req.getSession().getAttribute("searchMap") != null) {
			map = (Map<String, Object>)req.getSession().getAttribute("searchMap");
		}
		map.put("company", company);
		cnt = dao.getPaymentCnt5(map);
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			List<PaymentVO> payment = new ArrayList<PaymentVO>();
			payment = dao.getPaymentList5(map); 
			
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
	}
	
}
