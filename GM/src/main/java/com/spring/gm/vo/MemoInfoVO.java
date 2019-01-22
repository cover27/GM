package com.spring.gm.vo;

//	메모 내용 테이블
public class MemoInfoVO {
	
	private int memonum;			// 메모 번호
	private int num;				// 메모장 번호(FK)
	private String subject;			// 메모 제목
	private String content;			// 메모 내용
	private int del;				// 삭제구분
	
	
	public int getMemonum() {
		return memonum;
	}
	public void setMemonum(int memonum) {
		this.memonum = memonum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	
	
	@Override
	public String toString() {
		return "MemoInfoVO [memonum=" + memonum + ", num=" + num + ", subject=" + subject + ", content=" + content
				+ ", del=" + del + "]";
	}
	

}
