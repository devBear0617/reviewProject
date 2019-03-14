package com.project.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.review.dao.MemberDAO;
import com.project.review.vo.MemberVO;
import com.project.review.vo.UploadFileVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	// file
	public List<UploadFileVO> getFile() {
		
		return memberDAO.getFile();
	}
	public void uploadFile(UploadFileVO file) {
		
		memberDAO.uploadFile(file);
		
	}
	
	// 수정
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
	public MemberVO selectMember(String member_id) {
		
		return memberDAO.selectMember(member_id);
	}


}
