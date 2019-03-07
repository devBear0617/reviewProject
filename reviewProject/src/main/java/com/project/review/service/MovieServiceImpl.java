package com.project.review.service;


import java.util.List;
import java.util.Map;

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
		// movie/tv/game -> 해당하는 board값 호출하는 함수 작성
		
		return boardDAO.getBoardById(board_num);
	}
	@Override
	public int replyCount(int board_num) {
		
		return boardDAO.replyCount(board_num);
	}
	@Override
	public int likeCount(int board_num) {
		
		return boardDAO.likeCount(board_num);
	}
	@Override
	public int likeCheck(Map<String, Object> map) {
		
		return boardDAO.likeCheck(map);
	}
	
	
	//게시판 호출
	@Override
	public List<BoardVO> getBoardList() {
		return boardDAO.getBoardList();
	}
	@Override
	public List<BoardVO> getMovieBoardList() {
		// movie/tv/game -> 해당하는 board값 호출하는 함수 작성,
		
		return boardDAO.getMovieBoardList();
	}
	@Override
	public List<ReplyVO> getMovieBoardReplyList() {
		
		return boardDAO.getMovieBoardReplyList();
	}
	@Override
	public List<LikeItVO> getMovieBoardLikeList() {
		
		return boardDAO.getMovieBoardLikeList();
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
	/*@Override
	public void insertReply(ReplyVO reply, int board_num, String member_id) {
		
		// 보드넘 대입
		board_num = reply.getBoard_num();
		reply.setBoard_num(board_num);
		reply.setMember_id(member_id);
		// 리플 추가
		boardDAO.insertReply(reply);
		
	}*/
	@Override
	public void insertReply(ReplyVO replyVO, String reply, int board_num, String member_id) {
		// 보드넘 대입
		board_num = replyVO.getBoard_num();
		replyVO.setBoard_num(board_num);
		replyVO.setMember_id(member_id);
		replyVO.setReply_content(reply);
		// 리플 추가
		boardDAO.insertReply(replyVO);
	}
	
	// 리플 삭제
	@Override
	public void deleteReply(int reply_num) {
		
		boardDAO.deleteReply(reply_num);
		
	}
	
	//게시글 추가 (Board & Board_Movie & Garde & Hashtag)
	@Override
	public void insertMovie(BoardVO board, Board_MovieVO movie, GradeVO grade, HashtagVO hash, MovieApiVO movieApiVO, String member_id) {
		// member 처리
		board.setMember_id(member_id);
		// board테이블 추가
		boardDAO.insertMovie(board);
		
		// 썸네일 추가
		if (boardDAO.getContent(board.getBoard_num()) != null) {
			String content = boardDAO.getContent(board.getBoard_num());
			Document document = Jsoup.parse(content);
			Element element = document.select("img").first();
			if (element != null) {
				String thumbnail = element.attr("src");
				
				/*board.setBoard_num(board.getBoard_num());*/
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
		boardDAO.deleteHashtag(board_num);
		boardDAO.deleteB_movie(board_num);
		boardDAO.deleteGrade(board_num);
		boardDAO.deleteMovie(board_num);
	}	
	
	// -- api ---------------------------------------------------------
	@Override
	public JsonArray searchMovie(String movie_nm) {
		
		return movieApiDAO.getMovieArray(movie_nm);
	}
	
	@Override
	public void setMovieApi(MovieApiVO movieApiVO) {
		String isMoiveNm = null;
		try {
			isMoiveNm = boardDAO.getMovieInfo(movieApiVO.getMovie_nm()).getMovie_nm();
		} catch (Exception e) {
			System.out.println("isMoiveNm : "+e);
		}
		
		if (isMoiveNm == null) {
			MovieApiVO movieInfo = movieApiDAO.getMovieApi(movieApiVO);
			if (movieInfo != null)
				boardDAO.insertMovieInfo(movieInfo);
			else 
				boardDAO.insertMovieInfo(movieApiVO);
		}
	}
	
	// 영화 기본 정보 호출
	@Override
	public MovieApiVO getMovieInfo(String movie_nm) {
		
		return boardDAO.getMovieInfo(movie_nm);
	}
}
