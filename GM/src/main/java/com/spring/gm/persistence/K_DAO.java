package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import com.spring.gm.vo.AttendedSetVO;
import com.spring.gm.vo.CompaniesVO;
import com.spring.gm.vo.DayoffVO;
import com.spring.gm.vo.GradeVO;
import com.spring.gm.vo.GroupsVO;
import com.spring.gm.vo.MemberVO;

public interface K_DAO {

	public MemberVO memberInfo(String id);
	
	public List<CompaniesVO> findCompany();
	
	public List<CompaniesVO> searchCompany(String keyword);
	
	public int registAccount(MemberVO vo);
	
	public int registUsers(Map<String, String> map);
	
	public int registAuthorities(Map<String, String> map);
	
	public List<MemberVO> getWait(int company);
	
	public int getCompany(int depart);
	
	public int updateSysrank(Map<String, Object> map);
	
	public int updateAuthorities(Map<String, String> map);
	
	public List<MemberVO> getMembers(int company);
	
	public AttendedSetVO getAttendedSet(int company);
	
	public List<DayoffVO> getDayoffList(int company);
	
	public int getHoliday(int company);
	
	public int UpdateAttendedSet(AttendedSetVO att);
	
	public int UpdateHoliday(Map<String, Object> map);
	
	public int insertDayoff(Map<String, Object> map);
	
	public int deleteDayOff(int company);
	
	public List<GroupsVO> getGroups(int company);
	
	public List<GradeVO> getGrade(int company);
	
	public String getCompanyName(int company);
	
	public int updateAdminMemberInfo(Map<String, Object> map);
	
	public int retireMember(String id);
	
	public int retireUsers(String id);
}
