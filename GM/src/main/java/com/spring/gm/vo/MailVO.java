package com.spring.gm.vo;

public class MailVO {
	private int mail_num;	// 메일함번호	
	private String id;		// 아이디(FK)	
	private String name;	// 이름	
	private int rank;		// 쪽지등급	
	private int del;		// 삭제구분
	private int status;		// 메일 읽음/안읽음 표시
	
	public int getMail_num() {
		return mail_num;
	}
	public void setMail_num(int mail_num) {
		this.mail_num = mail_num;
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
