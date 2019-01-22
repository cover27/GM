package com.spring.gm.vo;

// 조직도 (주소록 그룹)
public class AddressGroupVO {
	
	private int g_num;		// 주소록 그룹
	private String id;		// 아이디(FK)
	private String g_name;	// 그룹 이름
	private int g_rank;		// 그룹 등급
	private int del;		// 삭제구분
	
	
	public int getG_num() {
		return g_num;
	}
	public void setG_num(int g_num) {
		this.g_num = g_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public int getG_rank() {
		return g_rank;
	}
	public void setG_rank(int g_rank) {
		this.g_rank = g_rank;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	
	
	@Override
	public String toString() {
		return "AddressGroupVO [g_num=" + g_num + ", id=" + id + ", g_name=" + g_name + ", g_rank=" + g_rank + ", del="
				+ del + "]";
	}
	

}
