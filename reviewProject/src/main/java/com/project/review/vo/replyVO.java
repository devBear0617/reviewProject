package com.project.review.vo;

public class replyVO {
	
	private int REPLY_NUM;
	private String REPLY_CONTENT;
	
	public int getREPLY_NUM() {
		return REPLY_NUM;
	}
	public void setREPLY_NUM(int rEPLY_NUM) {
		REPLY_NUM = rEPLY_NUM;
	}
	public String getREPLY_CONTENT() {
		return REPLY_CONTENT;
	}
	public void setREPLY_CONTENT(String rEPLY_CONTENT) {
		REPLY_CONTENT = rEPLY_CONTENT;
	}
	
	@Override
	public String toString() {
		return "replyVO [REPLY_NUM=" + REPLY_NUM + ", REPLY_CONTENT=" + REPLY_CONTENT + "]";
	}
	
	
	
}
