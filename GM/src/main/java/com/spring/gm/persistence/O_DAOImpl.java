package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.B_ManageInfoVO;
import com.spring.gm.vo.B_ManageVO;
import com.spring.gm.vo.Join_payVO;
import com.spring.gm.vo.PaymentVO;
import com.spring.gm.vo.ScheduleVO;
import com.spring.gm.vo.TodoListVO;


@Repository
public class O_DAOImpl implements O_DAO {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	O_DAO dao;
	
	//전자결재 - 기안문 생성 - 부서조인
	@Override
	public Join_payVO createAppDocForm(String id) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.createAppDocForm(id);
	}
	//전자결재 - 기안문 생성 - 회사조인
	@Override
	public Join_payVO createAppDocForm2(String id) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.createAppDocForm2(id);
	}

	//전자결재 - 기안문 - 결재선 select 조인
	@Override
	public List<Join_payVO> selectApprLine() {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.selectApprLine();
	}
	//전자결재 - 기안문 - 결재선  회사에 그룹등급이 1인 부서명
	@Override
	public List<String> getGroupName(int company) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.getGroupName(company);
	}
	
	//일정 - 페이지넘
	/*
	 * @Override public int getCalendarCnt() { dao =
	 * sqlSession.getMapper(O_DAO.class); return dao.getCalendarCnt(); }
	 */
	
	@Override
	public int getCalendarCnt() {
		return sqlSession.selectOne("com.spring.gm.persistence.O_DAO.getCalendarCnt");
	}
	
	@Override
	public List<ScheduleVO> getCalendarList(Map<String, Integer> map){
		List<ScheduleVO> dtos=null;
		dao = sqlSession.getMapper(O_DAO.class);
		dtos= dao.getCalendarList(map);
		return dtos;
	}
	//일정화면 조회
	@Override
	public List<ScheduleVO> selectCalendar(String id) {
		List<ScheduleVO> dtos=null;
		dao = sqlSession.getMapper(O_DAO.class);
		dtos=dao.selectCalendar(id);
		return dtos;
	}
	
	//일정등록 pro
	@Override
	public int insertCalendar(ScheduleVO vo) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.insertCalendar(vo);
	}
	
	//일정 상세 화면
	@Override
	public ScheduleVO modifyBeforeCalendar(Map<String, Object> map) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.modifyBeforeCalendar(map);
	}
	
	//일정 수정
	@Override
	public int updateCalendar(ScheduleVO vo) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.updateCalendar(vo);
	}
	
	//일정 삭제
	@Override
	public int deleteCalendar(int num) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.deleteCalendar(num);
	}
	
	//일정 메인 화면 view
	@Override
	public int calendarMainCnt(String id) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.calendarMainCnt(id);
	}
	@Override
	public List<ScheduleVO> calendarMainView(String id) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.calendarMainView(id);
	}
	
	//업무 등록 insert-pro
	@Override
	public int insertTodo(B_ManageVO vo) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.insertTodo(vo);
	}
	//업무 등록 insert-pro
	@Override
	public int insertTodoInfo(B_ManageInfoVO vo) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.insertTodoInfo(vo);
	}
	
	//내가 한 업무요청 게시글 갯수 조회
	@Override
	public int getOrderCnt(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.gm.persistence.O_DAO.getOrderCnt", map);
	}
	
	//내가 한 업무요청 게시글 목록 조회
	@Override
	public List<B_ManageVO> getOrderList(Map<String, Object> map) {
		List<B_ManageVO> dtos=null;
		dao = sqlSession.getMapper(O_DAO.class);
		dtos= dao.getOrderList(map);
		return dtos;
	}
	
	//내가 한 업무요청 상세조회
	@Override
	public List<B_ManageVO> readOrderList(int todonum) {
		List<B_ManageVO> dtos=null;
		dao = sqlSession.getMapper(O_DAO.class);
		dtos= dao.readOrderList(todonum);
		return dtos;
	}
	@Override
	public List<B_ManageInfoVO> readOrderListInfo(int todonum) {
		List<B_ManageInfoVO> dtos2=null;
		dao = sqlSession.getMapper(O_DAO.class);
		dtos2= dao.readOrderListInfo(todonum);
		return dtos2;
	}
	
	//업무관리 업무요청 수정 화면
	@Override
	public B_ManageVO udpateTaskView(int todonum) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.udpateTaskView(todonum);
	}
	
	//업무관리 업무요청 수정 pro
	@Override
	public int updateTaskPro(B_ManageVO vo) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.updateTaskPro(vo);
	}
	
	//업무관리 업무요청 삭제 pro
	@Override
	public int deleteTaskPro(int todonum) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.deleteTaskPro(todonum);
	}
	
	//수신업무요청 페이지넘
	@Override
	public int reciveListCnt(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.gm.persistence.O_DAO.reciveListCnt", map);
	}
	@Override
	public List<B_ManageVO> reciveList(Map<String, Object> map) {
		List<B_ManageVO> dtos=null;
		dao = sqlSession.getMapper(O_DAO.class);
		dtos= dao.reciveList(map);
		return dtos;
	}
	
	//업무요청 - 수신 업무 요청 상세 조회 처리 - pro
	@Override 
	public int updateRecive(B_ManageVO vo) { 
		dao = sqlSession.getMapper(O_DAO.class); 
		return dao.updateRecive(vo); 
	}
	@Override
	public int updateRecivePro(B_ManageInfoVO vo2) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.updateRecivePro(vo2);
	}
	
	//업무요청 - 업무 완료함 화면
	@Override
	public int completeListCnt(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.gm.persistence.O_DAO.completeListCnt", map);
	}
	@Override
	public List<B_ManageVO> completeList(Map<String, Object> map) {
		List<B_ManageVO> dtos=null;
		dao = sqlSession.getMapper(O_DAO.class);
		dtos= dao.completeList(map);
		return dtos;
	}
	
	//관리자 메뉴 - 업무 문서 관리
	@Override
	public int adminListCnt(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.gm.persistence.O_DAO.adminListCnt", map);
	}
	@Override
	public List<B_ManageVO> adminList(Map<String, Object> map) {
		List<B_ManageVO> dtos=null;
		dao = sqlSession.getMapper(O_DAO.class);
		dtos= dao.adminList(map);
		return dtos;
	}
	
	//TO-DO - 나의 할일 등록
	@Override
	public int insertTodoPro(TodoListVO vo) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.insertTodoPro(vo);
	}
	
	//TO-DO - 나의할일 등록한 뒤나오는 화면
	@Override
	public List<TodoListVO> selectTodo(String id) {
		List<TodoListVO> dtos=null;
		dao = sqlSession.getMapper(O_DAO.class);
		dtos= dao.selectTodo(id);
		return dtos;
	}
	
	//TO-DO - 나의 할일 삭제
	@Override
	public int deleteTodoPro(int num) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.deleteTodoPro(num);
	}
	
	//TO-DO - 나의 할일 완료
	@Override
	public int selectTodoPro(Map<String, Object> map) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.selectTodoPro(map);
	}
		
	@Override
	public int updateTodoPro(Map<String, Object> map) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.updateTodoPro(map);
	}
	
	@Override
	public int unUpdateTodoPro(Map<String, Object> map) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.unUpdateTodoPro(map);
	}

}
