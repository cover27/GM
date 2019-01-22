package com.spring.gm.vo;

//첨부파일 테이블
public class AttachVO {

	private int num; //첨부파일번호
	private int contentnum; //글번호
	private String title; //첨부파일명
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getContentnum() {
		return contentnum;
	}
	public void setContentnum(int contentnum) {
		this.contentnum = contentnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	@Override
	public String toString() {
		return "AttachVO [num=" + num + ", contentnum=" + contentnum + ", title=" + title + "]";
	}
	
	
}
