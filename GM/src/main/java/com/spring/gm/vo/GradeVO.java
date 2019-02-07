package com.spring.gm.vo;

//직급 테이블
public class GradeVO {
	
	private int rank; //직급(PK)
	private String r_name; //직급명
	private int company; //사업장(FK)
	private int ranking; //순위
	
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public int getCompany() {
		return company;
	}
	public void setCompany(int company) {
		this.company = company;
	}
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	
	@Override
	public String toString() {
		return "GradeVO [rank=" + rank + ", r_name=" + r_name + ", company=" + company + ", ranking=" + ranking + "]";
	}
	
	

}
