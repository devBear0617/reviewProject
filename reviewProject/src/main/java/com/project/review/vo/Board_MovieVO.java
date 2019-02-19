package com.project.review.vo;

public class Board_MovieVO {
	private int b_movie_num;
	private int board_num;
	private String ex;
	
	
	public int getB_movie_num() {
		return b_movie_num;
	}
	public void setB_movie_num(int b_movie_num) {
		this.b_movie_num = b_movie_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getEx() {
		return ex;
	}
	public void setEx(String ex) {
		this.ex = ex;
	}
	@Override
	public String toString() {
		return "Board_MovieVO [b_movie_num=" + b_movie_num + ", board_num=" + board_num + ", ex=" + ex + "]";
	}
	
	
}
