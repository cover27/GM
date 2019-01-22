package com.spring.gm.vo;

//그룹테이블
public class GroupsVO {
    
	private int groupId; //그룹번호
    private int company; //사업장(FK)
    private String g_name; //그룹이름
    private int group_rank; //그룹등급
    private int del; //삭제구분
    
    
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public int getCompany() {
		return company;
	}
	public void setCompany(int company) {
		this.company = company;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public int getGroup_rank() {
		return group_rank;
	}
	public void setGroup_rank(int group_rank) {
		this.group_rank = group_rank;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	
	@Override
	public String toString() {
		return "GroupsVO [groupId=" + groupId + ", company=" + company + ", g_name=" + g_name + ", group_rank="
				+ group_rank + ", del=" + del + "]";
	}
    
    
}
