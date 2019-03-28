package com.project.review;

import java.util.ArrayList;
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

	
	//-------------------------------------------
	
	// only TV search
	@RequestMapping(value="/searchResult/result_TV_only", method=RequestMethod.POST)
	public String result_TV_only(HttpServletRequest request, HttpSession session, Model model) {
		
		String keyword = request.getParameter("keyword");
		List<BoardVO> search_Result = searchService.searchTV(keyword);
		System.out.println(search_Result);
		model.addAttribute("search_Result", search_Result);
		
		return "share/result_Board";
	}
	
	// only Game search
	@RequestMapping(value="/searchResult/result_Game_only", method=RequestMethod.POST)
	public String result_Game_only(HttpServletRequest request, HttpSession session, Model model) {
		
		String keyword = request.getParameter("keyword");
		List<BoardVO> search_Result = searchService.searchGame(keyword);
		System.out.println(search_Result);
		model.addAttribute("search_Result", search_Result);
		
		return "share/result_Board";
	}
	
	// Movie - grade desc
	@RequestMapping(value="/searchResult/result_Movie_grade", method=RequestMethod.POST)
	public String result_Movie_grade(HttpServletRequest request, HttpSession session, Model model) {
		
		String keyword = request.getParameter("keyword");
		List<BoardVO> search_Result = searchService.searchMovie_Grade(keyword);
		System.out.println(search_Result);
		model.addAttribute("search_Result", search_Result);

		return "share/result_Board";
	}
	
	// Movie - title,content
	@RequestMapping(value="/searchResult/result_Movie_titleContent", method=RequestMethod.POST)
	public String result_Movie_titleContent(HttpServletRequest request, HttpSession session, Model model) {
		
		String keyword = request.getParameter("keyword");
		List<BoardVO> search_Result = searchService.searchMovie_titleContent(keyword);
		System.out.println(search_Result);
		model.addAttribute("search_Result", search_Result);

		return "share/result_Board";
	}
	
	// Movie - hashtag
	@RequestMapping(value="/searchResult/result_Movie_hashtag", method=RequestMethod.POST)
	public String result_Movie_hashtag(HttpServletRequest request, HttpSession session, Model model) {
		
		String keyword = request.getParameter("keyword");
		List<BoardVO> search_Result = searchService.searchMovie_Hashtag(keyword);
		System.out.println(search_Result);
		model.addAttribute("search_Result", search_Result);

		return "share/result_Board";
	}
	
	// Movie - reply
	@RequestMapping(value="/searchResult/result_Movie_reply", method=RequestMethod.POST)
	public String result_Movie_reply(HttpServletRequest request, HttpSession session, Model model) {
		
		String keyword = request.getParameter("keyword");
		List<BoardVO> search_Result = searchService.searchMovie_ReplyContent(keyword);
		System.out.println(search_Result);
		model.addAttribute("search_Result", search_Result);

		return "share/result_Board";
	}
	
	// Movie - member
	@RequestMapping(value="/searchResult/result_Movie_member", method=RequestMethod.POST)
	public String result_Movie_member(HttpServletRequest request, HttpSession session, Model model) {
		
		String keyword = request.getParameter("keyword");
		List<BoardVO> search_Result = searchService.searchMovie_Member(keyword);
		System.out.println(search_Result);
		model.addAttribute("search_Result", search_Result);
		
		return "share/result_Board";
	}
	
	// only Movie search
	@RequestMapping(value="/searchResult/result_Movie_only", method=RequestMethod.POST)
	public String result_Movie_only(HttpServletRequest request, HttpSession session, Model model) {
		
		String keyword = request.getParameter("keyword");
		List<BoardVO> search_Result = searchService.searchMovie(keyword);
		System.out.println(search_Result);
		model.addAttribute("search_Result", search_Result);
		
		return "share/result_Board";
	}
	
	// Total search
	@RequestMapping(value="/searchResult/result_Total", method=RequestMethod.POST)
	public String result_Total(HttpServletRequest request, HttpSession session, Model model) {
		
		String keyword = request.getParameter("keyword");
		List<BoardVO> search_Result = searchService.searchTotal(keyword);
		System.out.println(search_Result);
		model.addAttribute("search_Result", search_Result);
		
		return "share/result_Board";
	}
	
	
	// Movie Menu's (V)
	@RequestMapping(value="/searchResult/menu_Movie_gradeV")
	public String menu_Movie_gradeV() {
		
		return "share/menu_Movie_gradeV";
	}
	
	@RequestMapping(value="/searchResult/menu_Movie_titleContentV")
	public String menu_Movie_titleContentV() {
		
		return "share/menu_Movie_titleContentV";
	}
	
	@RequestMapping(value="/searchResult/menu_Movie_hashtagV")
	public String menu_Movie_hashtagV() {
		
		return "share/menu_Movie_hashtagV";
	}
	
	@RequestMapping(value="/searchResult/menu_Movie_replyV")
	public String menu_Movie_replyV() {
		
		return "share/menu_Movie_replyV";
	}
	
	@RequestMapping(value="/searchResult/menu_Movie_memberV")
	public String menu_Movie_memberV() {
		
		return "share/menu_Movie_memberV";
	}
	
	@RequestMapping(value="/searchResult/menu_Movie_V")
	public String menu_Movie_V() {
		
		return "share/menu_Movie_V";
	}
	
	// Game Menu's (V)
	@RequestMapping(value="/searchResult/menu_Movie_V")
	public String menu_Game_V() {
		
		return "share/menu_Game_V";
	}
	
	// TV Menu's (V)
	@RequestMapping(value="/searchResult/menu_Movie_V")
	public String menu_TV_V() {
		
		return "share/menu_TV_V";
	}
	
	// menu_Form
	@RequestMapping(value="/searchResult/menu_Form")
	public String menu_Form() {
		
		return "share/menu_Form";
	}
	
	// result form
	@RequestMapping(value="/searchResult", method=RequestMethod.POST)
	public String searchResultTotal(HttpServletRequest request, HttpSession session, Model model) {
		
		String keyword = request.getParameter("keyword");
		model.addAttribute("keyword", keyword);
		
		return "share/searchResult";
	}
	
	@RequestMapping(value="/main")
	public String searchMain() {
		
		return "share/search";
	}
	
	
}
