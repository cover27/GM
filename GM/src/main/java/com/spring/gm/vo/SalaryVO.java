package com.spring.gm.vo;

import com.sun.jmx.snmp.Timestamp;

public class SalaryVO {
	private int sal_num; //급여번호
	private String id;	//아이디
	private Timestamp day;	//지급일
	private String state;	//상태
	private int salary;		//월급
	private int del;		//삭제구분
	public int getSal_num() {
		return sal_num;
	}
	public void setSal_num(int sal_num) {
		this.sal_num = sal_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getDay() {
		return day;
	}
	public void setDay(Timestamp day) {
		this.day = day;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	@Override
	public String toString() {
		return "SalaryVO [sal_num=" + sal_num + ", id=" + id + ", day=" + day + ", state=" + state + ", salary="
				+ salary + ", del=" + del + "]";
	}
	
	
	
}
