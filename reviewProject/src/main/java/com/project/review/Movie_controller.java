package com.project.review;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.project.review.vo.CategoryVO;
import com.project.review.vo.GradeVO;
import com.project.review.vo.HashtagVO;
import com.project.review.vo.LikeItVO;
import com.project.review.vo.MemberVO;
import com.project.review.vo.MovieApiVO;
import com.project.review.vo.Pagination;
import com.project.review.vo.ReplyVO;

@Controller
@RequestMapping(value = "/movie")
public class Movie_controller {
	@Autowired
	private MovieService movieService;
	@Autowired
	private MemberService memberService;

	// -- 메인페이지
	// ----------------------------------------------------------------------------
	
	// >> 메인 ----------------------------------
	@RequestMapping(value = "/main")
	public String movie(HttpServletRequest request, HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("member_id");
		
		if (user_id != null) {
			MemberVO user = memberService.MemberInfo(user_id);
			model.addAttribute("user", user);
		}
		
		return "movie/main";
	}

	// >> 상세 카테고리----------------------------------
	@RequestMapping(value = "/moreCategory")
	public String moreCategory(String category_type, Model model) {
		List<CategoryVO> category = movieService.getCategory(category_type);
		
		model.addAttribute("category", category);

		return "movie/detail_category2";
	}

	// 상세 카테고리 - 영화 리스트
	@RequestMapping(value = "/moreCaMovie")
	public String moreCaMovie(String de_ca_type, String cd, String nm, int pnum, Model model) {
		Pagination pagination = new Pagination();
		
		List<String> movieNmList = movieService.getCaMovieList(de_ca_type, cd, nm, pnum);
		if (de_ca_type.equals("actor") || de_ca_type.equals("director") || cd.equals("-1")) {
			pagination.setPage(pnum, movieNmList.size());
			if (pagination.getEndPage()==pnum && movieNmList.size()%10 != 0) {
				movieNmList = movieNmList.subList((pnum-1)*10, movieNmList.size());
			}else {
				movieNmList = movieNmList.subList((pnum-1)*10, (pnum-1)*10+10);
			}
		}else {
			pagination.setPage(pnum,1000);
		}

		model.addAttribute("movieNmList", movieNmList);
		model.addAttribute("pagination", pagination);
		
		return "movie/detail_category3";
	}

	@RequestMapping(value = "/movieInfoView")
	public String movieInfoView(MovieApiVO movieApiVO, Model model) {
		movieApiVO = movieService.getMovie(movieApiVO);

		model.addAttribute("movie", movieApiVO);
		
		return "movie/movieInfo";
	}

	@RequestMapping(value = "/oneContentView")
	public String oneContentView(Board_MovieVO b_movieVO, Model model) {
		String sort_id = b_movieVO.getSort_id();
		List<BoardVO> board_list = movieService.getMovieBoardList(b_movieVO);
		
		if (board_list.size()==0) 
			return "movie/nullPage";
		
		Pagination pagination = new Pagination();
		pagination.setPage(b_movieVO.getPnum(), board_list.size());
	
		model.addAttribute("sort_id", sort_id);		
		model.addAttribute("board_list", board_list);
		model.addAttribute("pagination", pagination);
		
		return "movie/contentList";
	}
	
	
	// >> 베스트 게시글 출력 ----------------------------------
	@RequestMapping(value = "/bestContent")
	public String bestContent(Board_MovieVO b_movieVO, Model model) {
		List<BoardVO> board_list;	
		board_list = movieService.getMovieBoardList_Best(b_movieVO);
		model.addAttribute("board_list", board_list);
		
		String emptyCheck = "notEmpty";
		if(board_list.size()== 0) {
			emptyCheck = "Empty";
		}		
		model.addAttribute("emptyCheck", emptyCheck);		
		
		String movie_nm = b_movieVO.getMovie_nm();
		model.addAttribute("movie_nm", movie_nm);

		
		return "movie/best_content";
	}

	// >> 게시판 출력 ----------------------------------
	@RequestMapping(value = "/contentView")
	public String contentView(Board_MovieVO b_movieVO, Model model) {
		int start_content = b_movieVO.getStart_content();
		model.addAttribute("start_content", start_content);
		
		int end_content = b_movieVO.getEnd_content();
		model.addAttribute("end_content", end_content);
		
		String sort_id = b_movieVO.getSort_id();		
		model.addAttribute("sort_id", sort_id);				
		
	    List<BoardVO> board_list;	
		board_list = movieService.getMovieBoardList(b_movieVO);
		
		model.addAttribute("board_list", board_list);

		int movieBoardCount = movieService.getMovieBoardCount();
		model.addAttribute("movieBoardCount", movieBoardCount);		
			
		return "movie/content";
	}

	// -- 작성 페이지
	// ----------------------------------------------------------------------------

	// >> 게시글 작성 폼 (진입)----------------------------------
	@RequestMapping(value = "/movie_writeForm")
	public String movie_writeFrom(Model model, HttpSession session, HttpServletRequest request) {
		String user_id = (String) session.getAttribute("member_id");
		if (user_id != null) {
			MemberVO user = memberService.MemberInfo(user_id);
			model.addAttribute("user", user);
		}
		
		String referer = request.getHeader("Referer");
		model.addAttribute("address", referer);

		return "movie/movie_writeForm";
	}

	// >> 게시글 작성 완료 (상세페이지 이동)----------------------------------
	@RequestMapping(value = "/movie_write", method = RequestMethod.POST)
	public String movie_write(BoardVO board, Board_MovieVO movie, GradeVO grade, HashtagVO hash, 
			MovieApiVO movieApiVO, HttpSession session, Model model) {
		
		String member_id = (String) session.getAttribute("member_id");
		if (member_id != null) {
			String member_pic = memberService.getMember_pic(member_id);
			model.addAttribute("member_pic", member_pic);
		}
		// 게시글 추가 서비스
		movieService.insertMovie(board, movie, grade, hash, movieApiVO, member_id);

		// 게시글 추가 후 추가한 게시글 확인
		int board_num = board.getBoard_num();

		return "redirect:/movie/detail_view/" + board_num;
	}

	// >> 영화 검색----------------------------------
	@RequestMapping("/autocomplete")
	public void searchBook(String movie_nm, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(movieService.searchMovie(movie_nm));
	}

	
	
	// -- 수정 페이지
	// ----------------------------------------------------------------------------

	// >> 게시글 수정 (진입)----------------------------------
	@RequestMapping(value = "/movie_updateForm/{board_num}")
	public String movie_updateForm(@PathVariable int board_num, Model model, HttpSession session, 
			HttpServletRequest request) {
		
		String user_id = (String) session.getAttribute("member_id");
		if (user_id != null) {
			MemberVO user = memberService.MemberInfo(user_id);
			model.addAttribute("user", user);
		}
		
		BoardVO board_m = movieService.getBoardById(board_num);
		MovieApiVO mApiVO = movieService.getMovieInfo(board_m.getB_movieVO().getMovie_nm());
		String referer = request.getHeader("Referer");

		model.addAttribute("board", board_m);
		model.addAttribute("mApiVO", mApiVO);
		model.addAttribute("address", referer);

		return "movie/movie_updateForm";
	}

	// >> 게시글 수정 완료 (상세페이지 이동)----------------------------------
	@RequestMapping(value = "/movie_update/{board_num}", method = RequestMethod.POST)
	public String movie_update(BoardVO board, Board_MovieVO movie, GradeVO grade, HashtagVO hash, 
			MovieApiVO movieApiVO, HttpSession session, Model model) {
		
		String member_id = (String) session.getAttribute("member_id");
		if (member_id != null) {
			String member_pic = memberService.getMember_pic(member_id);
			model.addAttribute("member_pic", member_pic);
		}
		
		movieService.updateMovie(board, movie, grade, hash, movieApiVO);
		movieService.getMovieInfo(movie.getMovie_nm());

		int board_num = board.getBoard_num();

		return "redirect:/movie/detail_view/" + board_num;
	}

	// -- 삭제 페이지
	// ----------------------------------------------------------------------------

	// >> 게시글 삭제
	@RequestMapping(value = "/movie_delete/{board_num}", method = RequestMethod.POST)
	public String movie_delete(@PathVariable int board_num) {
		movieService.deleteMovie(board_num);

		return "redirect:/movie/main";
	}

	
	
	// -- 상세 페이지
	// ----------------------------------------------------------------------------

	// >> 게시글 출력 ----------------------------------
	@RequestMapping(value = "/detail_view/{board_num}")
	public String detail_view(@PathVariable int board_num, HttpServletRequest request,
			HttpSession session, Model model) {
		
		String user_id = (String) session.getAttribute("member_id");
		if (user_id != null) {
			MemberVO user = memberService.MemberInfo(user_id);
			model.addAttribute("user", user);
		}
		
		BoardVO board_m = movieService.getBoardById(board_num);
		model.addAttribute("board", board_m);

		MovieApiVO mApiVO = movieService.getMovieInfo(board_m.getB_movieVO().getMovie_nm());
		model.addAttribute("mApiVO", mApiVO);

		int replyCount = movieService.replyCount(board_num);
		model.addAttribute("replyCount", replyCount);
		
		movieService.plusReadCount(board_num);
		
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

	// ajax 댓글 출력------------------------------------------------------
	@RequestMapping(value = "/detail_view/{board_num}/reply")
	public String getReply(@PathVariable int board_num, Model model) {
		List<ReplyVO> replyList = movieService.replyList(board_num);
		int replyCount = movieService.replyCount(board_num);

		model.addAttribute("replyList", replyList);
		model.addAttribute("board_num", board_num);
		model.addAttribute("replyCount", replyCount);

		return "share/reply";
	}

	// 댓글 입력------------------------------------------------------
	@RequestMapping(value = "/detail_view/{board_num}/reply", method = RequestMethod.POST)
	public String postReply(@PathVariable int board_num, ReplyVO replyVO, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		movieService.insertReply(replyVO, member_id);

		return "redirect:/movie/detail_view/" + board_num + "/reply";
	}

	// 댓글 수정 입력------------------------------------------------------
	@RequestMapping(value = "/detail_view/{board_num}/updateReplyForm", method = RequestMethod.POST)
	public String updateReplyForm(@PathVariable int board_num, ReplyVO replyVO, Model model) {
		int rnum = replyVO.getReply_num();
		model.addAttribute("rnum", rnum);

		List<ReplyVO> replyList = movieService.replyList(board_num);
		int replyCount = movieService.replyCount(board_num);

		model.addAttribute("replyList", replyList);
		model.addAttribute("board_num", board_num);
		model.addAttribute("replyCount", replyCount);

		return "share/reply";
	}

	// 댓글 수정 처리------------------------------------------------------
	@RequestMapping(value = "/detail_view/{board_num}/updateReply", method = RequestMethod.POST)
	public String updateReply(@PathVariable int board_num, ReplyVO replyVO, HttpServletRequest request, Model model) {
		String reply_content = request.getParameter("reply_UpdateContent");
		movieService.updateReply(replyVO, reply_content);

		return "redirect:/movie/detail_view/" + board_num + "/reply";
	}

	// 댓글 삭제------------------------------------------------------
	@RequestMapping(value = "/detail_view/{board_num}/deleteReply", method = RequestMethod.POST)
	public String deleteReply(@PathVariable int board_num, ReplyVO replyVO) {
		int reply_num = replyVO.getReply_num();
		movieService.deleteReply(reply_num);

		return "redirect:/movie/detail_view/" + board_num + "/reply";
	}

	// 좋아요 출력 ------------------------------------------------------
	@RequestMapping(value = "/detail_view/{board_num}/likeIt")
	public String getLikeit(@PathVariable int board_num, HttpSession session, Model model) {
		BoardVO board_m = movieService.getBoardById(board_num);
		int likeCount = movieService.likeCount(board_num);
		String member_id = (String) session.getAttribute("member_id");
		
		if (member_id != null) {
			int likeCheck;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("board_num", board_num);
			map.put("member_id", member_id);
			likeCheck = movieService.likeCheck(map);
			
			model.addAttribute("likeCheck", likeCheck);
		}
		model.addAttribute("board", board_m);
		model.addAttribute("likeCount", likeCount);
		
		return "share/likeIt";
	}

	// 좋아요+ ------------------------------------------------------
	@RequestMapping(value = "/detail_view/{board_num}/likeItP", method = RequestMethod.POST)
	public String postLikeitP(@PathVariable int board_num, HttpServletRequest request, HttpSession session, Model model,
			LikeItVO likeVO) {
		String member_id = (String) session.getAttribute("member_id");

		movieService.likeItPlus(likeVO, board_num, member_id);

		// 다시 get을 렌더링
		BoardVO board_m = movieService.getBoardById(board_num);

		int likeCount = movieService.likeCount(board_num);

		if (member_id != null) {
			int likeCheck;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("board_num", board_num);
			map.put("member_id", member_id);
			likeCheck = movieService.likeCheck(map);
			model.addAttribute("likeCheck", likeCheck);
		}
		model.addAttribute("board", board_m);
		model.addAttribute("likeCount", likeCount);

		return "share/likeIt";
	}

	// 좋아요- ------------------------------------------------------
	@RequestMapping(value = "/detail_view/{board_num}/likeItM", method = RequestMethod.POST)
	public String postLikeitM(@PathVariable int board_num, HttpServletRequest request, HttpSession session, Model model,
			LikeItVO likeVO) {
		// ID session
		String member_id = (String) session.getAttribute("member_id");
		movieService.likeItMinus(likeVO, board_num, member_id);

		// 다시 get을 렌더링
		BoardVO board_m = movieService.getBoardById(board_num);
		int likeCount = movieService.likeCount(board_num);

		if (member_id != null) {
			int likeCheck;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("board_num", board_num);
			map.put("member_id", member_id);
			likeCheck = movieService.likeCheck(map);
			model.addAttribute("likeCheck", likeCheck);
		}
		model.addAttribute("board", board_m);
		model.addAttribute("likeCount", likeCount);

		return "share/likeIt";
	}

}
