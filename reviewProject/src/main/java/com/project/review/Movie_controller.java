package com.project.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

@RequestMapping(value="/movie")
public class Movie_controller {
	
	@RequestMapping(value="/main")
	public String movie(HttpServletRequest request, Model model) {
		
		
		return "movie/main";
	}
	
	@RequestMapping(value="/detail_view")
	public String detail_view(HttpServletRequest request, Model model) {
		
		
		return "movie/detail_view";
	}
	
	
	
}
