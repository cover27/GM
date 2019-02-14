package com.spring.gm.vo;

public class join_mgiVO {
	private String id; // 아이디
	private String name;
	private int depart; // 부서
	private String departName; // 부서명
	private int rank; // 직급
	private String rankName; // 직급명
	private String tel; // 전화번호
	private String email; // 이메일
	private int leader; // 부서장 여부 1이면 부서장 아니면 그냥 부서원
	private int sys_rank; // 관리자 여부
	
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
	public int getDepart() {
		return depart;
	}
	public void setDepart(int depart) {
		this.depart = depart;
	}
	public String getDepartName() {
		return departName;
	}
	public void setDepartName(String departName) {
		this.departName = departName;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getLeader() {
		return leader;
	}
	public void setLeader(int leader) {
		this.leader = leader;
	}
	public int getSys_rank() {
		return sys_rank;
	}
	public void setSys_rank(int sys_rank) {
		this.sys_rank = sys_rank;
	}
	
}
