package com.project.review.vo;

public class MemberVo {
	
	private String id;
	private String pw;
	private String nickname;
	private int gender;
	private int age;
	private String likesomthing;
	private String grade;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getLikesomthing() {
		return likesomthing;
	}
	public void setLikesomthing(String likesomthing) {
		this.likesomthing = likesomthing;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	@Override
	public String toString() {
		return "MemberVo [id=" + id + ", pw=" + pw + ", nickname=" + nickname + ", gender=" + gender + ", age=" + age
				+ ", likesomthing=" + likesomthing + ", grade=" + grade + "]";
	}
	
	
}
