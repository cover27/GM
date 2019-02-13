package com.spring.gm.vo;

public class Join_payVO {
	
	private String id;		//회원 아이디
	private String name;	//회원 이름
	private String r_name;	//직급 이름
	private String g_name;	//부서 이름
	private String c_name;	//회사 이름
	private String state;	//전자결재 상태
	private int group_rank;	//그룹등급
	private int rank_mem;	//그룹상세 멤버등급
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getGroup_rank() {
		return group_rank;
	}
	public void setGroup_rank(int group_rank) {
		this.group_rank = group_rank;
	}
	public int getRank_mem() {
		return rank_mem;
	}
	public void setRank_mem(int rank_mem) {
		this.rank_mem = rank_mem;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
		return "Join_payVO [id=" + id + ", name=" + name + ", r_name=" + r_name + ", g_name=" + g_name + ", c_name="
				+ c_name + ", state=" + state + ", group_rank=" + group_rank + ", rank_mem=" + rank_mem + "]";
	}
	
	
}
