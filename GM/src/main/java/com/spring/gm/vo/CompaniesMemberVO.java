package com.spring.gm.vo;

//사업장 테이블
public class CompaniesMemberVO {
    private int company; //사업장
    private String c_name; //사업장이름
    private String c_address; //사업장주소
    private int c_number; //사업자등록번호
    private int del; //삭제구분
    private String id; // 신청자 아이디
    
	
    
    public int getCompany() {
		return company;
	}
	public void setCompany(int company) {
		this.company = company;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_address() {
		return c_address;
	}
	public void setC_address(String c_address) {
		this.c_address = c_address;
	}
	public int getC_number() {
		return c_number;
	}
	public void setC_number(int c_number) {
		this.c_number = c_number;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	
	@Override
	public String toString() {
		return "CompaniesVO [company=" + company + ", c_name=" + c_name + ", c_address=" + c_address + ", c_number="
				+ c_number + ", del=" + del + "]";
	}
    
    
}
