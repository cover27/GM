package com.spring.gm.vo;

//	메모 (폴더) 테이블
public class MemoVO {
	
	private int num;			//	메모장 번호
	private String id;			//	아이디 (FK)
	private String name;		//	메모장 이름
	private int m_rank;			//	메모장 등급
	private int del;			//	삭제구분
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getM_rank() {
		return m_rank;
	}
	public void setM_rank(int m_rank) {
		this.m_rank = m_rank;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	
	
	@Override
	public String toString() {
		return "MemoVO [num=" + num + ", id=" + id + ", name=" + name + ", m_rank=" + m_rank + ", del=" + del + "]";
	}
	

}
