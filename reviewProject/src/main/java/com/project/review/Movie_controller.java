package com.project.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.review.service.MovieService;
import com.project.review.vo.BoardVO;
<<<<<<< HEAD
import com.project.review.vo.MemberVO;
=======
import com.project.review.vo.Board_MovieVO;
import com.project.review.vo.HashtagVO;
>>>>>>> origin/bear1
import com.project.review.vo.MovieApiVO;
import com.sun.corba.se.impl.protocol.BootstrapServerRequestDispatcher;

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
@RequestMapping(value = "/movie")
public class Movie_controller {

	@Autowired
	private MovieService movieService;

	// -- 메인페이지 ---------------------------------------------------------

	// >> 메인 ----------------------------------
	@RequestMapping(value = "/main")
	public String movie(HttpServletRequest request, Model model) {

		return "movie/main";
	}

	// >> 상세 카테고리----------------------------------
	@RequestMapping(value = "/moreCategory")
	public String moreCategory(HttpServletRequest request, Model model) {
		String category_d1 = request.getParameter("category_1");
		// 선택된 카테고리(dept1)의 상세 카테고리(dept2) 불러와서 내보내는 함수 호출 -> 카테고리 정해야 함

		return "movie/d_category";
	}

	// >> 베스트 게시글 출력 ----------------------------------
	@RequestMapping(value = "/bestContent")
	public String bestContent(HttpServletRequest request, Model model) {
		// 좋아요수 많은 3개의 게시글 불러와서 내보내는 함수 호출

		return null;
	}

	// >> 게시판 출력 ----------------------------------
	@RequestMapping(value = "/contentView")
	public String contentView(HttpServletRequest request, Model model) {
		List<BoardVO> board_list = movieService.getMovieBoardList();
		model.addAttribute("board_list", board_list);

		return "movie/content";
	}

	// -- 상세페이지 ---------------------------------------------------------

	// >> 게시글 출력 ----------------------------------
	@RequestMapping(value = "/detail_view/{board_num}")
	public String detail_view(@PathVariable int board_num, HttpServletRequest request, Model model) {
		// 게시글 클릭 시 board_num과 movieNm 받기 -> jsp에서 동작 만들어야 함
		// String movieNm = request.getParameter("movieNm");
		String movieNm = "레고 무비2";

		BoardVO board_m = movieService.getBoardById(board_num);
		MovieApiVO mApiVO = movieService.getMovieInfo(movieNm);

		model.addAttribute("board", board_m);
		model.addAttribute("mApiVO", mApiVO);

		return "movie/detail_view";
	}
	// -- 상세페이지 ---------------------------------------------------------

	// >> 게시글 작성
<<<<<<< HEAD
	
	
	@RequestMapping(value = "/board_write", method=RequestMethod.GET)
	public String board_write(Model model) {
		return "movie/board_write";
=======
	@RequestMapping(value="/board_writeForm")
	public String board_writeForm() {		
		
		return "movie/board_writeForm";
	}
	
	@RequestMapping(value="/board_write", method=RequestMethod.POST)
	public String board_write(BoardVO board, Board_MovieVO movie, HashtagVO hash, Model model) {		
		
		movieService.insertMovie(board, movie, hash);
		
		int board_num = board.getBoard_num();
		BoardVO board_m = movieService.getBoardById(board_num);
		model.addAttribute("board", board_m);
		
		String movieNm = "레고 무비2";
		MovieApiVO mApiVO = movieService.getMovieInfo(movieNm);		
		model.addAttribute("mApiVO", mApiVO);
		
		return "movie/detail_view";
	}

	// >> 게시글 수정
	@RequestMapping(value="/board_updateForm/{board_num}")
	public String board_updateForm(@PathVariable int board_num, Model model) {
		
		String movieNm = "레고 무비2";
		
		BoardVO board_m = movieService.getBoardById(board_num);
		MovieApiVO mApiVO = movieService.getMovieInfo(movieNm);
		
		model.addAttribute("board", board_m);
		model.addAttribute("mApiVO", mApiVO);
>>>>>>> origin/bear1
		
		return "movie/board_updateForm";
	}
	@RequestMapping(value = "/board_write", method = RequestMethod.POST)
	public String board_write(BoardVO vo, Model model) {
		
		movieService.insertBoard(vo);
		//System.out.println(vo.getBoard_num());
		movieService.insertB_Movie(vo.getBoard_num());
		
		return "movie/main";

	}
	
	@RequestMapping(value="/board_update/{board_num}", method=RequestMethod.POST)
	public String board_update(BoardVO board, Board_MovieVO movie, HashtagVO hash, Model model) {
		
		movieService.updateMovie(board, movie, hash);
		
		int board_num = board.getBoard_num();
		BoardVO board_m = movieService.getBoardById(board_num);
		model.addAttribute("board", board_m);
		
		String movieNm = "레고 무비2";
		MovieApiVO mApiVO = movieService.getMovieInfo(movieNm);		
		model.addAttribute("mApiVO", mApiVO);
		
		return "movie/detail_view";
	}
	
	// >> 게시글 삭제
	@RequestMapping(value="/board_delete/{board_num}", method=RequestMethod.POST)
	public String board_delete(@PathVariable int board_num) {

		movieService.deleteMovie(board_num);
		
		return "redirect:/movie/main";
	}
	
	
	
}
