package com.project.review.vo;

public class Board_MovieVO {
	private int b_movie_num;
	private int board_num;
	private String movie_nm;
	private String sort_id;
	private int pnum;
	private int start_content;
	private int end_content;	
	
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
	public String getMovie_nm() {
		return movie_nm;
	}
	public void setMovie_nm(String movie_nm) {
		this.movie_nm = movie_nm;
	}
	public String getSort_id() {
		return sort_id;
	}
	public void setSort_id(String sort_id) {
		this.sort_id = sort_id;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getStart_content() {
		return start_content;
	}
	public void setStart_content(int start_content) {
		this.start_content = start_content;
	}
	public int getEnd_content() {
		return end_content;
	}
	public void setEnd_content(int end_content) {
		this.end_content = end_content;
	}
	@Override
	public String toString() {
		return "Board_MovieVO [b_movie_num=" + b_movie_num + ", board_num=" + board_num + ", movie_nm=" + movie_nm
				+ ", sort_id=" + sort_id + ", pnum=" + pnum + ", start_content=" + start_content + ", end_content="
				+ end_content + "]";
	}
	
	
	
}
