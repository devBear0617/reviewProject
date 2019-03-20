package com.project.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.review.service.MemberService;
import com.project.review.service.MovieService;
import com.project.review.service.SearchService;
import com.project.review.vo.BoardVO;

@Controller
@RequestMapping(value="/search")
public class Search_controller {

	@Autowired
	private SearchService searchService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private MemberService memberService;
	
	//-------------------------------------------
	
	@RequestMapping(value="/searchResult", method = RequestMethod.POST)
	public String searchResult(HttpServletRequest request, HttpSession session, Model model) {
		
		String s_title = request.getParameter("s_title");
		List<BoardVO> board = searchService.searchTitle(s_title);
		model.addAttribute("board", board);
		
		return "share/searchResult";
	}
	
	@RequestMapping(value="/main")
	public String searchMain() {
		
		return "share/search";
	}
	
	
}
