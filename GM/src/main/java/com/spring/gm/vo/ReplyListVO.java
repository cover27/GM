package com.spring.gm.vo;

import java.sql.Timestamp;

public class ReplyListVO {
	
	private int replenum;
	private int boardnum;
	private String content;
	private String writer;
	private int reref;
	private int reref_step;
	private int reref_level;
	private Timestamp reg_date;
	private int del;
	
	
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getReplenum() {
		return replenum;
	}
	public void setReplenum(int replenum) {
		this.replenum = replenum;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getReref() {
		return reref;
	}
	public void setReref(int reref) {
		this.reref = reref;
	}
	public int getReref_step() {
		return reref_step;
	}
	public void setReref_step(int reref_stap) {
		this.reref_step = reref_stap;
	}
	public int getReref_level() {
		return reref_level;
	}
	public void setReref_level(int reref_level) {
		this.reref_level = reref_level;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	@Override
	public String toString() {
		return "ReplyListVO [replenum=" + replenum + ", boardnum=" + boardnum + ", content=" + content + ", writer="
				+ writer + ", reref=" + reref + ", reref_step=" + reref_step + ", reref_level=" + reref_level
				+ ", reg_date=" + reg_date + ", del=" + del + "]";
	}
	


	
	
}