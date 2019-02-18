package com.project.review.service;

import java.util.List;

import com.project.review.vo.BoardVO;
import com.project.review.vo.Board_MovieVO;
import com.project.review.vo.HashtagVO;
import com.project.review.vo.MovieApiVO;

public interface MovieService {
	//select Board
	public BoardVO getBoardById(int board_num);
	public List<BoardVO> getBoardList();
	public List<BoardVO> getMovieBoardList();
	
	//insert Board 
	/*public int addBoard(BoardVO boardVO);*/
	public void insertMovie(BoardVO board, Board_MovieVO movie, HashtagVO hash);
	/*update Board*/
	
	/*delete Board*/
	
	
	//MovieApi
	public MovieApiVO getMovieInfo(String movieNm);
}
