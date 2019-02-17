package com.project.review.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.review.dao.BoardDAO;
import com.project.review.dao.MovieApiDAO;
import com.project.review.vo.BoardVO;
import com.project.review.vo.Board_MovieVO;
import com.project.review.vo.HashtagVO;
import com.project.review.vo.MovieApiVO;


@Service
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private MovieApiDAO movieApiDAO;

	@Override
	public BoardVO getBoardById(int board_num) {
		// movie/tv/game -> 해당하는 board값 호출하는 함수 작성
		
		return boardDAO.getBoardById(board_num);
	}

	@Override
	public List<BoardVO> getMovieBoardList() {
		// movie/tv/game -> 해당하는 board값 호출하는 함수 작성,
		
		return boardDAO.getMovieBoardList();
	}

	@Override
	public MovieApiVO getMovieInfo(String movieNm) {
		
		return movieApiDAO.getMovie(movieNm);
	}
	
	@Override
	public void insertMovie(BoardVO board, Board_MovieVO movie, HashtagVO hash) {
		
		boardDAO.insertMovie(board);
		movie.setBoard_num(board.getBoard_num());
		hash.setBoard_num(board.getBoard_num());
		boardDAO.insertB_movie(movie);
		boardDAO.insertHashtag(hash);
	}
	
	@Override
	public void updateMovie(BoardVO board, Board_MovieVO movie, HashtagVO hash) {
		
		board.setBoard_num(board.getBoard_num());
		movie.setBoard_num(board.getBoard_num());
		hash.setBoard_num(board.getBoard_num());
		
		boardDAO.updateMovie(board);
		boardDAO.updateB_movie(movie);
		boardDAO.updateHashtag(hash);
		
	}

	@Override
	public void deleteMovie(int board_num) {	
		
		boardDAO.deleteHashtag(board_num);
		boardDAO.deleteB_movie(board_num);
		boardDAO.deleteMovie(board_num);
		
		
	}
	

}
