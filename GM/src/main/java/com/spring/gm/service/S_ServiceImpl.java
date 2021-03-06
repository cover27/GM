package com.spring.gm.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.gm.persistence.S_DAO;
import com.spring.gm.vo.MessageVO;
import com.spring.gm.vo.MemberVO;


@Service
public class S_ServiceImpl implements S_Service {
	
	@Autowired
	S_DAO dao;
	
	@Override
	public void messageList(HttpServletRequest req, Model model) {
		String receiver = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		int pageSize = 17; 		// 한페이지당 출력할 글 갯수
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
	
		// 게시판 갯수
		cnt = dao.getMessageArticleCnt(receiver);

		
		System.out.println("cnt(쪽지 갯수) : " + cnt);

		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	// 첫페이지를 1페이지로 지정
		}
		
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1
		
		start = (currentPage - 1) * pageSize + 1; 
		
		end = start + pageSize - 1;
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		if(end > cnt) end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize;  // 출력용 글번호
		
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		
		if(cnt > 0) {
			//게시판 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("receiver", receiver);
			
			List<MessageVO> dtos = dao.getMessageArticleList(map);
			

			model.addAttribute("m_dtos", dtos); // 큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글 1건

		}
		
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
	public void messageContent(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int message_num = Integer.parseInt((req.getParameter("message_num")));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		
		MessageVO vo = dao.content(num);
		
		if(message_num == 1) {
			dao.addReadCnt(num);
			dao.sendAddReadCnt(num);
		}else if (message_num == 2){
			
		}else if (message_num == 4) {
			dao.addReadCnt(num);
			dao.sendAddReadCnt(num);
		}

		model.addAttribute("ct_dto", vo);
		model.addAttribute("message_num", message_num);
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
	}		
	
	


	@Override
	public void sendMessagePro(HttpServletRequest req, Model model) {
		String sender = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		String receiver = req.getParameter("id");
		String subject = req.getParameter("subject");
		
		MessageVO vo = new MessageVO();
		vo.setMessage_num(1);
		vo.setSender(sender);
		vo.setReceiver(receiver);
		vo.setSubject(subject);
		vo.setContent(req.getParameter("content"));
		vo.setState(0);
		vo.setDel(0);
		vo.setSentDate(new Timestamp(System.currentTimeMillis()));
		vo.setReceiveDate(new Timestamp(System.currentTimeMillis()));
		vo.setReadCnt(0);
		
		int sendCnt = dao.sendMessage(vo);
		
		model.addAttribute("sendCnt", sendCnt);
		
	}
	
	@Override
	public void sendMessageData(HttpServletRequest req, Model model) {
		String sender = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		String receiver = req.getParameter("id");
		String subject = req.getParameter("subject");
		
		MessageVO vo = new MessageVO();
		vo.setMessage_num(2);
		vo.setSender(sender);
		vo.setReceiver(receiver);
		vo.setSubject(subject);
		vo.setContent(req.getParameter("content"));
		vo.setState(0);
		vo.setDel(0);
		vo.setSentDate(new Timestamp(System.currentTimeMillis()));
		vo.setReceiveDate(new Timestamp(System.currentTimeMillis()));
		vo.setReadCnt(0);
		
		int sendCnt = dao.sendMessage(vo);
		
		model.addAttribute("sendCnt", sendCnt);
		
	}

	
	@Override
	public void sendList(HttpServletRequest req, Model model) {
		String sendId = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		int pageSize = 17; 		// 한페이지당 출력할 글 갯수
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
	
		// 게시판 갯수
		cnt = dao.sendMessageArticleCnt(sendId);

		
		System.out.println("cnt(쪽지 갯수) : " + cnt);

		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1
		
		start = (currentPage - 1) * pageSize + 1; 
		
		end = start + pageSize - 1;
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		if(end > cnt) end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize;
		
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		
		if(cnt > 0) {
			//게시판 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("sendId", sendId);
			
			List<MessageVO> dtos = dao.sendMessageArticleList(map);
			
			System.out.println("리드씨엔티:"+ dtos.toString());

			model.addAttribute("s_dtos", dtos);

		}
		
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
	public void moveGarbage(HttpServletRequest req, Model model) {
		int moveCnt = 0;
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String [] message = req.getParameterValues("checkRow");
		
		if(message != null && message.length > 0) {
			for(int i=0; i<message.length; i++) {
				Map<String, Integer> map = new HashMap<String, Integer>();
					map.put("num", Integer.parseInt(message[i]));
					moveCnt = dao.garbage(map);
			}
		}
		
		model.addAttribute("moveCnt", moveCnt);
		model.addAttribute("pageNum", pageNum);
	}


	@Override
	public void garbageList(HttpServletRequest req, Model model) {
		String strId = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		int pageSize = 17; 		// 한페이지당 출력할 글 갯수
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
	
		// 게시판 갯수
		cnt = dao.getGarbageCnt(strId);

		
		System.out.println("cnt(쪽지 갯수) : " + cnt);

		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1
		
		start = (currentPage - 1) * pageSize + 1; 
		
		end = start + pageSize - 1;
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		if(end > cnt) end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize;
		
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		
		if(cnt > 0) {
			//게시판 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("strId", strId);
			
			List<MessageVO> dtos = dao.getGarbageList(map);
			

			model.addAttribute("g_dtos", dtos);

		}
		
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
	public void delGarbage(HttpServletRequest req, Model model) {
		int deleteCnt = 0;
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String [] message = req.getParameterValues("checkRow");
		
		if(message != null && message.length > 0) {
			for(int i=0; i<message.length; i++) {
				Map<String, Integer> map = new HashMap<String, Integer>();
					map.put("num", Integer.parseInt(message[i]));
					deleteCnt = dao.garbageAlldelete(map);
			}
		}
		
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("pageNum", pageNum);
	}


	@Override
	public void sendDeletePro(HttpServletRequest req, Model model) {
		int cancelCnt = 0;
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String [] sendMessage = req.getParameterValues("checkRow");
		
		if(sendMessage != null && sendMessage.length > 0) {
			for(int i=0; i<sendMessage.length; i++) {
				Map<String, Integer> map = new HashMap<String, Integer>();
					map.put("num", Integer.parseInt(sendMessage[i]));
					cancelCnt = dao.sendDelete(map);
			}
		}
		
		model.addAttribute("cancelCnt", cancelCnt);
		model.addAttribute("pageNum", pageNum);
	}
	
	public void sendDelPro(HttpServletRequest req, Model model) {
		int cancelCnt = 0;
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String [] sendMessage = req.getParameterValues("checkRow");
		
		if(sendMessage != null && sendMessage.length > 0) {
			for(int i=0; i<sendMessage.length; i++) {
				Map<String, Integer> map = new HashMap<String, Integer>();
					map.put("num", Integer.parseInt(sendMessage[i]));
					cancelCnt = dao.sendDel(map);
			}
		}
		
		model.addAttribute("cancelCnt", cancelCnt);
		model.addAttribute("pageNum", pageNum);
	}

	@Override
	public void contentDelete(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int message_num = Integer.parseInt(req.getParameter("message_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int deleteCnt = 0;
		
		MessageVO vo = new MessageVO();
		vo.setNum(num);
		
		deleteCnt = dao.deleteMessage(num);

		model.addAttribute("num", num);
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("message_num", message_num);		
		
	}

	@Override
	public void sendContentDelete(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int message_num = Integer.parseInt(req.getParameter("message_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int deleteCnt = 0;
		
		MessageVO vo = new MessageVO();
		vo.setNum(num);
		
		deleteCnt = dao.sendDeleteMessage(num);

		// 6단계. request나 session에 처리 결과를 저장(jsp에서 받아야 하니깐!)
		model.addAttribute("num", num);
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("message_num", message_num);		
		
	}
	
	@Override
	public void sendContentDel(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int message_num = Integer.parseInt(req.getParameter("message_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int deleteCnt = 0;
		
		MessageVO vo = new MessageVO();
		vo.setNum(num);
		
		deleteCnt = dao.sendDelMessage(num);

		// 6단계. request나 session에 처리 결과를 저장(jsp에서 받아야 하니깐!)
		model.addAttribute("num", num);
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("message_num", message_num);		
		
	}

	@Override
	public void garbageContentDelete(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int message_num = Integer.parseInt(req.getParameter("message_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int deleteCnt = 0;
		
		MessageVO vo = new MessageVO();
		vo.setNum(num);
		
		deleteCnt = dao.garbageContentDelete(num);

		// 6단계. request나 session에 처리 결과를 저장(jsp에서 받아야 하니깐!)
		model.addAttribute("num", num);
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("message_num", message_num);		
		
	}

	@Override
	public void messageListCnt(HttpServletRequest req, Model model) {
		String strId = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		int cnt = dao.notReadCnt(strId);
		
		model.addAttribute("messageCnt", cnt);
	}

	@Override
	public void orgSendMessageForm(HttpServletRequest req, Model model) {
		String strId = req.getParameter("id");
		
		MemberVO vo = dao.getMemberInfo(strId);
		
		model.addAttribute("vo",vo);
	}

	@Override
	public void orgsendMessagePro(HttpServletRequest req, Model model) {
		String sender = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		String receiver = req.getParameter("id");
		String subject = req.getParameter("subject");
		
		MessageVO vo = new MessageVO();
		vo.setMessage_num(1);
		vo.setSender(sender);
		vo.setReceiver(receiver);
		vo.setSubject(subject);
		vo.setContent(req.getParameter("content"));
		vo.setState(0);
		vo.setDel(0);
		vo.setSentDate(new Timestamp(System.currentTimeMillis()));
		vo.setReceiveDate(new Timestamp(System.currentTimeMillis()));
		vo.setReadCnt(0);
		
		int sendCnt = dao.sendMessage(vo);
		
		model.addAttribute("sendCnt", sendCnt);
	}

	@Override
	public void orgsendMessageDataPro(HttpServletRequest req, Model model) {
		String sender = ((MemberVO)req.getSession().getAttribute("loginInfo")).getId();
		String receiver = req.getParameter("id");
		String subject = req.getParameter("subject");
		
		MessageVO vo = new MessageVO();
		vo.setMessage_num(2);
		vo.setSender(sender);
		vo.setReceiver(receiver);
		vo.setSubject(subject);
		vo.setContent(req.getParameter("content"));
		vo.setState(0);
		vo.setDel(0);
		vo.setSentDate(new Timestamp(System.currentTimeMillis()));
		vo.setReceiveDate(new Timestamp(System.currentTimeMillis()));
		vo.setReadCnt(0);
		
		int sendCnt = dao.sendMessage(vo);
		
		model.addAttribute("sendCnt", sendCnt);
	}

	@Override
	public void restoreGarbageContent(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int message_num = Integer.parseInt(req.getParameter("message_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int restoreCnt = 0;
		
		MessageVO vo = new MessageVO();
		vo.setNum(num);
		
		restoreCnt = dao.restoreMessage(num);

		// 6단계. request나 session에 처리 결과를 저장(jsp에서 받아야 하니깐!)
		model.addAttribute("num", num);
		model.addAttribute("restoreCnt", restoreCnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("message_num", message_num);		

	}

	@Override
	public void restoreGarbage(HttpServletRequest req, Model model) {
		int restoreCnt = 0;
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String [] garbageMessage = req.getParameterValues("checkRow");
		
		if(garbageMessage != null && garbageMessage.length > 0) {
			for(int i=0; i<garbageMessage.length; i++) {
				Map<String, Integer> map = new HashMap<String, Integer>();
					map.put("num", Integer.parseInt(garbageMessage[i]));
					restoreCnt = dao.garbageRestore(map);
			}
		}
		
		model.addAttribute("restoreCnt", restoreCnt);
		model.addAttribute("pageNum", pageNum);
	}

}
