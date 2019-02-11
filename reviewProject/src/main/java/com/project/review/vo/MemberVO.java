package com.project.review.vo;

import java.util.List;

public class MemberVO {
	private String member_id;
	private String member_pw;
	private String member_name;
	//private String member_pic;
	
	private List<BoardVO> boardList;
	private List<ReplyVO> replyList;
	private List<LikeItVO> likeList;
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_pw=" + member_pw + ", member_name=" + member_name + "]";
	}
}
