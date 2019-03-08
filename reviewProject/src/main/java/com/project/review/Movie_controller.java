package com.project.review;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.review.service.MemberService;
import com.project.review.service.MovieService;
import com.project.review.vo.BoardVO;
import com.project.review.vo.Board_MovieVO;
import com.project.review.vo.GradeVO;
import com.project.review.vo.HashtagVO;
import com.project.review.vo.LikeItVO;
import com.project.review.vo.MemberVO;
import com.project.review.vo.MovieApiVO;
import com.project.review.vo.ReplyVO;

@Controller
@RequestMapping(value="/movie")
public class Movie_controller {
	@Autowired
	private MovieService movieService;
	@Autowired
	private MemberService memberService;
	
	// -- 메인페이지 ----------------------------------------------------------------------------
	
	// >> 메인  ----------------------------------
	@RequestMapping(value="/main")
	public String movie(HttpServletRequest request, HttpSession session, Model model) {
		String user_id = (String)session.getAttribute("member_id");
		if (user_id != null) {
			MemberVO user = memberService.MemberInfo(user_id);
			model.addAttribute("user", user);
		
			return "movie/main";
		}
		return "movie/main";	
	}

	// >> 상세 카테고리----------------------------------
	@RequestMapping(value="/moreCategory")
	public String moreCategory(HttpServletRequest request, Model model) {
		String category_d1 = request.getParameter("category_1");
		// 선택된 카테고리(dept1)의 상세 카테고리(dept2) 불러와서 내보내는 함수 호출 -> 카테고리 정해야 함
		
		return "movie/d_category";
	}

	// >> 베스트 게시글 출력 ----------------------------------
	@RequestMapping(value="/bestContent")
	public String bestContent(HttpServletRequest request, Model model) {
		// 좋아요수 많은 3개의 게시글 불러와서 내보내는 함수 호출 
		
		return null;
	}

	// >> 게시판 출력 ----------------------------------
	@RequestMapping(value="/contentView")
	public String contentView(HttpServletRequest request, Model model) {
		
		List<BoardVO> board_list = movieService.getMovieBoardList();
		model.addAttribute("board_list", board_list);
		
		List<ReplyVO> board_replyList = movieService.getMovieBoardReplyList();
		model.addAttribute("board_replyList", board_replyList);
		
		List<LikeItVO> board_likeList = movieService.getMovieBoardLikeList();
		model.addAttribute("board_likeList", board_likeList);
		
		return "movie/content";
	}

	
	
	// -- 작성 페이지 ----------------------------------------------------------------------------
	
	// >> 게시글 작성 폼 (진입)----------------------------------
	@RequestMapping(value="/movie_writeForm")	
	public String movie_writeFrom(Model model) {		
		return "movie/movie_writeForm";
	}

	//>> 게시글 작성 완료 (상세페이지 이동)----------------------------------
	@RequestMapping(value="/movie_write", method=RequestMethod.POST)
	public String movie_write(BoardVO board, Board_MovieVO movie, GradeVO grade, HashtagVO hash, MovieApiVO movieApiVO, HttpSession session) {		
		// 게시글 추가 서비스
		String member_id = (String)session.getAttribute("member_id");
		movieService.insertMovie(board, movie, grade, hash, movieApiVO, member_id);
		
		// 게시글 추가 후 추가한 게시글 확인
		int board_num = board.getBoard_num();
		
		return "redirect:/movie/detail_view/"+board_num;
	}
	
	// >> 영화 검색----------------------------------
	@RequestMapping("/autocomplete")
	public void searchBook(String movie_nm, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(movieService.searchMovie(movie_nm));
	}

	
	
	// -- 수정 페이지 ----------------------------------------------------------------------------
	
	// >> 게시글 수정 (진입)----------------------------------
	@RequestMapping(value="/movie_updateForm/{board_num}")
	public String movie_updateForm(@PathVariable int board_num, Model model) {
		BoardVO board_m = movieService.getBoardById(board_num);
		MovieApiVO mApiVO = movieService.getMovieInfo(board_m.getB_movieVO().getMovie_nm());
		
		model.addAttribute("board", board_m);
		model.addAttribute("mApiVO", mApiVO);
		
		return "movie/movie_updateForm";
	}
	
	// >> 게시글 수정 완료 (상세페이지 이동)----------------------------------	
	@RequestMapping(value="/movie_update/{board_num}", method=RequestMethod.POST)
	public String movie_update(BoardVO board, Board_MovieVO movie, GradeVO grade, HashtagVO hash, MovieApiVO movieApiVO, Model model) {
		movieService.updateMovie(board, movie, grade, hash, movieApiVO);
		movieService.getMovieInfo(movie.getMovie_nm());
			
		int board_num = board.getBoard_num();
			
		return "redirect:/movie/detail_view/"+board_num;
	}
	
	
	// -- 삭제 페이지 ----------------------------------------------------------------------------

	// >> 게시글 삭제
	@RequestMapping(value="/movie_delete/{board_num}", method=RequestMethod.POST)
	public String movie_delete(@PathVariable int board_num) {
		movieService.deleteMovie(board_num);
			
		return "redirect:/movie/main";
	}
	
	
	// -- 상세 페이지 ----------------------------------------------------------------------------
	
	// >> 게시글 출력 ----------------------------------
	@RequestMapping(value="/detail_view/{board_num}")
	public String detail_view(@PathVariable int board_num, HttpServletRequest request, Model model) {
		BoardVO board_m = movieService.getBoardById(board_num);
		model.addAttribute("board", board_m);
		
		MovieApiVO mApiVO = movieService.getMovieInfo(board_m.getB_movieVO().getMovie_nm());
		model.addAttribute("mApiVO", mApiVO);
		
		int replyCount = movieService.replyCount(board_num);
		model.addAttribute("replyCount", replyCount);
		
		// 썸네일 확인
		String content = movieService.getContent(board_num);
		Document document = Jsoup.parse(content);
		Element element = document.select("img").first();
		
		if (element != null) {
			String strrrrr = element.attr("src");
				
			model.addAttribute("element", element);
			model.addAttribute("strrrrr", strrrrr);
		}
		return "movie/detail_view";
	}
	
	/* 출력 수정
	 	1. BoardVO, model(BoardVO~) -> 삭제 및 model(board_num)
	 	(이유: board 전체를 보낼 필요 없이 board_num만 보내기 -> jsp에서 board_num만 활용) 
	 */
	// ajax 댓글 출력------------------------------------------------------
	@RequestMapping(value="/detail_view/{board_num}/reply")
	public String getReply(@PathVariable int board_num, Model model) {
		List<ReplyVO> replyList = movieService.replyList(board_num);
		int replyCount = movieService.replyCount(board_num);
		
		model.addAttribute("replyList", replyList);
		model.addAttribute("board_num", board_num);
		model.addAttribute("replyCount", replyCount);
		
		return "share/reply";
	}
	/*
	// ajax 댓글 출력------------------------------------------------------
	@RequestMapping(value="/detail_view/{board_num}/reply")
	public String getReply(@PathVariable int board_num, Model model) {
		BoardVO board_m = movieService.getBoardById(board_num);
		model.addAttribute("board", board_m);
		
		List<ReplyVO> replyList = movieService.replyList(board_num);
		model.addAttribute("replyList", replyList);
		
		int replyCount = movieService.replyCount(board_num);
		model.addAttribute("replyCount", replyCount);
		
		return "share/reply";
	}
	*/
	
	
	/* 입력 수정, 삭제 수정 
	 	1. 다시 get을 렌더링 -> 삭제 및 redirect:/movie//detail_view/"+board_num+"/reply"
	 	(이유: 다시 작성 할 필요 없이 이미 작성되어 있는 출력함수 활용 => 코드 간소화)
	 	2. 파라미터 :   HttpServletRequest, Model -> 삭제
	 	(이유: model은 위와 같은 이유.
	 		request로 받는 reply_content의 경우  replyVO자체에 삽입되어 전달 받기 때문에 필요 없음)
	 	3. movieService.insertReply 파라미터  : reply, board_num -> 삭제
	 	(이유 : reply 위와 동일한 이유
	 		board_num은 @PathVariable으로 직접적으로 받으면서 자동으로 replyVO자체에 삽입되기 때문에 필요 없음 )
	*/
	// 댓글 입력
	@RequestMapping(value="/detail_view/{board_num}/reply", method=RequestMethod.POST)
	public String postReply(@PathVariable int board_num, ReplyVO replyVO, HttpSession session) {
		// ID session
		String member_id = (String)session.getAttribute("member_id");
	System.out.println(replyVO.toString());
		movieService.insertReply(replyVO, member_id);
		
		return "redirect:/movie/detail_view/"+board_num+"/reply";
	}
	/*
	// 댓글 입력
	@RequestMapping(value="/detail_view/{board_num}/reply", method=RequestMethod.POST)
	public String postReply(@PathVariable int board_num, HttpServletRequest request, HttpSession session, Model model, ReplyVO replyVO) {
		// ID session
		String member_id = (String)session.getAttribute("member_id");
		// reply_content
		String reply = request.getParameter("reply_content");
		
		movieService.insertReply(replyVO, reply, board_num, member_id);
		
		// 다시 get을 렌더링
		BoardVO board_m = movieService.getBoardById(board_num);
		model.addAttribute("board", board_m);
		
		List<ReplyVO> replyList = movieService.replyList(board_num);
		model.addAttribute("replyList", replyList);
		
		int replyCount = movieService.replyCount(board_num);
		model.addAttribute("replyCount", replyCount);
		
		return "share/reply";
	}
	*/
	
	// 댓글 수정
	// 댓글 삭제
	@RequestMapping(value="/detail_view/{board_num}/deleteReply", method=RequestMethod.POST)
	public String deleteReply(@PathVariable int board_num, ReplyVO replyVO) {
		int reply_num = replyVO.getReply_num();
		
		movieService.deleteReply(reply_num);
		
		return "redirect:/movie/detail_view/"+board_num+"/reply";
	}
	/*
	// 댓글 삭제
	@RequestMapping(value="/detail_view/{board_num}/deleteReply", method=RequestMethod.POST)
	public String deleteReply(@PathVariable int board_num, HttpServletRequest request, 
			 Model model, ReplyVO replyVO) {
		// replyNum
		int reply_num = Integer.parseInt((String)request.getParameter("reply_num"));
	System.out.println(reply_num);
		movieService.deleteReply(reply_num);
		
		BoardVO board_m = movieService.getBoardById(board_num);
		model.addAttribute("board", board_m);
		
		List<ReplyVO> replyList = movieService.replyList(board_num);
		model.addAttribute("replyList", replyList);
		
		int replyCount = movieService.replyCount(board_num);
		model.addAttribute("replyCount", replyCount);
		
		return "share/reply";
	}
	*/
	
	//-------------------------------------댓글-----------------------------
	
	// ajax 좋아요 출력 ------------------------------------------------------
	@RequestMapping(value="/detail_view/{board_num}/likeIt")
	public String getLikeit(@PathVariable int board_num, HttpSession session, Model model) {		
		BoardVO board_m = movieService.getBoardById(board_num);
		model.addAttribute("board", board_m);
		
		int likeCount = movieService.likeCount(board_num);
		model.addAttribute("likeCount", likeCount);
		
		String member_id = (String)session.getAttribute("member_id");
		if (member_id != null) {
			int likeCheck;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("board_num", board_num);
			map.put("member_id", member_id);
			likeCheck = movieService.likeCheck(map);
			model.addAttribute("likeCheck", likeCheck);
		}
		return "share/likeIt";
	}
	// 좋아요+
	@RequestMapping(value="/detail_view/{board_num}/likeItP", method=RequestMethod.POST)
	public String postLikeitP(@PathVariable int board_num, HttpServletRequest request, HttpSession session, Model model, LikeItVO likeVO) {
		// ID session
		String member_id = (String)session.getAttribute("member_id");
		
		movieService.likeItPlus(likeVO, board_num, member_id);
		
		// 다시 get을 렌더링
		BoardVO board_m = movieService.getBoardById(board_num);
		model.addAttribute("board", board_m);
		
		int likeCount = movieService.likeCount(board_num);
		model.addAttribute("likeCount", likeCount);
		
		if (member_id != null) {
			int likeCheck;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("board_num", board_num);
			map.put("member_id", member_id);
			likeCheck = movieService.likeCheck(map);
			model.addAttribute("likeCheck", likeCheck);
		}
		return "share/likeIt";
	}
	// 좋아요-
	@RequestMapping(value="/detail_view/{board_num}/likeItM", method=RequestMethod.POST)
	public String postLikeitM(@PathVariable int board_num, HttpServletRequest request, HttpSession session, Model model, LikeItVO likeVO) {
		// ID session
		String member_id = (String)session.getAttribute("member_id");
		
		movieService.likeItMinus(likeVO, board_num, member_id);
		
		// 다시 get을 렌더링
		BoardVO board_m = movieService.getBoardById(board_num);
		model.addAttribute("board", board_m);
		
		int likeCount = movieService.likeCount(board_num);
		model.addAttribute("likeCount", likeCount);
		
		if (member_id != null) {
			int likeCheck;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("board_num", board_num);
			map.put("member_id", member_id);
			likeCheck = movieService.likeCheck(map);
			model.addAttribute("likeCheck", likeCheck);
		}
		
		return "share/likeIt";
	}
	//-----------------------------------좋아요-------------------------------
}
