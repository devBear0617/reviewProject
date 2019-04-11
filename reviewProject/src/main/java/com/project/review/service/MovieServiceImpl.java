package com.project.review.service;


import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.project.review.dao.BoardDAO;
import com.project.review.dao.MovieApiDAO;
import com.project.review.vo.BoardVO;
import com.project.review.vo.Board_MovieVO;
import com.project.review.vo.CategoryVO;
import com.project.review.vo.GradeVO;
import com.project.review.vo.HashtagVO;
import com.project.review.vo.LikeItVO;
import com.project.review.vo.MovieApiVO;
import com.project.review.vo.ReplyVO;


@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private MovieApiDAO movieApiDAO;

	// -- select ---------------------------------------------------------

	// Jsoup getContent
	@Override
	public String getContent(int board_num) {
		
		return boardDAO.getContent(board_num);
	}
	
	//게시글 호출
	@Override
	public BoardVO getBoardById(int board_num) {
		
		return boardDAO.getBoardById(board_num);
	}
	@Override
	public int replyCount(int board_num) {
		
		return boardDAO.replyCount(board_num);
	}
	@Override
	public List<ReplyVO> replyList(int board_num) {
		
		return boardDAO.replyList(board_num);
	}
	@Override
	public int likeCount(int board_num) {
		
		return boardDAO.likeCount(board_num);
	}
	@Override
	public int likeCheck(Map<String, Object> map) {
		
		return boardDAO.likeCheck(map);
	}
	
	
	//게시판 호출 및 정렬
	@Override
	public List<BoardVO> getMovieBoardList_Best(Board_MovieVO b_MovieVO) {
		
		return boardDAO.getMovieBoardList_Best(b_MovieVO);
	}	
	@Override
	public List<BoardVO> getMovieBoardList(Board_MovieVO b_MovieVO) {
	
		return boardDAO.getMovieBoardList(b_MovieVO);
	}	
	
	@Override
	public int getMovieBoardCount() {
		return boardDAO.getMovieBoardCount();
	}
	@Override
	public List<ReplyVO> getMovieBoardReplyList() {
		
		return boardDAO.getMovieBoardReplyList();
	}
	@Override
	public List<LikeItVO> getMovieBoardLikeList() {
		
		return boardDAO.getMovieBoardLikeList();
	}
	/*plusReadCount*/
	@Override
	public void plusReadCount(int board_num) {
		
		boardDAO.plusReadCount(board_num);
	}
	
	
	// -- insert ---------------------------------------------------------
	
	// likeItMinus
	@Override
	public void likeItMinus(LikeItVO likeVO, int board_num, String member_id) {
		
		board_num = likeVO.getBoard_num();
		likeVO.setBoard_num(board_num);
		likeVO.setMember_id(member_id);
			
		boardDAO.likeItMinus(likeVO);
	}
	
	// likeItPlus
	@Override
	public void likeItPlus(LikeItVO likeVO, int board_num, String member_id) {
		
		board_num = likeVO.getBoard_num();
		likeVO.setBoard_num(board_num);
		likeVO.setMember_id(member_id);
		
		boardDAO.likeItPlus(likeVO);
	}
	
	// 리플 추가 
	@Override
	public void insertReply(ReplyVO replyVO, String member_id) {
		
		replyVO.setMember_id(member_id);

		boardDAO.insertReply(replyVO);
	}
	// 리플 수정
	@Override
	public void updateReply(ReplyVO replyVO, String reply_content) {
		
		replyVO.setReply_content(reply_content);
		
		boardDAO.updateReply(replyVO);
	}

	// 리플 삭제
	@Override
	public void deleteReply(int reply_num) {
		
		boardDAO.deleteReply(reply_num);
	}
	
	//게시글 추가 (Board & Board_Movie & Garde & Hashtag)
	@Override
	public void insertMovie(BoardVO board, Board_MovieVO movie, GradeVO grade, HashtagVO hash, MovieApiVO movieApiVO, String member_id) {

		board.setMember_id(member_id);
		boardDAO.insertMovie(board);
		
		// 썸네일 추가
		if (boardDAO.getContent(board.getBoard_num()) != null) {
			String content = boardDAO.getContent(board.getBoard_num());
			Document document = Jsoup.parse(content);
			Element element = document.select("img").first();
			if (element != null) {
				String thumbnail = element.attr("src");
				board.setThumbnail(thumbnail);
				boardDAO.insertThumbnail(board);
			} else if (element == null) {
				String thumbnail = movieApiVO.getPoster();
				board.setThumbnail(thumbnail);
				boardDAO.insertThumbnail(board);
			}
		}
		
		// 추가한 board테이블에서 board_num 추출해서 다른 테이블 board_num에 대입
		movie.setBoard_num(board.getBoard_num());
		setMovieApi(movieApiVO);
		hash.setBoard_num(board.getBoard_num());
		grade.setBoard_num(board.getBoard_num());
		
		// 대입한 board_num으로 다른 테이블들도 insert
		boardDAO.insertGrade(grade);
		boardDAO.insertB_movie(movie);
		boardDAO.insertHashtag(hash);
	}
	

	//게시글 수정 (Board & Board_Movie & Garde & Hashtag)
	@Override
	public void updateMovie(BoardVO board, Board_MovieVO movie, GradeVO grade, HashtagVO hash, MovieApiVO movieApiVO) {
		// 현재 저장되어있는 baord_num을 다른 VO에 대입
		board.setBoard_num(board.getBoard_num());
		movie.setBoard_num(board.getBoard_num());
		grade.setBoard_num(board.getBoard_num());
		hash.setBoard_num(board.getBoard_num());
		
		// 수정
		boardDAO.updateMovie(board);
		boardDAO.updateB_movie(movie);
		boardDAO.updateGrade(grade);
		boardDAO.updateHashtag(hash);
		setMovieApi(movieApiVO);
	}
	
	// 게시글 삭제
	@Override
	public void deleteMovie(int board_num) {	
		// 삭제 (board_num으로)
		boardDAO.delete_Reply(board_num);
		boardDAO.delete_Like(board_num);
		boardDAO.deleteHashtag(board_num);
		boardDAO.deleteB_movie(board_num);
		boardDAO.deleteGrade(board_num);
		boardDAO.deleteMovie(board_num);
	}	
	
	@Override
	public JsonArray searchMovie(String movie_nm) {
		return movieApiDAO.getNaverMovieArray(movie_nm);
	}

	@Override
	public MovieApiVO getMovieInfo(String movie_nm) {
		return boardDAO.getMovieInfo(movie_nm);
	}
	
	@Override
	public void setMovieApi(MovieApiVO movieApiVO) {
		Optional<MovieApiVO> opt = Optional.ofNullable(getMovieInfo(movieApiVO.getMovie_nm()));
		
		if (!opt.isPresent()) {
			MovieApiVO movieInfo = movieApiDAO.contactMovieApi(movieApiVO, true);
			
			if (movieInfo != null)
				boardDAO.insertMovieInfo(movieInfo);
			else 
				boardDAO.insertMovieInfo(movieApiVO);
		}
	}
	
	@Override
	public MovieApiVO getMovie(MovieApiVO movieApiVO) {
		Optional<MovieApiVO> opt = Optional.ofNullable(getMovieInfo(movieApiVO.getMovie_nm()));

		if (!opt.isPresent()) {
			movieApiVO = movieApiDAO.contactMovieApi(movieApiVO, false);
			JsonArray moiveArray = searchMovie(movieApiVO.getMovie_nm());

			movieApiVO = movieApiDAO.contactNMovieApi(moiveArray, movieApiVO);
			boardDAO.insertMovieInfo(movieApiVO);
		}else
			movieApiVO = getMovieInfo(movieApiVO.getMovie_nm());
		
		return movieApiVO;
	}

	@Override
	public List<CategoryVO> getCategory(String category_type) {
		category_type = category_type.split("cg_img_")[1];
		List<CategoryVO> category = boardDAO.getCategory(category_type);
		
		return category;
	}

	@Override
	public List<String> getCaMovieList(String ca_type, String cd, String nm, int pnum) {
		if (ca_type.equals("actor") || ca_type.equals("director")) {
			List<String> movieNmList = movieApiDAO.getCaPeopleMNmList(nm, pnum);
			
			return movieNmList;
		}
		if (ca_type.equals("open_dt") && cd.equals("-1")) {
			String date = LocalDate.now().minusWeeks(1).format(DateTimeFormatter.BASIC_ISO_DATE);
			return movieApiDAO.getCaRecentMNmList(date);
		}
		return movieApiDAO.getCaMNmList(ca_type, cd, pnum);
	}
}
