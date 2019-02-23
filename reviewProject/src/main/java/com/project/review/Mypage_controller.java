package com.project.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String loginMember(String member_id, String member_pw, HttpServletRequest request,
			HttpSession session, Model model) {

		member_id = request.getParameter("member_id");
		member_pw = request.getParameter("member_pw");
		
		MemberVO member = memberService.selectMember(member_id);
		
		if (member != null) {
			String pw = member.getMember_pw();
				if(pw == null) {
					// 아이디가 없음
					model.addAttribute("message", "등록된 아이디가 없음.");
				} else {
					// 아이디가 있음
					if(pw.equals(member_pw)) {
						// 비번 일치
						session.setAttribute("member_id", member_id);
						
						return "mypage/loginCheck";
						
					} else {
						// 비번 불일치
						model.addAttribute("message", "잘못된 패스워드.");
					}
				}
		} else {
			model.addAttribute("message", "잘못된 아이디.");
		}
		session.invalidate();
		
		return "mypage/login";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		// 로그아웃 세션끊기.
		session.invalidate();
		
		return "remon";
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
