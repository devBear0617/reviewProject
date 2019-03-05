package com.project.review;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.review.service.MemberService;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.project.review.service.MovieService;
import com.project.review.vo.BoardVO;
import com.project.review.vo.Board_MovieVO;
import com.project.review.vo.GradeVO;
import com.project.review.vo.HashtagVO;
import com.project.review.vo.MemberVO;
import com.project.review.vo.MovieApiVO;
import com.project.review.vo.ReplyVO;

//맵핑명, 변수명, jsp명 = 가칭O, 변경 가능, test용
/*
  	@Controller			컨트롤러 어노테이션
  	@RequestMapping		value값을 현재 url뒤에 매핑	-ex) 프로젝트명/value 값 
  	@Autowired			주입 어노테이션 - 인터페이스를 주입하면 해당 인터페이스를 상속(implements)한 클래스의 함수 호출 가능
	HttpServletRequest: jsp에서 전달 받은 파라미터 값
	Model:				jsp에 전달 할 모델(데이터)
	model.addAttribute("jsp에 전달 될 변수명", 현 클래스에서 사용하는 변수명)	:	jsp에 모델(데이터)명과 값 매핑 
	return:				String - jsp로 매핑 (servlet-context.xml의 InternalResourceViewResolver) 
							   - prefix/리턴 값(string)/suffix (/WEB-INF/views/리턴 값/.jsp)	
*/
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
		
		if ((String)session.getAttribute("member_id") != null) {
			String user_id = (String)session.getAttribute("member_id");
		
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
	
	System.out.println("nm : "+movie.getMovie_nm());
	System.out.println("api nm : "+movieApiVO.getMovie_nm());
	System.out.println("api dr : "+movieApiVO.getDirector());
	System.out.println("api actor : "+movieApiVO.getActor());
	System.out.println("api poster : "+movieApiVO.getPoster());
		
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
	
	
	
	// -- 상세페이지 ---------------------------------------------------------
	// >> reply 입력 ----------------------------------
	@RequestMapping(value="/insert_Reply/{board_num}", method=RequestMethod.POST)
	public String insert_Reply(@PathVariable int board_num, HttpSession session, 
			ReplyVO reply, Model model) {
		
		String member_id = (String)session.getAttribute("member_id");
		movieService.insertReply(reply, board_num, member_id);
		
		return "redirect:/movie/detail_view/"+board_num;
	}
	

	// >> 게시글 출력 ----------------------------------
	@RequestMapping(value="/detail_view/{board_num}")
	public String detail_view(@PathVariable int board_num, HttpServletRequest request, Model model) {
		BoardVO board_m = movieService.getBoardById(board_num);
		MovieApiVO mApiVO = movieService.getMovieInfo(board_m.getB_movieVO().getMovie_nm());

		model.addAttribute("board", board_m);
		model.addAttribute("mApiVO", mApiVO);
		
		// 썸네일 확인
		String content = movieService.getContent(board_num);
		Document document = Jsoup.parse(content);
		Element element = document.select("img").first();
		if (element != null) {
			String strrrrr = element.attr("src");
		System.out.println(element);
		System.out.println(strrrrr);
				
			model.addAttribute("element", element);
			model.addAttribute("strrrrr", strrrrr);
		}
		
		return "movie/detail_view";
	}
	
	// ajax 뎃글
	@RequestMapping(value="/detail_view/{board_num}/reply")
	public String getReply(@PathVariable int board_num, Model model) {
		
		BoardVO board_m = movieService.getBoardById(board_num);
		model.addAttribute("board", board_m);
		
		int replyCount = movieService.replyCount(board_num);
		model.addAttribute("replyCount", replyCount);
		
		return "share/reply";
	}
	@RequestMapping(value="/detail_view/{board_num}/reply", method=RequestMethod.POST)
	public String postReply(@PathVariable int board_num, HttpServletRequest request, Model model) {
		
		String reply_content = request.getParameter("reply_content");
	System.out.print(reply_content);
		
		
		
		return "redirect:/detail_view/"+board_num+"/reply";
	}
}
