package com.project.review.vo;

public class SnsUserVO {
	private int id; 
	private String sns_type;
	private String sns_id;
	private String sns_name;
	private String sns_pic;
	private String sns_age;
	private String sns_gender;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSns_type() {
		return sns_type;
	}
	public void setSns_type(String sns_type) {
		this.sns_type = sns_type;
	}
	public String getSns_id() {
		return sns_id;
	}
	public void setSns_id(String sns_id) {
		this.sns_id = sns_id;
	}
	public String getSns_name() {
		return sns_name;
	}
	public void setSns_name(String sns_name) {
		this.sns_name = sns_name;
	}
	public String getSns_pic() {
		return sns_pic;
	}
	public void setSns_pic(String sns_pic) {
		this.sns_pic = sns_pic;
	}
	public String getSns_age() {
		return sns_age;
	}
	public void setSns_age(String sns_age) {
		this.sns_age = sns_age;
	}
	public String getSns_gender() {
		return sns_gender;
	}
	public void setSns_gender(String sns_gender) {
		this.sns_gender = sns_gender;
	}

	@Override
	public String toString() {
		return "SnsUserVO [id=" + id + ", sns_type=" + sns_type + ", sns_id=" + sns_id + ", sns_name=" + sns_name
				+ ", sns_pic=" + sns_pic + ", sns_age=" + sns_age + ", sns_gender=" + sns_gender + "]";
	}
}
