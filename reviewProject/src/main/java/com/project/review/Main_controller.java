package com.project.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class Main_controller {	
	
	@RequestMapping(value="/back", method=RequestMethod.POST)
	   public String back(Model model, HttpServletRequest request) {
	      
	      String backAdd = request.getParameter("address");
	   System.out.println(backAdd);
	      model.addAttribute("backAdd", backAdd);
	      
	      return "redirect:" + backAdd;
	   }
	
	@RequestMapping(value="/")
	public String remon(Model model) {
		
		return "remon";
	}
}















