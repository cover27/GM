package com.spring.gm.vo;

import com.sun.jmx.snmp.Timestamp;

public class BonusCutVO {
	private int num;
	private String id;
	private String type;
	private Timestamp day;
	private int cost;
	private String content;
	private String state;
	private int del;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Timestamp getDay() {
		return day;
	}
	public void setDay(Timestamp day) {
		this.day = day;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
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
		return "BonusCutVO [num=" + num + ", id=" + id + ", type=" + type + ", day=" + day + ", cost=" + cost
				+ ", content=" + content + ", state=" + state + ", del=" + del + "]";
	}
	
	
	
}
