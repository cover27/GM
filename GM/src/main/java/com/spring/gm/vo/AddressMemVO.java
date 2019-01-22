package com.spring.gm.vo;


//	주소록 구성원 테이블
public class AddressMemVO {
	
	private int m_num;			//	멤버번호
	private int g_num;			//	주소록그룹 (FK)
	private String name;		//	이름
	private String company;		//	회사
	private String phone;		//	휴대전화번호
	private String c_phone;		//	회사전화번호
	private String f_phone;		//	팩스전화번호
	private String email;		//	이메일
	private String del;			//	삭제구분
	
	
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getG_num() {
		return g_num;
	}
	public void setG_num(int g_num) {
		this.g_num = g_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getC_phone() {
		return c_phone;
	}
	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}
	public String getF_phone() {
		return f_phone;
	}
	public void setF_phone(String f_phone) {
		this.f_phone = f_phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	
	
	@Override
	public String toString() {
		return "AddressMemVO [m_num=" + m_num + ", g_num=" + g_num + ", name=" + name + ", company=" + company
				+ ", phone=" + phone + ", c_phone=" + c_phone + ", f_phone=" + f_phone + ", email=" + email + ", del="
				+ del + "]";
	}

	
	
}
