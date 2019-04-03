package com.project.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.review.dao.MemberDAO;
import com.project.review.vo.BoardVO;
import com.project.review.vo.LikeItVO;
import com.project.review.vo.MemberVO;
import com.project.review.vo.ReplyVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	//--------------------------------------
	
	// updateCheckPW
	@Override
	public MemberVO updateCheckPW(MemberVO member, String user_id, String pw) {
		
		member.setMember_id(user_id);
		member.setMember_pw(pw);
		return memberDAO.updateCheckPW(member);
	}
	
	// nmCheck
	@Override
	public String nmCheck(String member_name) {
		
		return memberDAO.nmCheck(member_name);
	}
	
	// idCheck
	@Override
	public String idCheck(String member_id) {
		
		return memberDAO.idCheck(member_id);
	}
	
	//searchMemberPW
	@Override
	public MemberVO searchMemberPW(MemberVO member) {
		
		return memberDAO.searchMemberPW(member);
	}
	
	// searchMemberID
	@Override
	public MemberVO searchMemberID(MemberVO member) {
		
		return memberDAO.searchMemberID(member);
	}
	
	// getMember_pic
	@Override
	public String getMember_pic(String member_id) {
		
		return memberDAO.getMember_pic(member_id);
	}
	
	// myLike
	@Override
	public List<LikeItVO> myLike(String member_id) {
		
		return memberDAO.myLike(member_id);
	}
	
	// myReply
	@Override
	public List<ReplyVO> myReply(String member_id) {
		
		return memberDAO.myReply(member_id);
	}
	
	// alreadyBoard
	@Override
	public List<BoardVO> myBoard(String member_id) {
		
		return memberDAO.myBoard(member_id);
	}
	
	// updateProfile
	@Override
	public void updateProfile(MemberVO member, String member_id, String member_pic) {
		
		member.setMember_id(member_id);
		member.setMember_pic(member_pic);
		memberDAO.updateProfile(member);
	}
	
	// 수정
	@Override
	public void updateMember(MemberVO member) {
		
		memberDAO.updateMember(member);
	}
	
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
	@Override
	public MemberVO selectMember(String member_id) {
		
		return memberDAO.selectMember(member_id);
	}


}
