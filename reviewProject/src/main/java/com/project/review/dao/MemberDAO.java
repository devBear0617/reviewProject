package com.project.review.dao;

import java.util.List;

import com.project.review.vo.MemberVO;
import com.project.review.vo.UploadFileVO;

public interface MemberDAO {
	
	// file
	public void uploadFile(UploadFileVO file);
	public List<UploadFileVO> getFile();
	
	// 수정
	public void updateMember(MemberVO member);
	
	// 마이페이지 확인
	public MemberVO MemberInfo(String member_id);
	
	// 가입
	public void joinMember(MemberVO member);
	
	// 로그인
	public MemberVO selectMember(String member_id);
	
}
