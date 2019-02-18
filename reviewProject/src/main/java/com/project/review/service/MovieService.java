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
	public int addBoard(BoardVO boardVO);
	
<<<<<<< HEAD
<<<<<<< HEAD
	public void insertBoard(BoardVO vo);
	public void insertB_Movie(int board_num);
=======
	public void insertMovie(BoardVO board, Board_MovieVO movie, HashtagVO hash);
	public void updateMovie(BoardVO board, Board_MovieVO movie, HashtagVO hash);
	public void deleteMovie(int board_num);
>>>>>>> origin/bear1
	
=======
	//MovieApi
	public MovieApiVO getMovieInfo(String movieNm);
>>>>>>> 40d0463a9913e21b8972a123f895c5813490ecd7
}
