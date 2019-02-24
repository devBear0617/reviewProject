package com.project.review.dao;

import java.util.List;

import com.project.review.vo.MemberVO;

public interface MemberDAO {
	
	// 마이페이지 확인
	public MemberVO MemberInfo(String member_id);
	
	// 가입
	public void joinMember(MemberVO member);
	
	// 로그인
	public MemberVO selectMember(String member_id);
	
}
