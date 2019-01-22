package com.spring.gm.vo;


//	쪽지함 테이블
public class NotiesVO {
	
	private int mess_num;			// 쪽지함 번호
	private String id;				// 아이디 (FK)
	private String name;			// 이름
	private int rank;				// 쪽지 등급
	private int del;				// 삭제 구분
	
	
	public int getMess_num() {
		return mess_num;
	}
	public void setMess_num(int mess_num) {
		this.mess_num = mess_num;
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
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	
	
	@Override
	public String toString() {
		return "NotiesVO [mess_num=" + mess_num + ", id=" + id + ", name=" + name + ", rank=" + rank + ", del=" + del
				+ "]";
	}
	

}
