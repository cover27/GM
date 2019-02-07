package com.spring.gm.vo;

public class Join_payVO {
	
	private String name;	//member name
	private String r_name;	//grade name
	private String g_name;	//groups name
	
	
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
		return "Join_payVO [name=" + name + ", r_name=" + r_name + ", g_name=" + g_name + "]";
	}
	
	
	

}
