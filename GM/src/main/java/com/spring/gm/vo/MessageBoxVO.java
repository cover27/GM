package com.spring.gm.vo;

public class MessageBoxVO {
	private int massage_num;	// 쪽지함
	private String id;		// 아이디(FK)	
	private String name;	// 이름	
	private int rank;		// 쪽지등급	
	private int del;		// 삭제구분
	private int status;		// 메일 읽음/안읽음 표시
	
	public int getMassage_num() {
		return massage_num;
	}
	public void setMassage_num(int massage_num) {
		this.massage_num = massage_num;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
