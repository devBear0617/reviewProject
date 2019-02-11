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
	public String login() {
		
		return "mypage/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(MemberVO member, HttpServletRequest request, Model model) {
		
		request.getParameter("member_id");
		request.getParameter("member_pw");
		
		
		
		return "mypage/check";
	}
	
	// @GetMapping(value="/join")
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join (Model model) {
		
		return "mypage/join";
	}
	
	//@PostMapping(value="/join")
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(MemberVO member, Model model) {
		
		/*String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		String member_name = request.getParameter("member_name");
		System.out.println(member_id);
		System.out.println(member_pw);
		System.out.println(member_name);
		
		model.addAttribute("member_id", member_id);
		model.addAttribute("member_pw", member_pw);
		model.addAttribute("member_name", member_name);*/
		
		memberService.joinMember(member);
		
		return "mypage/check";
	}
	
/*	@RequestMapping(value="check")
	public String check(){
		
		return "mypage/check";
	}*/
	
}
