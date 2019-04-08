package com.project.review.vo;

import java.sql.Date;

public class ReplyVO {
	private int reply_num;
	private int board_num;
	private String member_id;
	private String reply_content;
	private Date reply_date;
	private Date reply_up_date;
	
	private Board_MovieVO b_movieVO;
	private BoardVO boardVO;
	private MemberVO memberVO;
	//-------------------------
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	public Date getReply_up_date() {
		return reply_up_date;
	}
	public void setReply_up_date(Date reply_up_date) {
		this.reply_up_date = reply_up_date;
	}
	public Board_MovieVO getB_movieVO() {
		return b_movieVO;
	}
	public void setB_movieVO(Board_MovieVO b_movieVO) {
		this.b_movieVO = b_movieVO;
	}
	public BoardVO getBoardVO() {
		return boardVO;
	}
	public void setBoardVO(BoardVO boardVO) {
		this.boardVO = boardVO;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "ReplyVO [reply_num=" + reply_num + ", board_num=" + board_num + ", member_id=" + member_id
				+ ", reply_content=" + reply_content + ", reply_date=" + reply_date + ", reply_up_date=" + reply_up_date
				+ ", b_movieVO=" + b_movieVO + ", boardVO=" + boardVO + ", memberVO=" + memberVO + "]";
	}

	
	
}
