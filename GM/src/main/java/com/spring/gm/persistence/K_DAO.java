package com.spring.gm.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.gm.vo.AttendedSetVO;
import com.spring.gm.vo.CompaniesVO;
import com.spring.gm.vo.DayoffVO;
import com.spring.gm.vo.GradeVO;
import com.spring.gm.vo.GroupInfoVO;
import com.spring.gm.vo.GroupsVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.join_mgcVO2;
import com.spring.gm.vo.join_mgiVO;

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
	
	public GroupInfoVO getGroupInfo(Map<String, Object> map);
	
	public int deleteGroupInfo(Map<String, Object> map);
	
	public int insertGroupInfo(Map<String, Object> map);
	
	public int updateAdminMemberInfo(Map<String, Object> map);
	
	public int retireMember(String id);
	
	public int retireUsers(String id);
	
	public int selectCnt(Map<String, Object> map);
	
	public ArrayList<join_mgcVO2> selectList2(Map<String, Object> map);
	
	public ArrayList<join_mgcVO2> selectList3(Map<String, Object> map);
	
	public int search_salaryCnt(Map<String, Object> map);
	
	public ArrayList<join_mgcVO2> searchinfoList(Map<String, Object> map);
	
	public ArrayList<join_mgcVO2> searchinfoList2(Map<String, Object> map);
	
	public ArrayList<join_mgcVO2> searchinfoList3(Map<String, Object> map);
	
	public ArrayList<join_mgcVO2> searchinfoList4(Map<String, Object> map);
	
	public ArrayList<join_mgcVO2> searchinfoList5(Map<String, Object> map);
	
	public List<MemberVO> getMemberList(Map<String, Object> map);
	
	public int updateRestoMember(Map<String, Object> map);
	
	public int updateRestoUsers(String id);
	
	public int selectCnt_name(Map<String, Object> map);
	
	public List<MemberVO> getMemberList_name(Map<String, Object> map);
	
	public List<join_mgiVO> getMgiList(Map<String, Object> map);
	
	public List<join_mgiVO> getMgiList2(int company);
	
	public int createDepart(Map<String, Object> map);
	
	public String getDepartName(int depart);
	
	public int updateDepartName(Map<String, Object> map);
	
	public int countDepartMember(int depart);
	
	public int deleteDepart(int depart);
	
	public int changeleader1(int depart);
	
	public int changeleader2(Map<String, Object> map);
}
