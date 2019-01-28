package com.project.review;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class Main_controller {	
	@RequestMapping(value="/")
	public String remon(Model model) {
		
		return "remon";
		
	}
	
	
}















