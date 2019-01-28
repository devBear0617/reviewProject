package com.project.review.vo;

import java.util.Date;

public class BoardVO {
	
	private int boardnum;
	private String boardname;
	private Date boarddate;
	private Date boardupdate;
	private String boardcount;
	private String boardcontent;
	private int like_count;
	private int com_count;
	private String id;
	
	
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getBoardname() {
		return boardname;
	}
	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}
	public Date getBoarddate() {
		return boarddate;
	}
	public void setBoarddate(Date boarddate) {
		this.boarddate = boarddate;
	}
	public Date getBoardupdate() {
		return boardupdate;
	}
	public void setBoardupdate(Date boardupdate) {
		this.boardupdate = boardupdate;
	}
	public String getBoardcount() {
		return boardcount;
	}
	public void setBoardcount(String boardcount) {
		this.boardcount = boardcount;
	}
	public String getBoardcontent() {
		return boardcontent;
	}
	public void setBoardcontent(String boardcontent) {
		this.boardcontent = boardcontent;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getCom_count() {
		return com_count;
	}
	public void setCom_count(int com_count) {
		this.com_count = com_count;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "BoardVO [boardnum=" + boardnum + ", boardname=" + boardname + ", boarddate=" + boarddate
				+ ", boardupdate=" + boardupdate + ", boardcount=" + boardcount + ", boardcontent=" + boardcontent
				+ ", like_count=" + like_count + ", com_count=" + com_count + ", id=" + id + "]";
	}
	
	
	
	
}
