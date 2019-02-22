package com.spring.gm.vo;

import java.security.Timestamp;
import java.sql.Date;

public class join_mrvdVO {
	private String id; // 아이디
	private String pwd; // 비밀번호
	private String name; // 성함
	private String eng_name; // 영문이름
	private int jumin1; // 주민번호앞자리
	private int jumin2; // 주민번호뒷자리
	private int gender; // 성별
	private int marry; // 미혼여부
	private Date wdday; // 결혼기념일
	private int frgn; // 내외국인여부
	private String nation; // 국적
	private String tel; // 휴대전화번호
	private String tel_hm; // 자택번호
	private String email_in; // 회사이메일
	private String email_out; // 외부이메일
	private String address; // 자택주소
	private String eng_address; // 영문주소
	private int depart; // 그룹번호(FK)
	private int rank; // 직급(FK)
	private String rank_name;	//직급명 
	private int salary; // 연봉
	private int contract; // 계약형태
	private int wrkdvd; // 재직구분
	private int position; // 직책
	private Date enterday; // 입사일
	private Date retireday; // 퇴직일
	private int year; // 연차
	private String etc; // 비고
	private int sys_rank; // 시스템직급(FK)
	private int del; // 삭제구분
	private String account_number; // 계좌번호
	private int company; // 회사번호
	
	
	//직급
	
	//휴가설정
	private int num;
	private int types;
	private int day;
	private int annual; //연차
	private int u_annual; //연차 사용횟수
	private int n_annual; //연차 남은횟수
	private int vacation; //휴가
	private int u_vacation; //휴가 사용횟수
	private int n_vacation; //휴가 남은횟수_
	
	
	//휴가
	private Timestamp begin;
	private Timestamp end;
	private String content;
	private String state;
	private int deduct;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}
	public int getJumin1() {
		return jumin1;
	}
	public void setJumin1(int jumin1) {
		this.jumin1 = jumin1;
	}
	public int getJumin2() {
		return jumin2;
	}
	public void setJumin2(int jumin2) {
		this.jumin2 = jumin2;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getMarry() {
		return marry;
	}
	public void setMarry(int marry) {
		this.marry = marry;
	}
	public Date getWdday() {
		return wdday;
	}
	public void setWdday(Date wdday) {
		this.wdday = wdday;
	}
	public int getFrgn() {
		return frgn;
	}
	public void setFrgn(int frgn) {
		this.frgn = frgn;
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
	public String getTel_hm() {
		return tel_hm;
	}
	public void setTel_hm(String tel_hm) {
		this.tel_hm = tel_hm;
	}
	public String getEmail_in() {
		return email_in;
	}
	public void setEmail_in(String email_in) {
		this.email_in = email_in;
	}
	public String getEmail_out() {
		return email_out;
	}
	public void setEmail_out(String email_out) {
		this.email_out = email_out;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEng_address() {
		return eng_address;
	}
	public void setEng_address(String eng_address) {
		this.eng_address = eng_address;
	}
	public int getDepart() {
		return depart;
	}
	public void setDepart(int depart) {
		this.depart = depart;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getRank_name() {
		return rank_name;
	}
	public void setRank_name(String rank_name) {
		this.rank_name = rank_name;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getContract() {
		return contract;
	}
	public void setContract(int contract) {
		this.contract = contract;
	}
	public int getWrkdvd() {
		return wrkdvd;
	}
	public void setWrkdvd(int wrkdvd) {
		this.wrkdvd = wrkdvd;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public Date getEnterday() {
		return enterday;
	}
	public void setEnterday(Date enterday) {
		this.enterday = enterday;
	}
	public Date getRetireday() {
		return retireday;
	}
	public void setRetireday(Date retireday) {
		this.retireday = retireday;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public int getSys_rank() {
		return sys_rank;
	}
	public void setSys_rank(int sys_rank) {
		this.sys_rank = sys_rank;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getTypes() {
		return types;
	}
	public void setTypes(int types) {
		this.types = types;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getAnnual() {
		return annual;
	}
	public void setAnnual(int annual) {
		this.annual = annual;
	}
	public int getU_annual() {
		return u_annual;
	}
	public void setU_annual(int u_annual) {
		this.u_annual = u_annual;
	}
	public int getN_annual() {
		return n_annual;
	}
	public void setN_annual(int n_annual) {
		this.n_annual = n_annual;
	}
	public int getVacation() {
		return vacation;
	}
	public void setVacation(int vacation) {
		this.vacation = vacation;
	}
	public int getU_vacation() {
		return u_vacation;
	}
	public void setU_vacation(int u_vacation) {
		this.u_vacation = u_vacation;
	}
	public int getN_vacation() {
		return n_vacation;
	}
	public void setN_vacation(int n_vacation) {
		this.n_vacation = n_vacation;
	}
	public Timestamp getBegin() {
		return begin;
	}
	public void setBegin(Timestamp begin) {
		this.begin = begin;
	}
	public Timestamp getEnd() {
		return end;
	}
	public void setEnd(Timestamp end) {
		this.end = end;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getDeduct() {
		return deduct;
	}
	public void setDeduct(int deduct) {
		this.deduct = deduct;
	}
	@Override
	public String toString() {
		return "join_mrvdVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", eng_name=" + eng_name + ", jumin1="
				+ jumin1 + ", jumin2=" + jumin2 + ", gender=" + gender + ", marry=" + marry + ", wdday=" + wdday
				+ ", frgn=" + frgn + ", nation=" + nation + ", tel=" + tel + ", tel_hm=" + tel_hm + ", email_in="
				+ email_in + ", email_out=" + email_out + ", address=" + address + ", eng_address=" + eng_address
				+ ", depart=" + depart + ", rank=" + rank + ", rank_name=" + rank_name + ", salary=" + salary
				+ ", contract=" + contract + ", wrkdvd=" + wrkdvd + ", position=" + position + ", enterday=" + enterday
				+ ", retireday=" + retireday + ", year=" + year + ", etc=" + etc + ", sys_rank=" + sys_rank + ", del="
				+ del + ", account_number=" + account_number + ", company=" + company + ", num=" + num + ", types="
				+ types + ", day=" + day + ", annual=" + annual + ", u_annual=" + u_annual + ", n_annual=" + n_annual
				+ ", vacation=" + vacation + ", u_vacation=" + u_vacation + ", n_vacation=" + n_vacation + ", begin="
				+ begin + ", end=" + end + ", content=" + content + ", state=" + state + ", deduct=" + deduct
				+ ", getId()=" + getId() + ", getPwd()=" + getPwd() + ", getName()=" + getName() + ", getEng_name()="
				+ getEng_name() + ", getJumin1()=" + getJumin1() + ", getJumin2()=" + getJumin2() + ", getGender()="
				+ getGender() + ", getMarry()=" + getMarry() + ", getWdday()=" + getWdday() + ", getFrgn()=" + getFrgn()
				+ ", getNation()=" + getNation() + ", getTel()=" + getTel() + ", getTel_hm()=" + getTel_hm()
				+ ", getEmail_in()=" + getEmail_in() + ", getEmail_out()=" + getEmail_out() + ", getAddress()="
				+ getAddress() + ", getEng_address()=" + getEng_address() + ", getDepart()=" + getDepart()
				+ ", getRank()=" + getRank() + ", getRank_name()=" + getRank_name() + ", getSalary()=" + getSalary()
				+ ", getContract()=" + getContract() + ", getWrkdvd()=" + getWrkdvd() + ", getPosition()="
				+ getPosition() + ", getEnterday()=" + getEnterday() + ", getRetireday()=" + getRetireday()
				+ ", getYear()=" + getYear() + ", getEtc()=" + getEtc() + ", getSys_rank()=" + getSys_rank()
				+ ", getDel()=" + getDel() + ", getAccount_number()=" + getAccount_number() + ", getCompany()="
				+ getCompany() + ", getNum()=" + getNum() + ", getTypes()=" + getTypes() + ", getDay()=" + getDay()
				+ ", getAnnual()=" + getAnnual() + ", getU_annual()=" + getU_annual() + ", getN_annual()="
				+ getN_annual() + ", getVacation()=" + getVacation() + ", getU_vacation()=" + getU_vacation()
				+ ", getN_vacation()=" + getN_vacation() + ", getBegin()=" + getBegin() + ", getEnd()=" + getEnd()
				+ ", getContent()=" + getContent() + ", getState()=" + getState() + ", getDeduct()=" + getDeduct()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
	
}
