package com.spring.gm.vo;


//	주소록 구성원 테이블
public class AddressMemVO {
	private String id;			//	아이디
	private String name;		//	이름
	private String company;		//	회사
	private String phone;		//	휴대전화번호
	private String email;		//	이메일
	private int del;			//	삭제구분
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}

	
	
}
