package com.project.review;


import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.review.service.MemberService;
import com.project.review.vo.MemberVO;


@Controller
@RequestMapping(value="/mypage")
public class Mypage_controller {
	
	@Resource(name="uploadPath1")
	String uploadPath1;
	
	@Autowired
	private MemberService memberService;
	
	/*upload*/
	@RequestMapping(value="/profileUpload_BT")
	public String profileUpload_BT () {
		
		return "mypage/profileUpload_BT";
	}
	
	@RequestMapping(value="/profileUpload")
	public String profileUploadGET () {
		
		return "mypage/profileUpload";
	}
	@RequestMapping(value="/profileUpload", method=RequestMethod.POST)
	public String profileUploadPOST(HttpServletRequest request, MemberVO member,
			MultipartFile file, ModelAndView mav, HttpSession session) throws IOException {
		
		/*이클립스의 window-preference 에 들어가서 general-workspace 에 보면
		refresh using native hooks or polling 과 save automatically before build 이 두 항목을 체크해주면
		빌드 되기전에 리프레시를 먼저 하여 파일을 인식할 수 있게 된다.*/
		
		System.out.println("File name : " + file.getOriginalFilename());
		System.out.println("File size : " + file.getSize());
		System.out.println("Content type : " + file.getContentType());
		
		String path = session.getServletContext().getRealPath("/");
		System.out.println("path : " + path);
		
		String pic = file.getOriginalFilename();
/*	System.out.println("pic : " + pic);
		if (pic.equals(null)) {
			System.out.println("success");
		}*/
		String member_id = request.getParameter("member_id");
		String member_pic = pic;
		/*String member_pic = "";
		if (pic != null) {			
			member_pic = member_id + "_" + pic;
		} else if (pic.equals("")) {
			member_pic = "";
		}*/
	System.out.println(member_pic);
		File target = new File(uploadPath1, member_pic);
		memberService.updateProfile(member, member_id, member_pic);
		// 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
		// FileCopyUtils.cpoy(바이트배열, 파일객체)
		FileCopyUtils.copy(file.getBytes(), target);
		
		return "redirect:/mypage/mypageCheck";
	}
	
	/*@RequestMapping(value="/profileUpload", method=RequestMethod.POST)
	public ModelAndView profileUploadPOST(HttpServletRequest request, 
			MultipartFile file, ModelAndView mav) throws IOException {
		
		
		
		System.out.println("File name : " + file.getOriginalFilename());
		System.out.println("File size : " + file.getSize());
		System.out.println("Content type : " + file.getContentType());
		
		String saveName = file.getOriginalFilename();
		File target = new File(uploadPath, saveName);
		
		// 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
		// FileCopyUtils.cpoy(바이트배열, 파일객체)
		FileCopyUtils.copy(file.getBytes(), target);
		
		mav.setViewName("mypage/uploadCheck"); // 뷰의 이름
	    mav.addObject("saveName", saveName); // 뷰로 보낼 데이터 값
		
		return mav;
	}*/
	
	// 정보 변경
	@RequestMapping(value="/updateMemberForm")
	public String updateMemberForm (MemberVO member, HttpSession session, Model model) {
		String user_id = (String)session.getAttribute("member_id");
		
		MemberVO user = memberService.MemberInfo(user_id);
		model.addAttribute("user", user);
		
		return "mypage/updateMemberForm";
	}
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
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinMember(MemberVO member, Model model) {
		
		memberService.joinMember(member);
		
		return "mypage/check";
	}
	

	
}
