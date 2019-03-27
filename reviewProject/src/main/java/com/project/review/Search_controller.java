package com.project.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonArray;
import com.project.review.service.MemberService;
import com.project.review.service.MovieService;
import com.project.review.service.SearchService;
import com.project.review.vo.BoardVO;
import com.project.review.vo.MovieApiVO;

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
	
	@RequestMapping("/autocomplete")
	public void searchBook(String s_title, String s_sort, HttpServletResponse response) throws IOException {
		JsonArray jsonArr = searchService.s_autocomplete(s_title, s_sort); 

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(jsonArr);
	}
	
	@RequestMapping("/searchResult")
	public String searchResult(HttpServletRequest request, HttpSession session, Model model) {
		String s_title = request.getParameter("s_title");
		String s_sort = request.getParameter("s_sort");
		System.out.println(s_title+","+s_sort);
		
		if (s_title!="") {
			switch (s_sort) {
				case "movie":
					List<MovieApiVO> movie = searchService.searchMovie(s_title);
					model.addAttribute("movieList", movie);
					break;
				default:
					break;
			}
		}
		List<BoardVO> board = searchService.searchTitle(s_title);
		model.addAttribute("board", board);
		
		
		return "share/searchResult";
	}
	
	@RequestMapping(value="/main")
	public String searchMain() {
		
		return "share/searchResult";
	}
	
	
}
