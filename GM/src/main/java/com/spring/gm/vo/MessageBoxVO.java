package com.spring.gm.vo;

public class MessageBoxVO {
	private int message_num;	// 쪽지함
	private String id;		// 아이디(FK)	
	private String name;	// 이름	
	private int del;		// 삭제구분
	
	public int getMessage_num() {
		return message_num;
	}
	public void setMessage_num(int message_num) {
		this.message_num = message_num;
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
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
}
