package com.project.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value="/content/{board_num}")
	public String tv_content(@PathVariable int board_num, Model model) {
		
		BoardVO board = tvService.searchBoard(board_num);
		
		model.addAttribute("board", board);

		return "tv/content";
	}
	
	@RequestMapping(value="/new")
	public String newBoard() {
		
		return "tv/new";
	}
	
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String newBoard(HttpServletRequest request, Model model) {
		
		String member_id = "qwe";
		String board_title = request.getParameter("b_title");
		String board_content = request.getParameter("b_content");
		
		tvService.newBoard(board_title, board_content, member_id);
		
		return "tv/main";
	}
	


	
}
