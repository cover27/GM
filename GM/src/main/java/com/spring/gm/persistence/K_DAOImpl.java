package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.AttendedSetVO;
import com.spring.gm.vo.CompaniesVO;
import com.spring.gm.vo.DayoffVO;
import com.spring.gm.vo.MemberVO;

@Repository
public class K_DAOImpl implements K_DAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public MemberVO memberInfo(String id) {
		return sqlSession.selectOne("com.spring.gm.persistence.K_DAO.memberInfo", id);
	}
	
	@Override
	public List<CompaniesVO> findCompany() {
		return sqlSession.selectList("com.spring.gm.persistence.K_DAO.findCompany");
	}
	
	@Override
	public List<CompaniesVO> searchCompany(String keyword) {
		return sqlSession.selectList("com.spring.gm.persistence.K_DAO.searchCompany", keyword);
	}

	@Override
	public int registAccount(MemberVO vo) {
		return sqlSession.insert("com.spring.gm.persistence.K_DAO.registAccount", vo);
	}

	@Override
	public int registUsers(Map<String, String> map) {
		return sqlSession.insert("com.spring.gm.persistence.K_DAO.registUsers", map);
	}

	@Override
	public int registAuthorities(Map<String, String> map) {
		return sqlSession.insert("com.spring.gm.persistence.K_DAO.registAuthorities", map);
	}

	@Override
	public List<MemberVO> getWait(int company) {
		return sqlSession.selectList("com.spring.gm.persistence.K_DAO.getWait", company);
	}

	@Override
	public int getCompany(int depart) { //그룹을 넣으면 사업장을 찾아주는 메소드
		return sqlSession.selectOne("com.spring.gm.persistence.K_DAO.getCompany", depart);
	}

	@Override
	public int updateSysrank(Map<String, Object> map) {
		return sqlSession.update("com.spring.gm.persistence.K_DAO.updateSysrank", map);
	}

	@Override
	public int updateAuthorities(Map<String, String> map) {
		return sqlSession.update("com.spring.gm.persistence.K_DAO.updateAuthorities", map);
	}

	@Override
	public List<MemberVO> getMembers(int company) {
		return sqlSession.selectList("com.spring.gm.persistence.K_DAO.getMembers", company);
	}

	@Override
	public AttendedSetVO getAttendedSet(int company) {
		return sqlSession.selectOne("com.spring.gm.persistence.K_DAO.getAttendedSet", company);
	}

	@Override
	public List<DayoffVO> getDayoffList(int company) {
		return sqlSession.selectList("com.spring.gm.persistence.K_DAO.getDayoffList", company);
	}
	
	@Override
	public int getHoliday(int company) {
		return sqlSession.selectOne("com.spring.gm.persistence.K_DAO.getHoliday", company);
	}

	@Override
	public int UpdateAttendedSet(AttendedSetVO att) {
		return sqlSession.update("com.spring.gm.persistence.K_DAO.UpdateAttendedSet", att);
	}

	@Override
	public int UpdateHoliday(Map<String, Object> map) {
		return sqlSession.update("com.spring.gm.persistence.K_DAO.UpdateHoliday", map);
	}

	@Override
	public int insertDayoff(Map<String, Object> map) {
		return sqlSession.insert("com.spring.gm.persistence.K_DAO.insertDayoff", map);
	}

	@Override
	public int deleteDayOff(int company) {
		return sqlSession.delete("com.spring.gm.persistence.K_DAO.deleteDayOff", company);
	}
	
	
}
