package com.spring.gm.vo;


import javax.xml.crypto.Data;

public class AttendedVO {
	private int num;	//출결번호
	private String id;	//아이디
	private Data day;	//일자
	private int go;	//출근시간
	private int off;	//퇴근시간
	private int result;		//출결결과
	private String reason;	//사유
	private int worktime;	//근무시간
	private int overtime;	//연장근로
	private int nighttime;	//야간근로
	private int perceptiontime;	//지각시간
	private int departuretime; 	//조퇴시간
	private String gos;	//출근시간(String)
	private String offs;	//퇴근시간(String)
	private String worktimes;	//근무시간(String)
	private String overtimes;	//연장근로(String)
	private String nighttimes;	//야간근로(String)
	private String perceptiontimes;	//지각시간(String)
	private String departuretimes; 	//조퇴시간(String)
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Data getDay() {
		return day;
	}
	public void setDay(Data day) {
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
	@Override
	public String toString() {
		return "AttendedVO [num=" + num + ", id=" + id + ", day=" + day + ", go=" + go + ", off=" + off + ", result="
				+ result + ", reason=" + reason + ", worktime=" + worktime + ", overtime=" + overtime + ", nighttime="
				+ nighttime + ", perceptiontime=" + perceptiontime + ", departuretime=" + departuretime + ", gos=" + gos
				+ ", offs=" + offs + ", worktimes=" + worktimes + ", overtimes=" + overtimes + ", nighttimes="
				+ nighttimes + ", perceptiontimes=" + perceptiontimes + ", departuretimes=" + departuretimes + "]";
	}
	
	
}
