package com.project.review.vo;

public class Board_TvVO {
	private String board_num;
	private int b_tv_num;
	
	public String getBoard_num() {
		return board_num;
	}
	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}
	public int getB_tv_num() {
		return b_tv_num;
	}
	public void setB_tv_num(int b_tv_num) {
		this.b_tv_num = b_tv_num;
	}
	
	@Override
	public String toString() {
		return "Board_TvVO [board_num=" + board_num + ", b_tv_num=" + b_tv_num + "]";
	}
}
