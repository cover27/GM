package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.gm.vo.AddressMemVO;
import com.spring.gm.vo.GroupsVO;
import com.spring.gm.vo.MemberVO;

@Repository
public class E_DAOImpl implements E_DAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getCompanyMemberCnt(int company) {
		E_DAO dao = sqlSession.getMapper(E_DAO.class);
		return dao.getCompanyMemberCnt(company);
	}

	@Override
	public List<MemberVO> getCompanyMemberList(Map<String, Object> map) {
		E_DAO dao = sqlSession.getMapper(E_DAO.class);
		return dao.getCompanyMemberList(map);
	}


	@Override
	public List<GroupsVO> getCompanyList(Map<String, Object> map) {
		E_DAO dao = sqlSession.getMapper(E_DAO.class);
		return dao.getCompanyList(map);
	}
	
	@Override
	public int getDepartMemberCnt(int depart) {
		E_DAO dao = sqlSession.getMapper(E_DAO.class);
		return dao.getDepartMemberCnt(depart);
	}

	@Override
	public List<GroupsVO> getDepartMemberList(Map<String, Object> map) {
		E_DAO dao = sqlSession.getMapper(E_DAO.class);
		return dao.getDepartMemberList(map);
	}
	
	@Override
	public int getMyFavoriteMemberCnt(String strId) {
		E_DAO dao = sqlSession.getMapper(E_DAO.class);
		return dao.getMyFavoriteMemberCnt(strId);
	}

	@Override
	public List<AddressMemVO> getMyFavoriteMemberList(Map<String, Object> map) {
		E_DAO dao = sqlSession.getMapper(E_DAO.class);
		return dao.getMyFavoriteMemberList(map);
	}

	@Override
	public MemberVO content(String strId) {
		E_DAO dao = sqlSession.getMapper(E_DAO.class);
		return dao.content(strId);
	}

	@Override
	public int addMember(AddressMemVO vo) {
		E_DAO dao = sqlSession.getMapper(E_DAO.class);
		return dao.addMember(vo);
	}
	
	@Override
	public int addMembers(AddressMemVO vo) {
		E_DAO dao = sqlSession.getMapper(E_DAO.class);
		return dao.addMembers(vo);
	}

	@Override
	public int deleteMember(AddressMemVO vo) {
		E_DAO dao = sqlSession.getMapper(E_DAO.class);
		return dao.deleteMember(vo);
	}

	@Override
	public int idCheck(Map<String, Object> map) {
		E_DAO dao = sqlSession.getMapper(E_DAO.class);
		return dao.idCheck(map);
	}



}
