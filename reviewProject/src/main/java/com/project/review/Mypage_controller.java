package com.project.review;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.review.service.MemberService;
import com.project.review.vo.MemberVO;
import com.project.review.vo.itemBean;


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
	public String loginForm(HttpServletRequest request, Model model) {
		
		String referer = request.getHeader("Referer");
	System.out.println(referer);
		model.addAttribute("address", referer);
		
		return "mypage/login";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginMember(String member_id, String member_pw, HttpServletRequest request,
			 HttpSession session, Model model) {

		member_id = request.getParameter("member_id");
		member_pw = request.getParameter("member_pw");
		
		MemberVO member = memberService.selectMember(member_id);
		
		String loginFail = "잘못된 아이디 및 비밀번호";
		
		if (member != null) {
			String pw = member.getMember_pw();
				if(pw == null) {
					// 잘못된 아이디
					model.addAttribute("loginFail", loginFail);
					
					return "mypage/login";
					
				} else {
					// 아이디가 있음
					if(pw.equals(member_pw)) {
						// 비번 일치
						session.setAttribute("member_id", member_id);
						
						String user_id = (String)session.getAttribute("member_id");
						
						MemberVO user = memberService.MemberInfo(user_id);
						model.addAttribute("user", user);
						
						String address = request.getParameter("address");
					System.out.println(address);
			
						return "redirect:"+address;
						
					} else {
						// 비번 불일치
						model.addAttribute("loginFail", loginFail);
						
						return "mypage/login";
					}
					
				}
		}
		// 노아이디
		session.invalidate();
		
		String noID = "아이디를 입력해주세요";
		model.addAttribute("loginFail", noID);
		
		return "mypage/login";
	}
	
	// 로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request, HttpSession session, Model model) {
		String referer = request.getHeader("Referer");
	System.out.println(referer);
		// 로그아웃 세션끊기.
		session.invalidate();
		
		return "redirect:"+referer;
	}
	
	// 가입
	// @GetMapping(value="/join")
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinForm(Model model) {
		
		return "mypage/join";
	}
	// @PostMapping(value="/join")
	/*@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinMember(MemberVO member, Model model, MultipartHttpServletRequest request) {
		MultipartFile JJ = request.getFile("member_pic");
	System.out.println(JJ);
		memberService.joinMember(member);
		model.addAttribute("JJ", JJ);
		
		
		return "mypage/check";
	}*/
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinMember(MemberVO member, Model model, itemBean itemBean, 
			@RequestParam("file")MultipartFile file) {
		model.addAttribute("file", file);
		
		return "mypage/check";
	}

	
}
