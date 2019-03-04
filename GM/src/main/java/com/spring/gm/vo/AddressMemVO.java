package com.spring.gm.vo;


//	주소록 구성원 테이블
public class AddressMemVO {
	private String id;			//	아이디
	private int del;			//	삭제구분
	private String strId;		// 자신의 구분
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public String getStrId() {
		return strId;
	}
	public void setStrId(String strId) {
		this.strId = strId;
	}

	
	
}
