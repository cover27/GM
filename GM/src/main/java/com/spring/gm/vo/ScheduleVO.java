package com.spring.gm.vo;

import java.sql.Timestamp;

public class ScheduleVO {
	private int num; //일정번호
	private String id; //아이디(FK)
	private int equipnum; //설비번호(FK)
	private int teamSchedule; //팀일정여부
	private String scheduleKind; //일정종류
	private String subject; //제목
	private String location; //장소
	private String content; //내용
	private Timestamp begin; //시작일
	private Timestamp end; //종료일
	private int groupId; //그룹번호(FK)
	private int del; //삭제구분
	
	
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
	public int getEquipnum() {
		return equipnum;
	}
	public void setEquipnum(int equipnum) {
		this.equipnum = equipnum;
	}
	public int getTeamSchedule() {
		return teamSchedule;
	}
	public void setTeamSchedule(int teamSchedule) {
		this.teamSchedule = teamSchedule;
	}
	public String getScheduleKind() {
		return scheduleKind;
	}
	public void setScheduleKind(String scheduleKind) {
		this.scheduleKind = scheduleKind;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	@Override
	public String toString() {
		return "ScheduleVO [num=" + num + ", id=" + id + ", equipnum=" + equipnum + ", teamSchedule=" + teamSchedule
				+ ", scheduleKind=" + scheduleKind + ", subject=" + subject + ", location=" + location + ", content="
				+ content + ", begin=" + begin + ", end=" + end + ", groupId=" + groupId + ", del=" + del + "]";
	}
	
	
}
