package com.spring.gm.vo;

import java.sql.Date;

import javax.xml.crypto.Data;

public class join_margcVO {
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

	private int num; // 출결번호
	private Date day; // 일자
	private int go; // 출근시간
	private int off; // 퇴근시간
	private int result; // 출결결과
	private String reason; // 사유
	private int worktime; // 근무시간
	private int overtime; // 연장근로
	private int nighttime; // 야간근로
	private int perceptiontime; // 지각시간
	private int departuretime; // 조퇴시간
	private String gos; // 출근시간(String)
	private String offs; // 퇴근시간(String)
	private String worktimes; // 근무시간(String)
	private String overtimes; // 연장근로(String)
	private String nighttimes; // 야간근로(String)
	private String perceptiontimes; // 지각시간(String)
	private String departuretimes; // 조퇴시간(String)

	private int j_id;// 그룹, 사업장 id
	private String j_name;// 그룹, 사업장 name
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
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	public int getGo() {
		return go;
	}
	public void setGo(int go) {
		this.go = go;
	}
	public int getOff() {
		return off;
	}
	public void setOff(int off) {
		this.off = off;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getWorktime() {
		return worktime;
	}
	public void setWorktime(int worktime) {
		this.worktime = worktime;
	}
	public int getOvertime() {
		return overtime;
	}
	public void setOvertime(int overtime) {
		this.overtime = overtime;
	}
	public int getNighttime() {
		return nighttime;
	}
	public void setNighttime(int nighttime) {
		this.nighttime = nighttime;
	}
	public int getPerceptiontime() {
		return perceptiontime;
	}
	public void setPerceptiontime(int perceptiontime) {
		this.perceptiontime = perceptiontime;
	}
	public int getDeparturetime() {
		return departuretime;
	}
	public void setDeparturetime(int departuretime) {
		this.departuretime = departuretime;
	}
	public String getGos() {
		return gos;
	}
	public void setGos(String gos) {
		this.gos = gos;
	}
	public String getOffs() {
		return offs;
	}
	public void setOffs(String offs) {
		this.offs = offs;
	}
	public String getWorktimes() {
		return worktimes;
	}
	public void setWorktimes(String worktimes) {
		this.worktimes = worktimes;
	}
	public String getOvertimes() {
		return overtimes;
	}
	public void setOvertimes(String overtimes) {
		this.overtimes = overtimes;
	}
	public String getNighttimes() {
		return nighttimes;
	}
	public void setNighttimes(String nighttimes) {
		this.nighttimes = nighttimes;
	}
	public String getPerceptiontimes() {
		return perceptiontimes;
	}
	public void setPerceptiontimes(String perceptiontimes) {
		this.perceptiontimes = perceptiontimes;
	}
	public String getDeparturetimes() {
		return departuretimes;
	}
	public void setDeparturetimes(String departuretimes) {
		this.departuretimes = departuretimes;
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
		return "join_margcVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", eng_name=" + eng_name + ", jumin1="
				+ jumin1 + ", jumin2=" + jumin2 + ", gender=" + gender + ", marry=" + marry + ", wdday=" + wdday
				+ ", frgn=" + frgn + ", nation=" + nation + ", tel=" + tel + ", tel_hm=" + tel_hm + ", email_in="
				+ email_in + ", email_out=" + email_out + ", address=" + address + ", eng_address=" + eng_address
				+ ", depart=" + depart + ", rank=" + rank + ", rank_name=" + rank_name + ", salary=" + salary
				+ ", contract=" + contract + ", wrkdvd=" + wrkdvd + ", position=" + position + ", enterday=" + enterday
				+ ", retireday=" + retireday + ", year=" + year + ", etc=" + etc + ", sys_rank=" + sys_rank + ", del="
				+ del + ", account_number=" + account_number + ", company=" + company + ", num=" + num + ", day=" + day
				+ ", go=" + go + ", off=" + off + ", result=" + result + ", reason=" + reason + ", worktime=" + worktime
				+ ", overtime=" + overtime + ", nighttime=" + nighttime + ", perceptiontime=" + perceptiontime
				+ ", departuretime=" + departuretime + ", gos=" + gos + ", offs=" + offs + ", worktimes=" + worktimes
				+ ", overtimes=" + overtimes + ", nighttimes=" + nighttimes + ", perceptiontimes=" + perceptiontimes
				+ ", departuretimes=" + departuretimes + ", j_id=" + j_id + ", j_name=" + j_name + ", getId()="
				+ getId() + ", getPwd()=" + getPwd() + ", getName()=" + getName() + ", getEng_name()=" + getEng_name()
				+ ", getJumin1()=" + getJumin1() + ", getJumin2()=" + getJumin2() + ", getGender()=" + getGender()
				+ ", getMarry()=" + getMarry() + ", getWdday()=" + getWdday() + ", getFrgn()=" + getFrgn()
				+ ", getNation()=" + getNation() + ", getTel()=" + getTel() + ", getTel_hm()=" + getTel_hm()
				+ ", getEmail_in()=" + getEmail_in() + ", getEmail_out()=" + getEmail_out() + ", getAddress()="
				+ getAddress() + ", getEng_address()=" + getEng_address() + ", getDepart()=" + getDepart()
				+ ", getRank()=" + getRank() + ", getRank_name()=" + getRank_name() + ", getSalary()=" + getSalary()
				+ ", getContract()=" + getContract() + ", getWrkdvd()=" + getWrkdvd() + ", getPosition()="
				+ getPosition() + ", getEnterday()=" + getEnterday() + ", getRetireday()=" + getRetireday()
				+ ", getYear()=" + getYear() + ", getEtc()=" + getEtc() + ", getSys_rank()=" + getSys_rank()
				+ ", getDel()=" + getDel() + ", getAccount_number()=" + getAccount_number() + ", getCompany()="
				+ getCompany() + ", getNum()=" + getNum() + ", getDay()=" + getDay() + ", getGo()=" + getGo()
				+ ", getOff()=" + getOff() + ", getResult()=" + getResult() + ", getReason()=" + getReason()
				+ ", getWorktime()=" + getWorktime() + ", getOvertime()=" + getOvertime() + ", getNighttime()="
				+ getNighttime() + ", getPerceptiontime()=" + getPerceptiontime() + ", getDeparturetime()="
				+ getDeparturetime() + ", getGos()=" + getGos() + ", getOffs()=" + getOffs() + ", getWorktimes()="
				+ getWorktimes() + ", getOvertimes()=" + getOvertimes() + ", getNighttimes()=" + getNighttimes()
				+ ", getPerceptiontimes()=" + getPerceptiontimes() + ", getDeparturetimes()=" + getDeparturetimes()
				+ ", getJ_id()=" + getJ_id() + ", getJ_name()=" + getJ_name() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
