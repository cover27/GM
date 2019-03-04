package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import com.spring.gm.vo.B_ManageInfoVO;
import com.spring.gm.vo.B_ManageVO;
import com.spring.gm.vo.Join_payVO;
import com.spring.gm.vo.ScheduleVO;
import com.spring.gm.vo.TodoListVO;

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
	//일정 메인 화면 view
	public int calendarMainCnt(String id);
	public List<ScheduleVO> calendarMainView(String id);
	/* 일정 끝 */
	
	/* 업무 시작 */
	//업무등록 insert-pro
	public int insertTodo(B_ManageVO vo);
	public int insertTodoInfo(B_ManageInfoVO vo2);
	//내가 한 업무요청  페이지넘
	public int getOrderCnt(Map<String, Object> map); //게시글 갯수 구하기
	public List<B_ManageVO> getOrderList(Map<String, Object> map); //게시글 목록 조회
	//내가 한 업무요청 상세조회
	public List<B_ManageVO> readOrderList(int todonum);
	public List<B_ManageInfoVO> readOrderListInfo(int todonum);
	//업무관리 업무요청 수정 화면
	public B_ManageVO udpateTaskView(int todonum);
	//업무관리 업무요청 수정 pro
	public int updateTaskPro(B_ManageVO vo);
	//업무관리 업무요청 삭제 pro
	public int deleteTaskPro(int todonum);
	//수신업무요청 페이지넘
	public int reciveListCnt(Map<String, Object> map);//게시글 갯수 구하기
	public List<B_ManageVO> reciveList(Map<String, Object> map); //게시글 목록 조회
	//업무요청 - 수신 업무 요청 상세 조회 처리 - pro
	public int updateRecive(B_ManageVO vo);
	public int updateRecivePro(B_ManageInfoVO vo2);
	//업무요청 - 업무 완료함 화면
	public int completeListCnt(Map<String, Object> map);
	public List<B_ManageVO> completeList(Map<String, Object> map);
	//관리자 메뉴 - 업무 문서 관리
	public int adminListCnt(Map<String, Object> map);
	public List<B_ManageVO> adminList(Map<String, Object> map);
	//TO-DO - 나의 할일 화면 및 등록
	public int insertTodoPro(TodoListVO vo);
	//TO-DO - 나의할일 등록한 뒤나오는 화면
	public List<TodoListVO> selectTodo(String id);
	/* 업무 끝 */
	
	
}
