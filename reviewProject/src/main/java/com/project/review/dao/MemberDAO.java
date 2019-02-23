package com.project.review.dao;

import com.project.review.vo.MemberVO;

public interface MemberDAO {
	
	// 가입
	public void joinMember(MemberVO member);
	
	// 로그인
	public MemberVO selectMember(String member_id);
	
}
