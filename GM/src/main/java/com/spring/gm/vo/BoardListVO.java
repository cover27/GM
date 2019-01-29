package com.spring.gm.vo;

import java.sql.Timestamp;

//게시판 목록 테이블
public class BoardListVO {
    private int boardnum; //게시글번호
    private int num; //게시판번호(FK)
    private String writer; //아이디(FK)
    private String subject; //게시글제목
    private String content; //게시글내용
    private int readcnt; //조회수
    private int re_num; //댓글수
    private int ref; //ref
    private int ref_step; //ref_step
    private int ref_level; //ref_level
    private Timestamp reg_date; //작성일시
    private int del; //삭제구분
	
    
    public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRef_step() {
		return ref_step;
	}
	public void setRef_step(int ref_step) {
		this.ref_step = ref_step;
	}
	public int getRef_level() {
		return ref_level;
	}
	public void setRef_level(int ref_level) {
		this.ref_level = ref_level;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
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
		return "BoardListVO [boardnum=" + boardnum + ", num=" + num + ", writer=" + writer + ", subject=" + subject
				+ ", content=" + content + ", readcnt=" + readcnt + ", re_num=" + re_num + ", ref=" + ref
				+ ", ref_step=" + ref_step + ", ref_level=" + ref_level + ", reg_date=" + reg_date + ", del=" + del
				+ "]";
	}
    
    
}
