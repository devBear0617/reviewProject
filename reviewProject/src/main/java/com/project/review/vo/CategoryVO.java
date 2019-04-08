package com.project.review.vo;

public class CategoryVO {
	String ca_type;
	String ca_cd;
	String ca_nm;
	
	public String getCa_type() {
		return ca_type;
	}
	public void setCa_type(String ca_type) {
		this.ca_type = ca_type;
	}
	public String getCa_cd() {
		return ca_cd;
	}
	public void setCa_cd(String ca_cd) {
		this.ca_cd = ca_cd;
	}
	public String getCa_nm() {
		return ca_nm;
	}
	public void setCa_nm(String ca_nm) {
		this.ca_nm = ca_nm;
	}

	@Override
	public String toString() {
		return "CategoryVO [ca_type=" + ca_type + ", ca_cd=" + ca_cd + ", ca_nm=" + ca_nm + "]";
	}
}
