package com.spring.gm.vo;

import java.sql.Date;
import java.sql.Timestamp;

//업무관리 상세 테이블
public class B_ManageInfoVO {

	private int donum; //업무관리내용번호
	private int todonum; //업무관리번호(FK)
	private String id; //아이디(FK)
    private int progress; //진척율
    private String content; //업무내용
    private Date reg_date; //최종수정일
    private int del; //삭제구분
	public int getDonum() {
		return donum;
	}
	public void setDonum(int donum) {
		this.donum = donum;
	}
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
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	@Override
	public String toString() {
		return "B_ManageInfoVO [donum=" + donum + ", todonum=" + todonum + ", id=" + id + ", progress=" + progress
				+ ", content=" + content + ", reg_date=" + reg_date + ", del=" + del + "]";
	}
    
    
}
