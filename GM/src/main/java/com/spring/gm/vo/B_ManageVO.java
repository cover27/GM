package com.spring.gm.vo;

import java.sql.Date;
import java.sql.Timestamp;

//업무관리 테이블
public class B_ManageVO {
   
	private int todonum; //업무관리번호
    private String id; //아이디(FK)
    private int groupId; //그룹번호(FK)
    private String b_name; //이름
    private String subject; //업무관리제목
    private String content; //업무관리내용
    private Date begin; //시작일
    private Date end; //종료일
    private Timestamp reg_date; //등록일
    private Timestamp reg_date2; //수정일
    private String state; //상태
    private int del; //삭제구분
    private String r_name; //직급이름
    private String name; //지시자 이름
    
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
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
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
	public Date getBegin() {
		return begin;
	}
	public void setBegin(Date begin) {
		this.begin = begin;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public Timestamp getReg_date2() {
		return reg_date2;
	}
	public void setReg_date2(Timestamp reg_date2) {
		this.reg_date2 = reg_date2;
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
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "B_ManageVO [todonum=" + todonum + ", id=" + id + ", groupId=" + groupId + ", b_name=" + b_name
				+ ", subject=" + subject + ", content=" + content + ", begin=" + begin + ", end=" + end + ", reg_date="
				+ reg_date + ", reg_date2=" + reg_date2 + ", state=" + state + ", del=" + del + ", r_name=" + r_name
				+ ", name=" + name + "]";
	}
    
    
}
