package com.project.review;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
import com.project.review.vo.BoardVO;
import com.project.review.vo.LikeItVO;
import com.project.review.vo.LoginApiBO;
import com.project.review.vo.MemberVO;
import com.project.review.vo.Pagination;
import com.project.review.vo.ReplyVO;


@Controller
@RequestMapping(value="/mypage")
public class Mypage_controller {
	private LoginApiBO loginApiVO;
	@Autowired
    private void setNaverLoginBO(LoginApiBO loginApiVO) {
        this.loginApiVO = loginApiVO;
    }
	
	@Resource(name="uploadPathS")
	String uploadPathS;
	@Resource(name="uploadPathE")
	String uploadPathE;
	
	@Autowired
	private MemberService memberService;
	

	// eamil ID,PW | smtp 설정 필수!
	final String emailSender = "chun6153"; 
	final String emailPW = "cjsdnd!47"; 

	
//---------------------------------------------------------------
	
	// 비번찾기
	@RequestMapping(value="/findInfo/searchPW")
	public String searchPWGET() {
		
		return "mypage/searchPW";
	}
	@RequestMapping(value="/findInfo/searchPW", method=RequestMethod.POST)
	public String searchPWPOST(HttpServletRequest request, MemberVO member) 
			throws AddressException, MessagingException {
		
		MemberVO memberInfo = memberService.searchMemberID(member);
		System.out.println(memberInfo);
		
		if(memberInfo == null) {
			return "mypage/searchFail";
		}
		
		String host = "smtp.naver.com"; 
		int port=465; 

		String recipient = memberInfo.getMember_email(); 
		String subject = "[REMON!] PW 찾기 확인 이메일."; 
		String body = memberInfo.getMember_name() + "님(" + memberInfo.getMember_id() + ")의 PW 정보입니다. { " + memberInfo.getMember_pw() + " }"; 
		Properties props = System.getProperties(); 
		
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host); 
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=emailSender; 
			String pw=emailPW; 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
				return new javax.mail.PasswordAuthentication(un, pw); 
				} 
			}); 
		session.setDebug(true); 

		Message mimeMessage = new MimeMessage(session); 
		mimeMessage.setFrom(new InternetAddress("chun6153@naver.com")); 
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
		mimeMessage.setSubject(subject); 
		mimeMessage.setText(body);
		Transport.send(mimeMessage); 
				
		return "mypage/findCheck";
	}
	
	// 아디찾기
	@RequestMapping(value="/findInfo/searchID")
	public String searchIDGET() {
		
		return "mypage/searchID";
	}
	@RequestMapping(value="/findInfo/searchID", method=RequestMethod.POST)
	public String searchIDPOST(HttpServletRequest request, MemberVO member) 
			throws AddressException, MessagingException {
	
		MemberVO memberInfo = memberService.searchMemberID(member);
		System.out.println(memberInfo);
		if(memberInfo == null) {
			return "mypage/searchFail";
		}
		
		// 네이버일 경우 smtp.naver.com 을 입력합니다. 
		// Google일 경우 smtp.gmail.com 을 입력합니다. 
		String host = "smtp.naver.com"; 
		
		// 사용하는 아이디의 smtp설정 필수! 위에서 final로 지정.
		// @nave.com를 뺀 아이디 입력. 
		// final String emailSender = ""; 
		// 네이버 이메일 비밀번호 입력. 
		// final String emailPW = ""; 
		// 네이버의 포트번호 
		int port=465; 
		
		// 발신 메일의 내용 		
		// 수신자 메일주소 
		String recipient = memberInfo.getMember_email(); 
		//메일 제목  
		String subject = "[REMON!] ID 찾기 확인 이메일."; 
		//메일 내용  
		String body = memberInfo.getMember_name() + "님의 ID 정보입니다. { " + memberInfo.getMember_id() + " } "; 
		// 정보를 담기 위한 객체 생성
		Properties props = System.getProperties(); 
		
		// SMTP 서버 정보 설정 
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host); 
		
		//Session 생성 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=emailSender; 
			String pw=emailPW; 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
				return new javax.mail.PasswordAuthentication(un, pw); 
				} 
			}); 
		session.setDebug(true); 
		//for debug 
		
		//MimeMessage 생성
		Message mimeMessage = new MimeMessage(session); 
		//발신자 셋팅 , 발신자 이메일주소를 한번 더 입력. 메일주소 풀로 작성. 
		mimeMessage.setFrom(new InternetAddress("chun6153@naver.com")); 
		//수신자셋팅 
		//.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
		
		//제목셋팅
		mimeMessage.setSubject(subject); 
		//내용셋팅 
		mimeMessage.setText(body);
		//javax.mail.Transport.send() 이용
		Transport.send(mimeMessage); 
				
		return "mypage/findCheck";
	}
	
	// 아디비번찾기
	@RequestMapping(value="/findInfo")
	public String findInfo() {
		
		return "mypage/findInfo";
	}
	
	
	/*alreadyWritten*/
	@RequestMapping(value="/alreadyWritten")
	public String GETalreadyWrittenBoard(HttpSession session, HttpServletRequest request, Model model) {
		
		String user_id = (String)session.getAttribute("member_id");
		
		MemberVO user = memberService.MemberInfo(user_id);
	System.out.println("MemberVO user = " + user);
		model.addAttribute("user", user);
		
		return "mypage/alreadyWritten";
		
	}
	
	/*alreadyWritten_Board*/
	@RequestMapping(value="/alreadyWritten/alreadyWritten_Board")
	public String alreadyWritten_Board(HttpSession session, int pnum, Model model) {	
		
		String user_id = (String)session.getAttribute("member_id");
					
		MemberVO user = memberService.MemberInfo(user_id);
		model.addAttribute("user", user);					
		List<BoardVO> myBoard = memberService.myBoard(user_id, pnum);
		
		
		Pagination pagination = new Pagination();
		int size = memberService.myBoardCount(user_id);
		
		pagination.setPage(pnum, size);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("myBoard", myBoard);
				
		return "mypage/alreadyWritten_Board";
	}
	
	/*alreadyWritten_Reply*/
	@RequestMapping(value="/alreadyWritten/alreadyWritten_Reply")
	public String alreadyWritten_Reply(HttpSession session, int pnum, Model model) {
		
		String user_id = (String)session.getAttribute("member_id");
		
		MemberVO user = memberService.MemberInfo(user_id);
	//System.out.println("MemberVO user = " + user);
		model.addAttribute("user", user);
		
		List<ReplyVO> myReply = memberService.myReply(user_id, pnum);
	//System.out.println("myReply list : " + myReply);
		
		Pagination pagination = new Pagination();
		int size = memberService.myReplyCount(user_id);
		pagination.setPage(pnum, size);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("myReply", myReply);
		
		return "mypage/alreadyWritten_Reply";
	}
	
	/*alreadyWritten_Like*/
	@RequestMapping(value="/alreadyWritten/alreadyWritten_Like")
	public String alreadyWritten_Like(HttpSession session, int pnum, Model model) {
		
		String user_id = (String)session.getAttribute("member_id");
		
		MemberVO user = memberService.MemberInfo(user_id);
	//System.out.println("MemberVO user = " + user);
		model.addAttribute("user", user);
		
		List<LikeItVO> myLike = memberService.myLike(user_id, pnum);
	//System.out.println("myLike list : " + myLike);
		
		Pagination pagination = new Pagination();
		int size = memberService.myLikeCount(user_id);
		pagination.setPage(pnum, size);
		
		model.addAttribute("pagination", pagination);		
		model.addAttribute("myLike", myLike);
		
		return "mypage/alreadyWritten_Like";
	}
	
	/*alreadyWritten_menuBoard*/
	@RequestMapping(value="alreadyWritten/alreadyWritten_menuBoard")
	public String alreadyWritten_menuBoard() {
		
		return "mypage/alreadyWritten_menuBoard";
	}
	
	/*alreadyWritten_menuReply*/
	@RequestMapping(value="alreadyWritten/alreadyWritten_menuReply")
	public String alreadyWritten_menuReply() {
		
		return "mypage/alreadyWritten_menuReply";
	}
	
	/*alreadyWritten_menuLike*/
	@RequestMapping(value="alreadyWritten/alreadyWritten_menuLike")
	public String alreadyWritten_menuLike() {
		
		return "mypage/alreadyWritten_menuLike";
	}
	
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
		
		System.out.println("File name : " + file.getOriginalFilename());
		System.out.println("File size : " + file.getSize());
		System.out.println("Content type : " + file.getContentType());
		
		String member_id = request.getParameter("member_id");
		String member_pic = "";
		if (file.getSize() == 0) {
			member_pic = "DefaultPerson.png";
			
			memberService.updateProfile(member, member_id, member_pic);
		} else {
			member_pic = member_id + "_" + file.getOriginalFilename();
			/*서버*/
			File fileS = new File(uploadPathS, member_pic);
			/*이클립스*/
			File fileE = new File(uploadPathE, member_pic);
			// 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
			// FileCopyUtils.cpoy(바이트배열, 파일객체)
			FileCopyUtils.copy(file.getBytes(), fileS);
			FileCopyUtils.copy(file.getBytes(), fileE);
			
			memberService.updateProfile(member, member_id, member_pic);
		}
		return "redirect:/mypage/mypageCheck";
		
	}
	
	// 정보 변경
	@RequestMapping(value="/updateLogin")
	public String updateLogin (HttpSession session, Model model) {
		String user_id = (String)session.getAttribute("member_id");
		
		model.addAttribute("member_id", user_id);
		
		return "mypage/updateLogin";
	}
	@RequestMapping(value="/updateMemberForm", method=RequestMethod.POST)
	public String updateMemberForm (HttpServletRequest request, MemberVO member, 
			HttpSession session, Model model) {
		String user_id = (String)session.getAttribute("member_id");
		String pw = request.getParameter("member_pw");
		
		MemberVO checkPW = memberService.updateCheckPW(member, user_id, pw);
		System.out.println(checkPW);
		if (checkPW != null) {
			MemberVO user = memberService.MemberInfo(user_id);
			model.addAttribute("user", user);
			
			return "mypage/updateMemberForm";			
		}
		//alert
		model.addAttribute("Alert", "입력하신 비밀번호가 다릅니다. 다시 입력해 주세요.");
		return "mypage/updateLogin";
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
	
	// 글쓰기 진입 로그인
	@RequestMapping(value="/writeLogin", method=RequestMethod.GET)
	public String loginFormWrite(HttpServletRequest request, Model model) {
		
		return "mypage/writeLogin";
	}
	@RequestMapping(value="/writeLogin", method=RequestMethod.POST)
	public String loginMemberWrite(String member_id, String member_pw, HttpServletRequest request,
			 HttpSession session, Model model) {

		member_id = request.getParameter("member_id");
		member_pw = request.getParameter("member_pw");
		
		MemberVO member = memberService.selectMember(member_id);
		
		String loginFail = "잘못된 아이디 및 비밀번호 입니다.";
		
		if (member != null) {
			String pw = member.getMember_pw();
				if(pw == null) {
					// 잘못된 아이디
					model.addAttribute("loginFail", loginFail);
					
					return "mypage/writeLogin";
					
				} else {
					// 아이디가 있음
					if(pw.equals(member_pw)) {
						// 비번 일치
						session.setAttribute("member_id", member_id);
						
						String user_id = (String)session.getAttribute("member_id");
						
						MemberVO user = memberService.MemberInfo(user_id);
						model.addAttribute("user", user);
			
						return "movie/movie_writeForm";
						
					} else {
						// 비번 불일치
						model.addAttribute("loginFail", loginFail);
						
						return "mypage/writeLogin";
					}
					
				}
		}
		// 노아이디
		session.invalidate();
		
		String noID = "아이디를 입력해주세요";
		model.addAttribute("loginFail", noID);
		
		return "mypage/writeLogin";
	}

	// 로그인
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm(HttpServletRequest request, Model model, HttpSession session) {
		String referer = request.getHeader("Referer");
		String naverAuthUrl = loginApiVO.getAuthorizationUrl(session);
		
		model.addAttribute("address", referer);
		model.addAttribute("url", naverAuthUrl);
		
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
			
						return "mypage/loginCheck";
						
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
	
	@RequestMapping(value="/loginCallback")
	public String loginCallbackTest (String code, String state, String address, HttpSession session, Model model) throws IOException {
		MemberVO member = memberService.handleSnsUser(code, state, session);
		
		session.setAttribute("member_id", member.getMember_id());
		model.addAttribute("user", member);
		
		return "redirect:/";
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
	// mypageLogout
	@RequestMapping(value="/mypageLogout")
	public String mypageLogout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	// searchLogout
	@RequestMapping(value="/searchLogout")
	public String searchLogout(HttpSession session) {
		session.invalidate();
		
		return "mypage/loginCheck";
	}
	
	// 가입
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinForm() {
		
		return "mypage/join";
	}
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinMember(HttpServletRequest request, MemberVO member, Model model) {
		
		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		String member_name = request.getParameter("member_name");
		String member_email = request.getParameter("member_email");
		System.out.println("id: "+member_id+", pw: "+member_pw+
				", name: "+member_name+", email: "+member_email);
		if (member_id.isEmpty() || member_pw.isEmpty() || 
				member_name.isEmpty() || member_email.isEmpty()) {
			
			return "redirect:/mypage/join";
		} else {
			memberService.joinMember(member);
			
			model.addAttribute("member_id", member_id);
			model.addAttribute("member_name", member_name);
			
			return "mypage/check";
		}
		
	}
	
	// idChecker
	@RequestMapping(value="/join/idChecker")
	public String idCheckerGET() {
		
		return "mypage/idChecker";
	}
	@RequestMapping(value="/join/idChecker", method=RequestMethod.POST)
	public String idChekerPOST(HttpServletRequest request, Model model) {
		
		String member_id = request.getParameter("ID");
		if(member_id.isEmpty()) {
			model.addAttribute("mem_id", member_id);
			
			return "mypage/idCheckNO";
		}
		
		String member = memberService.idCheck(member_id);
		if(member == null) {
			model.addAttribute("mem_id", member_id);
			
			return "mypage/idCheckOK";
		} 
		model.addAttribute("mem_id", member_id);
		
		return "mypage/idCheckNO";
	}

	// nmChecker
	@RequestMapping(value="/join/nmChecker")
	public String nmCheckerGET() {
		
		return "mypage/nmChecker";
	}
	@RequestMapping(value="/join/nmChecker", method=RequestMethod.POST)
	public String nmChekerPOST(HttpServletRequest request, Model model) {
		
		String member_name = request.getParameter("NM");
		if(member_name.isEmpty()) {
			model.addAttribute("mem_nm", member_name);
			
			return "mypage/nmCheckNO";
		}
		String member = memberService.nmCheck(member_name);
		if(member == null) {
			model.addAttribute("mem_nm", member_name);
			
			return "mypage/nmCheckOK";
		}
		model.addAttribute("mem_nm", member_name);
		
		return "mypage/nmCheckNO";
	}


	
}
