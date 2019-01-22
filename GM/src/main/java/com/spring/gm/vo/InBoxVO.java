package com.spring.gm.vo;


//	쪽지함 테이블
public class InBoxVO {
	
	private int num;			//	쪽지번호
	private int mess_num;		//	쪽지함 번호(FK)
	private String sender;		//	보내는 사람 ID (FK)
	private String receiver;	//	받는 사람 ID (FK)
	private String subject;		//	글 제목
	private String content;		//	글 내용
	private String state;		//	상태
	private int del;			//	삭제구분
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getMess_num() {
		return mess_num;
	}
	public void setMess_num(int mess_num) {
		this.mess_num = mess_num;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
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
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	
	
	@Override
	public String toString() {
		return "InBox [num=" + num + ", mess_num=" + mess_num + ", sender=" + sender + ", receiver=" + receiver
				+ ", subject=" + subject + ", content=" + content + ", state=" + state + ", del=" + del + "]";
	}
	

}
