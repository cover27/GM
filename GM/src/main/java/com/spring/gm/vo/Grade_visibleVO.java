package com.spring.gm.vo;

//직급 테이블
public class Grade_visibleVO {
	
	private int rank; //직급(PK)
	private String r_name; //직급명
	private int company; //사업장(FK)
	private int ranking; //순위
	private int visible; //직급관리에서 삭제 눌렀을 시 화면에 임시적으로 안보이게 하는 컬럼입니다.
	//쓸일 아마 없을테니 신경쓰지 마세욥.
	
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
	public int getVisible() {
		return visible;
	}
	public void setVisible(int visible) {
		this.visible = visible;
	}
	
	@Override
	public String toString() {
		return "GradeVO [rank=" + rank + ", r_name=" + r_name + ", company=" + company + ", ranking=" + ranking + "]";
	}
	
	

}
