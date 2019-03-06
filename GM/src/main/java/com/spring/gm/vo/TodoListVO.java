package com.spring.gm.vo;

public class TodoListVO {

	private int num; //할일 번호
	private String content; //할일 내역
	private String id; //아이디
	private int complate; //완료여부
	private int del; //삭제구분

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getComplate() {
		return complate;
	}
	public void setComplate(int complate) {
		this.complate = complate;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "TodoListVO [num=" + num + ", content=" + content + ", id=" + id + ", complate=" + complate + ", del=" + del + "]";
	}
	
}
