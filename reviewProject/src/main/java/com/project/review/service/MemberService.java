package com.project.review.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.project.review.vo.BoardVO;
import com.project.review.vo.LikeItVO;
import com.project.review.vo.MemberVO;
import com.project.review.vo.ReplyVO;

public interface MemberService {
	
	// searchMemberPW
	public MemberVO searchMemberPW(MemberVO member);
	
	// searchMemberID
	public MemberVO searchMemberID(MemberVO member);
	
	// getMember_pic
	public String getMember_pic(String member_id);
	
	// myLike
	public List<LikeItVO> myLike(String member_id, int pnum);
	public int myLikeCount(String member_id);
	
	// myReply
	public List<ReplyVO> myReply(String member_id, int pnum);
	public int myReplyCount(String member_id);
	// alreadyBoard
	public List<BoardVO> myBoard(String member_id, int pnum);
	public int myBoardCount(String member_id);
	
	
	// updateProfile
	public void updateProfile(MemberVO member, String member_id, String member_pic);
	
	// 수정
	public void updateMember(MemberVO member);
		// updateCheckPW
		public MemberVO updateCheckPW(MemberVO member, String user_id, String pw);
	
	// 가입
	public void joinMember(MemberVO member);
		// idCheck
		public String idCheck(String member_id);
		// nmCheck
		public String nmCheck(String member_name);
	public void joinSnsUser(MemberVO member);
	
	// 로그인
	public MemberVO selectMember(String member_id);
	
	// 마이페이지 확인
	public MemberVO MemberInfo(String member_id);
	
	public MemberVO handleSnsUser(String code, String state, HttpSession session) throws IOException;
}
