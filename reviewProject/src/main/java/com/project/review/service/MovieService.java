package com.project.review.service;

import java.util.List;

import com.project.review.vo.BoardVO;
import com.project.review.vo.Board_MovieVO;
import com.project.review.vo.HashtagVO;
import com.project.review.vo.MovieApiVO;

public interface MovieService {
	public BoardVO getBoardById(int board_num);
	List<BoardVO> getMovieBoardList();
	public MovieApiVO getMovieInfo(String movieNm);
	
<<<<<<< HEAD
	public void insertBoard(BoardVO vo);
	public void insertB_Movie(int board_num);
=======
	public void insertMovie(BoardVO board, Board_MovieVO movie, HashtagVO hash);
	public void updateMovie(BoardVO board, Board_MovieVO movie, HashtagVO hash);
	public void deleteMovie(int board_num);
>>>>>>> origin/bear1
	
}
