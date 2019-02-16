package com.project.review.service;

import java.util.List;

import com.project.review.vo.BoardVO;
import com.project.review.vo.Board_MovieVO;
import com.project.review.vo.MovieApiVO;

public interface MovieService {
	public BoardVO getBoardById(int board_num);
	List<BoardVO> getMovieBoardList();
	public MovieApiVO getMovieInfo(String movieNm);
	
	public void insertMovie(BoardVO board);
	public void insertB_movie(Board_MovieVO movie);
/*	public void insertMovieNum(int board_num);
	public HashtagVO insertHashtag(int board_num);*/
	/*public void updateHashtag(HashtagVO hash);*/
	
}
