package com.project.review.vo;

public class HashtagVO {
	private int board_num;
	private String hashtag1;
	private String hashtag2;
	private String hashtag3;
	private String hashtag4;
	private String hashtag5;
	private String hashtag6;
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getHashtag1() {
		return hashtag1;
	}
	public void setHashtag1(String hashtag1) {
		this.hashtag1 = hashtag1;
	}
	public String getHashtag2() {
		return hashtag2;
	}
	public void setHashtag2(String hashtag2) {
		this.hashtag2 = hashtag2;
	}
	public String getHashtag3() {
		return hashtag3;
	}
	public void setHashtag3(String hashtag3) {
		this.hashtag3 = hashtag3;
	}
	public String getHashtag4() {
		return hashtag4;
	}
	public void setHashtag4(String hashtag4) {
		this.hashtag4 = hashtag4;
	}
	public String getHashtag5() {
		return hashtag5;
	}
	public void setHashtag5(String hashtag5) {
		this.hashtag5 = hashtag5;
	}
	public String getHashtag6() {
		return hashtag6;
	}
	public void setHashtag6(String hashtag6) {
		this.hashtag6 = hashtag6;
	}

	@Override
	public String toString() {
		return "HashtagVO [board_num=" + board_num + ", hashtag1=" + hashtag1 + ", hashtag2=" + hashtag2 + ", hashtag3="
				+ hashtag3 + ", hashtag4=" + hashtag4 + ", hashtag5=" + hashtag5 + ", hashtag6=" + hashtag6 + "]";
	}
}
