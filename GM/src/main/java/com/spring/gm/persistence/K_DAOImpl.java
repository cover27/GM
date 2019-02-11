package com.spring.gm.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.AttendedSetVO;
import com.spring.gm.vo.CompaniesVO;
import com.spring.gm.vo.DayoffVO;
import com.spring.gm.vo.GradeVO;
import com.spring.gm.vo.GroupsVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.join_mgcVO;
import com.spring.gm.vo.join_mgcVO2;

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

	@Override
	public List<GroupsVO> getGroups(int company) {
		return sqlSession.selectList("com.spring.gm.persistence.K_DAO.getGroups", company);
	}

	@Override
	public List<GradeVO> getGrade(int company) {
		return sqlSession.selectList("com.spring.gm.persistence.K_DAO.getGrade", company);
	}

	@Override
	public String getCompanyName(int company) {
		return sqlSession.selectOne("com.spring.gm.persistence.K_DAO.getCompanyName", company);
	}

	@Override
	public int updateAdminMemberInfo(Map<String, Object> map) {
		return sqlSession.update("com.spring.gm.persistence.K_DAO.updateAdminMemberInfo", map);
	}

	@Override
	public int retireMember(String id) {
		return sqlSession.update("com.spring.gm.persistence.K_DAO.retireMember", id);
	}

	@Override
	public int retireUsers(String id) {
		return sqlSession.update("com.spring.gm.persistence.K_DAO.retireUsers", id);
	}
	
	@Override
	public int selectCnt(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.gm.persistence.K_DAO.selectCnt", map);
	}
	
	//급여 회원정보 가져오기(부서번호가 회사명)
	@Override
	public ArrayList<join_mgcVO2> selectList2(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		K_DAO dao = sqlSession.getMapper(K_DAO.class);
		dtos = dao.selectList2(map);
		return dtos;
	}
	//급여 회원정보 가져오기(부서번호가 부서명)
	@Override
	public ArrayList<join_mgcVO2> selectList3(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		K_DAO dao = sqlSession.getMapper(K_DAO.class);
		dtos = dao.selectList3(map);
		return dtos;
	}

	@Override
	public int search_salaryCnt(Map<String, Object> map) {
		String search_title = (String) map.get("search_title");
		int selectCnt = 0;
		if (search_title.equals("name")) {
			selectCnt = sqlSession.selectOne("com.spring.gm.persistence.K_DAO.search_salaryCnt", map);
			if (selectCnt != 0) {
				selectCnt = 1;
				return selectCnt;
			}
		} else if (search_title.equals("depart")) {
			selectCnt = sqlSession.selectOne("com.spring.gm.persistence.K_DAO.search_salaryCnt2", map);
			if (selectCnt != 0) {
				selectCnt = 1;
				return selectCnt;
			}
		} else if (search_title.equals("id")) {
			selectCnt = sqlSession.selectOne("com.spring.gm.persistence.K_DAO.search_salaryCnt3", map);
			if (selectCnt != 0) {
				selectCnt = 1;
				return selectCnt;
			}
		}
		return selectCnt;
	}

	@Override
	public ArrayList<join_mgcVO2> searchinfoList(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = new ArrayList<join_mgcVO2>();
		K_DAO dao = sqlSession.getMapper(K_DAO.class);
		String search_title = (String) map.get("search_title");
		
		if (search_title.equals("name")) {	//이름 검색
			// 5-2. 게시글 목록 조회
			List<join_mgcVO2> dtos1 = dao.searchinfoList(map);	// depart가 회사번호
			System.out.println(dtos1.toString());
			List<join_mgcVO2> dtos3 = dao.searchinfoList3(map);	//depart가 부서번호
			System.out.println(dtos3.toString());
			dtos.addAll(dtos1);
			dtos.addAll(dtos3);
			System.out.println(dtos.toString());
		} else if (search_title.equals("depart")) {	//부서 검색
			System.out.println("depart 탔다");
			dtos = dao.searchinfoList2(map);
			System.out.println("depart 탔다");
		} else if (search_title.equals("id")) {	// 사원아이디 검색
			List<join_mgcVO2> dtos4 = dao.searchinfoList4(map);	// depart가 회사번호
			System.out.println("여기 탔다2");
			System.out.println(dtos4.toString());
			List<join_mgcVO2> dtos5 = dao.searchinfoList5(map);	//depart가 부서번호
			System.out.println("여기 탔다3");
			System.out.println(dtos5.toString());
			dtos.addAll(dtos4);
			dtos.addAll(dtos5);
			System.out.println(dtos.toString());
		}
		return dtos;
	}

	@Override
	public ArrayList<join_mgcVO2> searchinfoList2(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		K_DAO dao = sqlSession.getMapper(K_DAO.class);
		dtos = dao.searchinfoList2(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> searchinfoList3(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		K_DAO dao = sqlSession.getMapper(K_DAO.class);
		dtos = dao.searchinfoList3(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> searchinfoList4(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		K_DAO dao = sqlSession.getMapper(K_DAO.class);
		dtos = dao.searchinfoList4(map);
		return dtos;
	}
	@Override
	public ArrayList<join_mgcVO2> searchinfoList5(Map<String, Object> map) {
		ArrayList<join_mgcVO2> dtos = null;
		K_DAO dao = sqlSession.getMapper(K_DAO.class);
		dtos = dao.searchinfoList5(map);
		return dtos;
	}
	
}
