package com.project.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/game")
public class Game_controller {

	@RequestMapping(value="/main")
	public String main(HttpServletRequest request, Model model) {
		
		String referer = request.getHeader("Referer");
	System.out.println(referer);
		model.addAttribute("address", referer);
		
		return "game/main";
	}
	
	
}
