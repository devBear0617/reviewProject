package com.project.review.vo;

public class Board_MovieVO {
	private int b_movie_num;
	private String board_num;
	
	public int getB_movie_num() {
		return b_movie_num;
	}
	public void setB_movie_num(int b_movie_num) {
		this.b_movie_num = b_movie_num;
	}
	public String getBoard_num() {
		return board_num;
	}
	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}
	
	@Override
	public String toString() {
		return "Board_MovieVO [board_num=" + board_num + ", b_movie_num=" + b_movie_num + "]";
	}
}
