package com.spring.gm.vo;

import java.sql.Timestamp;

public class MessageVO {
	private int num;				// 메일번호	
	private int message_num;			// 메일함번호(FK)	
	private String sender;			// 아이디(FK)	
	private String receiver;		// 아이디(FK)	
	private String subject;			// 제목	
	private String content;			// 내용	
	private int state;			// 상태
	private Timestamp sentDate;		// 메일발송일
	private Timestamp receivedDate;	// 메일 수신일	
	private int del;				// 삭제구분	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getMessage_num() {
		return message_num;
	}
	public void setMessage_num(int message_num) {
		this.message_num = message_num;
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
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Timestamp getSentDate() {
		return sentDate;
	}
	public void setSentDate(Timestamp sentDate) {
		this.sentDate = sentDate;
	}
	public Timestamp getReceivedDate() {
		return receivedDate;
	}
	public void setReceivedDate(Timestamp receivedDate) {
		this.receivedDate = receivedDate;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}

	
}
