package com.project.review.service;

import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.project.review.vo.BoardVO;
import com.project.review.vo.Board_MovieVO;
import com.project.review.vo.GradeVO;
import com.project.review.vo.HashtagVO;
import com.project.review.vo.MovieApiVO;
import com.project.review.vo.ReplyVO;

public interface MovieService {
	
	// insert reply
	public void insertReply(ReplyVO reply, int board_num, String member_id);
	
	//select Board
	public BoardVO getBoardById(int board_num);
	public List<BoardVO> getBoardList();
	public List<BoardVO> getMovieBoardList();
	
	//insert Board 
	/*public int addBoard(BoardVO boardVO);*/
	public void insertMovie(BoardVO board, Board_MovieVO movie, GradeVO grade, 
			HashtagVO hash, String member_id);
	/*update Board*/
	public void updateMovie(BoardVO board, Board_MovieVO movie, GradeVO grade, HashtagVO hash);
	/*delete Board*/
	public void deleteMovie(int board_num);
	
	//MovieApi
	public JsonObject searchMovie(String movie_nm);
	public MovieApiVO getMovieInfo(String movie_nm);
	
}
