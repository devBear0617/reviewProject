package com.project.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.review.dao.MemberDAO;
import com.project.review.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO joinMember(MemberVO member) {
		
		return memberDAO.joinMember(member);
	}

}
