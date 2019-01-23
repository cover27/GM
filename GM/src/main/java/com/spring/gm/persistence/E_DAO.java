package com.spring.gm.persistence;

import java.util.List;
import java.util.Map;

import com.spring.gm.vo.MemoVO;

public interface E_DAO {

	// 메모 갯수
	public int getMemoCnt();

	// 메모 목록 조회 -- 복수개라서 ArrayList 사용
	public List<MemoVO> getMemoList(Map<String, Integer> map);

	

}
