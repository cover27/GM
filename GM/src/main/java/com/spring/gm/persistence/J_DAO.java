package com.spring.gm.persistence;

import java.util.ArrayList;
import java.util.Map;

import com.spring.gm.vo.MemberVO;
public interface J_DAO {
	//급여 회원정보 확인
	public int selectCnt();
	//급여 회원정보 가져오기
	public ArrayList<MemberVO> selectList(Map<String, Object> map);
	//급여 개인회원정보 가져오기
	public ArrayList<MemberVO> infoList(String id);

}
