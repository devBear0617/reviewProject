package com.project.review.vo;

public class Board_GameVO {
	private int board_num;
	private int b_game_num;
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getB_game_num() {
		return b_game_num;
	}
	public void setB_game_num(int b_game_num) {
		this.b_game_num = b_game_num;
	}
	@Override
	public String toString() {
		return "Board_GameVO [board_num=" + board_num + ", b_game_num=" + b_game_num + "]";
	}
	
	
}
