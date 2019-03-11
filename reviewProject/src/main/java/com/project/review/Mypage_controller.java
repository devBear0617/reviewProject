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
	private MemberService memberService;
	
	// 정보 변경
	@RequestMapping(value="/updateMember", method=RequestMethod.POST)
	public String updateMember (MemberVO member, HttpSession session, Model model) {
		
		memberService.updateMember(member);
	System.out.println(member);

		
		return "redirect:/mypage/mypageCheck";
	}
	
	// 정보 확인
	@RequestMapping(value="/mypageCheck", method=RequestMethod.GET)
	public String mypageCheckGET(HttpSession session, Model model) {
		
		String user_id = (String)session.getAttribute("member_id");
		
		MemberVO user = memberService.MemberInfo(user_id);
		model.addAttribute("user", user);

		return "mypage/mypageCheck";
	}
	
	// 로그인
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
						
						String user_id = (String)session.getAttribute("member_id");
						
						MemberVO user = memberService.MemberInfo(user_id);
						model.addAttribute("user", user);
						
						
						
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
	
	// 로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session, Model model) {
		model.addAttribute("message", "로그아웃 합니다.");
		// 로그아웃 세션끊기.
		session.invalidate();
		
		return "remon";
	}
	
	// 가입
	// @GetMapping(value="/join")
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinForm(Model model) {
		
		return "mypage/join";
	}
	// @PostMapping(value="/join")
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinMember(MemberVO member, Model model) {
		
		memberService.joinMember(member);
		
		return "mypage/check";
	}
	

	
}
