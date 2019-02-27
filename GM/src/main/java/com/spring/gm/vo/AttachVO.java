package com.spring.gm.vo;

//	첨부파일 테이블
public class AttachVO {

	private int num;		//	첨부파일번호
	private int contentNum; //	글번호
	private String title;	//	첨부파일명
	private String stored_title; // 저장되는 이름 중복방지를 막기 위해
	private long filesize; // 파일 크기
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getContentNum() {
		return contentNum;
	}
	public void setContentNum(int contentNum) {
		this.contentNum = contentNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStored_title() {
		return stored_title;
	}
	public void setStored_title(String stored_title) {
		this.stored_title = stored_title;
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	
	
}
