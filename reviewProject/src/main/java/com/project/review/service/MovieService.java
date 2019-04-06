package com.project.review.service;

import java.util.List;
import java.util.Map;

import com.google.gson.JsonArray;
import com.project.review.vo.BoardVO;
import com.project.review.vo.Board_MovieVO;
import com.project.review.vo.GradeVO;
import com.project.review.vo.HashtagVO;
import com.project.review.vo.LikeItVO;
import com.project.review.vo.MovieApiVO;
import com.project.review.vo.ReplyVO;

public interface MovieService {
	// likeItMinus
	public void likeItMinus(LikeItVO likeVO, int board_num, String member_id);
	// likeItPlus
	public void likeItPlus(LikeItVO likeVO, int board_num, String member_id);
	
	// Jsoup getContent
	public String getContent(int board_num);
	
	// insert reply
	public void insertReply(ReplyVO replyVO, String member_id);
	// update reply
	public void updateReply(ReplyVO replyVO, String reply_content);
	// delete reply
	public void deleteReply(int reply_num);
	
	//select Board
	/*plusReadCount*/
	public void plusReadCount(int board_num);
	public BoardVO getBoardById(int board_num);
	
	public List<BoardVO> getMovieBoardList_Best(Board_MovieVO b_MovieVO);
	public List<BoardVO> getMovieBoardList(Board_MovieVO b_MovieVO);
	public int getMovieBoardCount();
	
	// reply
		public int replyCount(int board_num);
		public List<ReplyVO> getMovieBoardReplyList();
		// likeit
		public int likeCount(int board_num);
		public List<LikeItVO> getMovieBoardLikeList();
		public int likeCheck(Map<String, Object> map);
		public List<ReplyVO> replyList(int board_num);
	
	//insert Board 
	public void insertMovie(BoardVO board, Board_MovieVO movie, GradeVO grade, HashtagVO hash, MovieApiVO movieApiVO, String member_id);
	
	/*update Board*/
	public void updateMovie(BoardVO board, Board_MovieVO movie, GradeVO grade, HashtagVO hash, MovieApiVO movieApiVO);
	
	/*delete Board*/
	public void deleteMovie(int board_num);

	//MovieApi
	public JsonArray searchMovie(String movie_nm);
	public void setMovieApi(MovieApiVO movieApiVO);
	public MovieApiVO getMovieInfo(String movie_nm);
	public MovieApiVO getMovie(MovieApiVO movieApiVO);
	
	//Category
	public Map<String, Object> getCategory(String ca_type);
	public Map<String, Object> getCaMovieList(String ca_type, String cd, String nm, int pnum);
	//public Map<String, Object> getCategory2(String category_type);
}
