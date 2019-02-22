package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import com.spring.gm.vo.B_ManageVO;
import com.spring.gm.vo.Join_payVO;
import com.spring.gm.vo.ScheduleVO;

public interface O_DAO {
	
	//전자결재 - 기안문 생성
	public Join_payVO createAppDocForm(String id); // 부서 조인
	public Join_payVO createAppDocForm2(String id); // 회사 조인
	
	//전자결재 - 기안문 - 결재선
	public List<Join_payVO> selectApprLine(); //결재선 조회 조인문
	public List<String> getGroupName(int company);//결재선 부서명
	
	/* 일정 시작 */
	//일정화면 조회
	public List<ScheduleVO> selectCalendar(String id);
	//일정 - 페이지넘
	public int getCalendarCnt();	//게시글 갯수 구하기
	public List<ScheduleVO> getCalendarList(Map<String, Integer> map);	//게시글 목록 조회
	//일정등록 pro
	public int insertCalendar(ScheduleVO vo);
	//일정 상세 화면
	public ScheduleVO modifyBeforeCalendar(Map<String, Object> map);
	//일정 수정
	public int updateCalendar(ScheduleVO vo);
	//일정 삭제
	public int deleteCalendar(int num);
	/* 일정 끝 */
	
	/* 업무 시작 */
	//업무등록 insert-pro
	public int insertTodo(B_ManageVO vo);
	//내가 한 업무요청  페이지넘
	public int getOrderCnt(); //게시글 갯수 구하기
	public List<B_ManageVO>getOrderList(Map<String, Integer> map); //게시글 목록 조회
	/* 업무 끝 */
	
	
}
