package com.spring.gm.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.gm.vo.AddressMemberMainVO;
import com.spring.gm.vo.AttendedSetVO;
import com.spring.gm.vo.BoardListVO;
import com.spring.gm.vo.CompaniesMemberVO;
import com.spring.gm.vo.CompaniesVO;
import com.spring.gm.vo.DayoffVO;
import com.spring.gm.vo.GradeVO;
import com.spring.gm.vo.Grade_visibleVO;
import com.spring.gm.vo.GroupInfoVO;
import com.spring.gm.vo.GroupsVO;
import com.spring.gm.vo.MemberVO;
import com.spring.gm.vo.join_mgcVO2;
import com.spring.gm.vo.join_mgiVO;
import com.spring.gm.vo.join_mvrVO;

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
	
	public int updateAuthorities(Map<String, Object> map);
	
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
	
	public List<Grade_visibleVO> getGrades(int company);
	
	public int getGradeCnt(int rank);
	
	public int insertGrade(GradeVO vo);
	
	public int updateGrade(GradeVO vo);
	
	public int deleteGrade(int rank);
	
	public List<join_mgiVO> getMgiList3(int company);
	
	public int insertManager(String id);
	
	public int insertManager2(String id);
	
	public int deleteManager(String id);
	
	public int deleteManager2(String id);
	
	public List<join_mvrVO> getAppHoliday(int company);
	
	public int handleHoliday(Map<String, Object> map);
	
	public List<CompaniesVO> getComList();
	
	public List<CompaniesVO> getSearchComList(String search);
	
	public List<MemberVO> getAdminList(int company);
	
	public List<CompaniesMemberVO> getAppComList();
	
	public int handlecompany(Map<String, Object> map);
	
	public String getComInfoId(int company);
	
	public int getNoticeCnt();
	
	public List<BoardListVO> getNoticeList(Map<String, Object> map);
	
	public int insertNotice(Map<String, Object> map);
	
	public int addNoticeReadCnt(int num);
	
	public BoardListVO getNoticeContent(int num);
	
	public int updateNotice(Map<String, Object> map);
	
	public int deleteNotice(int num);
	
	public String getName(String id);
	
	public int sendMessage_pro(Map<String, Object> map);
	
	public BoardListVO getMainNotice();
	
	public int insertCompany(Map<String, Object> map);
	
	public int getnewCompany();
	
	public int createfav(Map<String, Object> map);
	
	public int favInfo(Map<String, Object> map);
	
	public int getCompanyNum(String id);
	
	public int insertAttendedSet(int company);
	
	public int insertBasicBoard(int company);
	
	public int insertBasicDayoff(Map<String, Object> map);
	
	public int insertBasicGrade(Map<String, Object> map);
	
	public int insertBasicGrade2(Map<String, Object> map);
	
	public int updateEmailAccount(String id);
	
	public List<MemberVO> findIds(Map<String, Object> map);
	
	public int findPw(Map<String, Object> map);
	
	public String getEmail(String id);
	
	public int updatePw(Map<String, Object> map);
	
	public int updateUsers(Map<String, Object> map);
	
	public List<AddressMemberMainVO> getAddressList(String strId);
}
