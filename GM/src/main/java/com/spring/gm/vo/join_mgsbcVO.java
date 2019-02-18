package com.spring.gm.vo;

import java.sql.Date;

import com.sun.jmx.snmp.Timestamp;

public class join_mgsbcVO {
	private String id; //아이디
    private String pwd; //비밀번호
    private String name; //성함
    private String eng_name; //영문이름
    private int jumin1; //주민번호앞자리
    private int jumin2; //주민번호뒷자리
    private int gender; //성별
    private int marry; //미혼여부
    private Date wdday; //결혼기념일
    private int frgn; //내외국인여부
    private String nation; //국적
    private String tel; //휴대전화번호
    private String tel_hm; //자택번호
    private String email_in; //회사이메일
    private String email_out; //외부이메일
    private String address; //자택주소
    private String eng_address; //영문주소
    private int depart; //그룹번호(FK)
    private int rank; //직급(FK)
    private int salary; // 연봉
    private int contract; //계약형태
    private int wrkdvd; //재직구분
    private int position; //직책
    private Date enterday; //입사일
    private Date retireday; //퇴직일
    private int year; //연차
    private String etc; //비고
    private int sys_rank; //시스템직급(FK)
    private int del; //삭제구분
    private String account_number; // 계좌번호
    private String j_name;
    
    private int groupId; //그룹번호
    private String g_name; //그룹이름
    private int group_rank; //그룹등급
    
    private int sal_num; //급여번호
	private Date day;	//지급일
	private String state;	//상태
	
	private int num;
	private String type;
	private int cost;
	private String content;
	
	private String c_name; //사업장이름
    private String c_address; //사업장주소
    private int c_number; //사업자등록번호
	
	private int bonussalary;	//추가 및 삭감 금액 합게
	private int sumsalarybonus;	// 기본금액 + 추가 및 삭감 금액 합게
	private int salaryday; // 급여 날짜
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
	public String getJ_name() {
		return j_name;
	}
	public void setJ_name(String j_name) {
		this.j_name = j_name;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
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
	public int getSal_num() {
		return sal_num;
	}
	public void setSal_num(int sal_num) {
		this.sal_num = sal_num;
	}
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public int getBonussalary() {
		return bonussalary;
	}
	public void setBonussalary(int bonussalary) {
		this.bonussalary = bonussalary;
	}
	public int getSumsalarybonus() {
		return sumsalarybonus;
	}
	public void setSumsalarybonus(int sumsalarybonus) {
		this.sumsalarybonus = sumsalarybonus;
	}
	public int getSalaryday() {
		return salaryday;
	}
	public void setSalaryday(int salaryday) {
		this.salaryday = salaryday;
	}
	@Override
	public String toString() {
		return "join_mgsbcVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", eng_name=" + eng_name + ", jumin1="
				+ jumin1 + ", jumin2=" + jumin2 + ", gender=" + gender + ", marry=" + marry + ", wdday=" + wdday
				+ ", frgn=" + frgn + ", nation=" + nation + ", tel=" + tel + ", tel_hm=" + tel_hm + ", email_in="
				+ email_in + ", email_out=" + email_out + ", address=" + address + ", eng_address=" + eng_address
				+ ", depart=" + depart + ", rank=" + rank + ", salary=" + salary + ", contract=" + contract
				+ ", wrkdvd=" + wrkdvd + ", position=" + position + ", enterday=" + enterday + ", retireday="
				+ retireday + ", year=" + year + ", etc=" + etc + ", sys_rank=" + sys_rank + ", del=" + del
				+ ", account_number=" + account_number + ", j_name=" + j_name + ", groupId=" + groupId + ", g_name="
				+ g_name + ", group_rank=" + group_rank + ", sal_num=" + sal_num + ", day=" + day + ", state=" + state
				+ ", num=" + num + ", type=" + type + ", cost=" + cost + ", content=" + content + ", c_name=" + c_name
				+ ", c_address=" + c_address + ", c_number=" + c_number + ", bonussalary=" + bonussalary
				+ ", sumsalarybonus=" + sumsalarybonus + ", salaryday=" + salaryday + "]";
	}
	
	
	
}
