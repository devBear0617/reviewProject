package com.project.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.review.service.MemberService;


@Controller
public class Main_controller {	
	
	@Autowired
	private MemberService memberService;
	
	// back버튼
	@RequestMapping(value="/back", method=RequestMethod.POST)
	public String back(Model model, HttpServletRequest request) {
	      
		String backAdd = request.getParameter("address");
	System.out.println(backAdd);
		model.addAttribute("backAdd", backAdd);
	      
		return "redirect:" + backAdd;
	}
	
	@RequestMapping(value="/")
	public String remon(HttpSession session, Model model) {
		
		String member_id = (String) session.getAttribute("member_id");
		if (member_id != null) {
			String member_pic = memberService.getMember_pic(member_id);
			model.addAttribute("member_pic", member_pic);
		}
		
		return "remon";
	}
}















