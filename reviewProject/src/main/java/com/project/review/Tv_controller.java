package com.project.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.review.service.TvService;
import com.project.review.vo.BoardVO;

@Controller
@RequestMapping(value="/tv")
public class Tv_controller {
	
	@Autowired
	private TvService tvService;
	
	@RequestMapping(value="/main")
	public String tv(HttpServletRequest request, Model model) {
		
		List<BoardVO> tvboard_list = tvService.getTvBoardList();
		model.addAttribute("tvboard_list" , tvboard_list);
		return "tv/main";
		
	}
	

	
}
