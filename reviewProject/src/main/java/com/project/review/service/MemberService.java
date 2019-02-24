package com.project.review.service;

import java.util.List;

import com.project.review.vo.MemberVO;

public interface MemberService {
	
	// 수정
	public void updateMember(MemberVO member);
	
	// 가입
	public void joinMember(MemberVO member);
	
	// 로그인
	public MemberVO selectMember(String member_id);
	
	// 마이페이지 확인
	public MemberVO MemberInfo(String member_id);
}
