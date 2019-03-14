package com.project.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class Main_controller {	
	
	@RequestMapping(value="/back")
	public String back(Model model, HttpServletRequest request) {
		
		String referer = request.getHeader("Referer");
	System.out.println(referer);
		
		return "redirect:"+referer;
	}
	
	@RequestMapping(value="/")
	public String remon(Model model) {
		
		return "remon";
	}
}















