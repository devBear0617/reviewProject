package com.project.review.vo;

import java.util.Date;

public class BoardcommentVO {
	
	private int com_num;
	private String id;
	private String com_content;
	private Date com_date;
	private Date com_update;
	private int boardnum;
	
	
	public int getCom_num() {
		return com_num;
	}
	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public Date getCom_date() {
		return com_date;
	}
	public void setCom_date(Date com_date) {
		this.com_date = com_date;
	}
	public Date getCom_update() {
		return com_update;
	}
	public void setCom_update(Date com_update) {
		this.com_update = com_update;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	
	@Override
	public String toString() {
		return "BoardcommentVO [com_num=" + com_num + ", id=" + id + ", com_content=" + com_content + ", com_date="
				+ com_date + ", com_update=" + com_update + ", boardnum=" + boardnum + "]";
	}
	
	
}
