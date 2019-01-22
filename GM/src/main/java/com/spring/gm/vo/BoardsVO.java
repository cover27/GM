package com.spring.gm.vo;

//게시판 테이블
public class BoardsVO {
	
    private int num; //게시판번호
    private int groupId; //그룹번호(FK)
    private String b_name; //게시판이름
    private int anon; //익명여부
    private int del; //삭제구분
	
    public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public int getAnon() {
		return anon;
	}
	public void setAnon(int anon) {
		this.anon = anon;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	
	@Override
	public String toString() {
		return "BoardsVO [num=" + num + ", groupId=" + groupId + ", b_name=" + b_name + ", anon=" + anon + ", del="
				+ del + "]";
	}
    
    
	
}
