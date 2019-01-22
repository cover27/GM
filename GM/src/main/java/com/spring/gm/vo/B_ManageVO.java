package com.spring.gm.vo;

import java.sql.Timestamp;

//업무관리 테이블
public class B_ManageVO {
   
	private int todonum; //업무관리번호
    private String id; //아이디(FK)
    private int groupId; //그룹번호(FK)
    private String subject; //업무관리제목
    private String content; //업무관리내용
    private Timestamp begin; //시작일
    private Timestamp end; //종료일
    private Timestamp reg_date; //등록일
    private String state; //상태
    private int del; //삭제구분
	
    
    public int getTodonum() {
		return todonum;
	}
	public void setTodonum(int todonum) {
		this.todonum = todonum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
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
	public Timestamp getBegin() {
		return begin;
	}
	public void setBegin(Timestamp begin) {
		this.begin = begin;
	}
	public Timestamp getEnd() {
		return end;
	}
	public void setEnd(Timestamp end) {
		this.end = end;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	
	
	@Override
	public String toString() {
		return "B_manage [todonum=" + todonum + ", id=" + id + ", groupId=" + groupId + ", subject=" + subject
				+ ", content=" + content + ", begin=" + begin + ", end=" + end + ", reg_date=" + reg_date + ", state="
				+ state + ", del=" + del + "]";
	}
    
    
}
