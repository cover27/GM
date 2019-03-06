package com.spring.gm.vo;

import java.sql.Date;

public class join_mgcVO {

	private String id; //아이디
    private String name; //성함
    private int jumin1; //주민번호앞자리
    private int gender; //성별
    private String nation; //국적
    private String tel; //휴대전화번호
    private String email_in; //회사이메일
    private int rank; //직급(FK)
    private int salary; // 연봉
    private Date enterday; //입사일
    private int year; //연차
    private String account_number; // 계좌번호
    private int company; //회사번호
    private int j_id;//그룹, 사업장 id
    private String j_name;//그룹, 사업장 name
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
	public int getJumin1() {
		return jumin1;
	}
	public void setJumin1(int jumin1) {
		this.jumin1 = jumin1;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail_in() {
		return email_in;
	}
	public void setEmail_in(String email_in) {
		this.email_in = email_in;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public Date getEnterday() {
		return enterday;
	}
	public void setEnterday(Date enterday) {
		this.enterday = enterday;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getAccount_number() {
		return account_number;
	}
	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}
	public int getCompany() {
		return company;
	}
	public void setCompany(int company) {
		this.company = company;
	}
	public int getJ_id() {
		return j_id;
	}
	public void setJ_id(int j_id) {
		this.j_id = j_id;
	}
	public String getJ_name() {
		return j_name;
	}
	public void setJ_name(String j_name) {
		this.j_name = j_name;
	}
	@Override
	public String toString() {
		return "join_mgcVO [id=" + id + ", name=" + name + ", jumin1=" + jumin1 + ", gender=" + gender + ", nation="
				+ nation + ", tel=" + tel + ", email_in=" + email_in + ", rank=" + rank + ", salary=" + salary
				+ ", enterday=" + enterday + ", year=" + year + ", account_number=" + account_number + ", company="
				+ company + ", j_id=" + j_id + ", j_name=" + j_name + "]";
	}
    
	
    
}
