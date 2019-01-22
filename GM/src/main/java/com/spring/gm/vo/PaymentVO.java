package com.spring.gm.vo;

import java.sql.Timestamp;

//전자결제 테이블
public class PaymentVO {

	private int num; //전자결제번호
	private String id; //아이디(FK)
	private String subject; //제목
	private String content; //내용
	private String state; //상태
    private Timestamp reg_date; //등록일
    private Timestamp deadline; //만료일
    private int del; //삭제구분
	
    
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public Timestamp getDeadline() {
		return deadline;
	}
	public void setDeadline(Timestamp deadline) {
		this.deadline = deadline;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "PaymentVO [num=" + num + ", id=" + id + ", subject=" + subject + ", content=" + content + ", state="
				+ state + ", reg_date=" + reg_date + ", deadline=" + deadline + ", del=" + del + "]";
	}
    
    
}
