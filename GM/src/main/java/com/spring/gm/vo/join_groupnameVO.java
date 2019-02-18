package com.spring.gm.vo;

//그룹 상세 테이블
public class join_groupnameVO {
    private int groupId; //그룹번호(FK)
    private String id; //아이디(FK)
    private int rank_mem; //멤버등급
    private int del; //삭제구분
    private String name; // 이름
    
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRank_mem() {
		return rank_mem;
	}
	public void setRank_mem(int rank_mem) {
		this.rank_mem = rank_mem;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "GroupInfoVO [groupId=" + groupId + ", id=" + id + ", rank_mem=" + rank_mem + ", del=" + del + "]";
	}
    
    
}
