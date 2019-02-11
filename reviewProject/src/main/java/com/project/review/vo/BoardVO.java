package com.project.review.vo;


import java.sql.Date;
import java.util.List;

public class BoardVO {
	private int board_num;
	private String board_title;
	private String board_content;
	private Date board_date;
	//private Date boardupdate;
	
	
	private String member_id;
/*	private String member_pw;
	private String member_name;*/
	
	
	private Board_MovieVO b_movieVO;
	private Board_TvVO b_tvVO;
	/*private Board_GameVO b_gameVO;*/
	
	private MemberVO memberVO;
	private HashtagVO hashtagVO;
	private List<ReplyVO> replyList;
	
	
/*	public String getMember_pw() {
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
	}*/
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Board_MovieVO getB_movieVO() {
		return b_movieVO;
	}
	public void setB_movieVO(Board_MovieVO b_movieVO) {
		this.b_movieVO = b_movieVO;
	}
	public Board_TvVO getB_tvVO() {
		return b_tvVO;
	}
	public void setB_tvVO(Board_TvVO b_tvVO) {
		this.b_tvVO = b_tvVO;
	}
	/*public Board_GameVO getB_gameVO() {
		return b_gameVO;
	}
	public void setB_gameVO(Board_GameVO b_gameVO) {
		this.b_gameVO = b_gameVO;
	}*/
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public HashtagVO getHashtagVO() {
		return hashtagVO;
	}
	public void setHashtagVO(HashtagVO hashtagVO) {
		this.hashtagVO = hashtagVO;
	}
	public List<ReplyVO> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<ReplyVO> replyList) {
		this.replyList = replyList;
	}
	/*
	@Override
	public String toString() {
		return "BoardVO [board_num=" + board_num + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_date=" + board_date + ", member_id=" + member_id + ", b_movieVO=" + b_movieVO + ", b_tvVO="
				+ b_tvVO + ", b_gameVO=" + b_gameVO + ", memberVO=" + memberVO + ", hashtagVO=" + hashtagVO
				+ ", replyList=" + replyList + "]";
	}*/
}
