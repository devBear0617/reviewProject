package com.project.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.review.dao.MemberDAO;
import com.project.review.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	// 마이페이지 확인
	@Override
	public MemberVO MemberInfo(String member_id) {
		
		return memberDAO.MemberInfo(member_id);
	}
	
	// 가입
	@Override
	public void joinMember(MemberVO member) {
		
		memberDAO.joinMember(member);
	}
	
	// 로그인
	public MemberVO selectMember(String member_id) {
		
		return memberDAO.selectMember(member_id);
	}


}
