package com.project.review.service;

import java.util.List;

import com.project.review.vo.BoardVO;
import com.project.review.vo.MovieApiVO;

public interface MovieService {
	//select Board
	public BoardVO getBoardById(int board_num);
	public List<BoardVO> getBoardList();
	public List<BoardVO> getMovieBoardList();
	
	//insert Board 
	public int addBoard(BoardVO boardVO);
	
	//MovieApi
	public MovieApiVO getMovieInfo(String movieNm);
}
