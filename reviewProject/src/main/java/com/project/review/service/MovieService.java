package com.project.review.service;

import java.util.List;

import com.project.review.vo.BoardVO;
import com.project.review.vo.Board_MovieVO;
import com.project.review.vo.GradeVO;
import com.project.review.vo.HashtagVO;
import com.project.review.vo.MovieApiVO;

public interface MovieService {
	//select Board
	public BoardVO getBoardById(int board_num);
	public List<BoardVO> getBoardList();
	public List<BoardVO> getMovieBoardList();
	
	//insert Board 
	/*public int addBoard(BoardVO boardVO);*/
	public void insertMovie(BoardVO board, Board_MovieVO movie, GradeVO grade, HashtagVO hash);
	/*update Board*/
	public void updateMovie(BoardVO board, Board_MovieVO movie, GradeVO grade, HashtagVO hash);
	/*delete Board*/
	public void deleteMovie(int board_num);
	
	//MovieApi
	public MovieApiVO getMovieInfo(String movieNm);
}
