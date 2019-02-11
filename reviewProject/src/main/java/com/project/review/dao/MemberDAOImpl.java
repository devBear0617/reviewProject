package com.project.review.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.review.vo.MemberVO;

public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO joinMember(MemberVO member) {
		
		return memberDAO.joinMember(member);
	}
	
}
