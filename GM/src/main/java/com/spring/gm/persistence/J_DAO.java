package com.spring.gm.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.gm.vo.MemberVO;
public interface J_DAO {

	public int selectCnt();
	
	public ArrayList<MemberVO> selectList(Map<String, Object> map);
	
}
