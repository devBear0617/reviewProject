package com.project.review.vo;

public class MemberVo {
	
	private String MEMBER_ID;
	private String MEMBER_PW;
	private String MEMBER_NAME;
	
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getMEMBER_PW() {
		return MEMBER_PW;
	}
	public void setMEMBER_PW(String mEMBER_PW) {
		MEMBER_PW = mEMBER_PW;
	}
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
	
	@Override
	public String toString() {
		return "MemberVo [MEMBER_ID=" + MEMBER_ID + ", MEMBER_PW=" + MEMBER_PW + ", MEMBER_NAME=" + MEMBER_NAME + "]";
	}
	
	
}
