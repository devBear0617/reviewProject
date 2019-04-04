package com.project.review.dao;

import java.util.List;
import java.util.Map;

import com.project.review.vo.BoardVO;
import com.project.review.vo.LikeItVO;
import com.project.review.vo.MemberVO;
import com.project.review.vo.ReplyVO;

public interface MemberDAO {
	
	// searchMemberPW
	public MemberVO searchMemberPW(MemberVO member);
	
	// searchMemberID
	public MemberVO searchMemberID(MemberVO member);
	
	// getMember_pic
	public String getMember_pic(String member_id);
	
	// myLike
	public List<LikeItVO> myLike(Map<String,Object> map);
	public int myLikeCount(String member_id);
	
	// myReply
	public List<ReplyVO> myReply(Map<String,Object> map);
	public int myReplyCount(String member_id);
	
	//alreadyBoard
	public List<BoardVO> myBoard(Map<String,Object> map);
	public int myBoardCount(String member_id);
	
	// updateProfile
	public void updateProfile(MemberVO member_pic);
	
	// 수정
	public void updateMember(MemberVO member);
	
	// 마이페이지 확인
	public MemberVO MemberInfo(String member_id);
	
	// 가입
	public void joinMember(MemberVO member);
		// idCheck
		public String idCheck(String member_id);
	
	// 로그인
	public MemberVO selectMember(String member_id);
	
}
