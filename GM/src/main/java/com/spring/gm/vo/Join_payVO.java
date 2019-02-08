package com.spring.gm.vo;

public class Join_payVO {
	
	private String name;	//회원 이름
	private String r_name;	//직급 이름
	private String g_name;	//부서 이름
	private String c_name;	//회사 이름
	
	
	
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	@Override
	public String toString() {
		return "Join_payVO [name=" + name + ", r_name=" + r_name + ", g_name=" + g_name + ", c_name=" + c_name + "]";
	}
	
}
