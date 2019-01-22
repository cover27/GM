package com.spring.gm.vo;

import java.sql.Timestamp;

//전자결제 상세 테이블
public class PaymentInfoVO {

	private int detail_num; //전자결제상세번호
	private int num; //전자결제번호(FK)
	private String id; //아이디(FK)
	private String result; //결제결과
    private int rank; //결제순위
    private Timestamp reg_date; //등록일
    private String content; //사유
    private int refer; //참조여부
    private int agree; //합의여부
	
    
    public int getDetail_num() {
		return detail_num;
	}
	public void setDetail_num(int detail_num) {
		this.detail_num = detail_num;
	}
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
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRefer() {
		return refer;
	}
	public void setRefer(int refer) {
		this.refer = refer;
	}
	public int getAgree() {
		return agree;
	}
	public void setAgree(int agree) {
		this.agree = agree;
	}
	
	@Override
	public String toString() {
		return "PaymentInfoVO [detail_num=" + detail_num + ", num=" + num + ", id=" + id + ", result=" + result
				+ ", rank=" + rank + ", reg_date=" + reg_date + ", content=" + content + ", refer=" + refer + ", agree="
				+ agree + "]";
	}
    
    
}
