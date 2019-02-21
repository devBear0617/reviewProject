package com.project.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.review.service.MemberService;
import com.project.review.vo.MemberVO;


@Controller
@RequestMapping(value="/mypage")
public class Mypage_controller {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		
		return "mypage/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginMember(MemberVO member, HttpServletRequest request, Model model) {
		
		/*String id = request.getParameter("member_id");
		memberService.loginMemberID(id);

		String pw = request.getParameter("member_pw");
	
		return "mypage/check";*/
		
		String url = "loginFail";
		String id = request.getParameter("member_id");
		String pw = request.getParameter("member_pw");
		
		int result = memberService.userCheck(id, pw);
		
		if (result == 1) {
			
			url = "loginCheck";
		} else if (result == 0) {
			
		} else if (result == -1) {
			
		}
		
		return "mypage/"+url;
	}
	
	// @GetMapping(value="/join")
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinForm(Model model) {
		
		return "mypage/join";
	}
	
	//@PostMapping(value="/join")
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinMember(MemberVO member, Model model) {
		
		memberService.joinMember(member);
		
		return "mypage/check";
	}
	

	
}
