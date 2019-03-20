package com.project.review.vo;

public class LikeItVO {
	private int board_num;
	private String member_id;
	private int likeit;
	
	private BoardVO boardVO;
	//-----------------------------
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

	public int getLikeit() {
		return likeit;
	}

	public void setLikeit(int likeit) {
		this.likeit = likeit;
	}

	public BoardVO getBoardVO() {
		return boardVO;
	}

	public void setBoardVO(BoardVO boardVO) {
		this.boardVO = boardVO;
	}

	@Override
	public String toString() {
		return "LikeItVO [board_num=" + board_num + ", member_id=" + member_id + ", likeit=" + likeit + ", boardVO="
				+ boardVO + "]";
	}
	
}
