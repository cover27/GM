package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.B_ManageVO;
import com.spring.gm.vo.Join_payVO;
import com.spring.gm.vo.PaymentVO;
import com.spring.gm.vo.ScheduleVO;


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
	
	//업무 등록 insert-pro
	@Override
	public int insertTodo(B_ManageVO vo) {
		dao = sqlSession.getMapper(O_DAO.class);
		return dao.insertTodo(vo);
	}
	
	//내가 한 업무요청 게시글 갯수 조회
	@Override
	public int getOrderCnt() {
		return sqlSession.selectOne("com.spring.gm.persistence.O_DAO.getOrderCnt");
	}
	
	//내가 한 업무요청 게시글 목록 조회
	@Override
	public List<B_ManageVO> getOrderList(Map<String, Integer> map) {
		List<B_ManageVO> dtos=null;
		dao = sqlSession.getMapper(O_DAO.class);
		dtos= dao.getOrderList(map);
		return dtos;
	}

	
	

}
