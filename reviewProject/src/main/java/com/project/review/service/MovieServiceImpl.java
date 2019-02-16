package com.project.review.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.review.dao.BoardDAO;
import com.project.review.dao.MovieApiDAO;
import com.project.review.vo.BoardVO;
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
	public void insertMovie(BoardVO board) {
		
		boardDAO.insertMovie(board);
		
	}
	
/*	@Override
	public void insertMovieNum(int board_num) {
		
		boardDAO.insertMovieNum(board_num);
	}
	
	@Override
	public HashtagVO insertHashtag(int board_num) {
		
		return boardDAO.insertHashtag(board_num);
	}*/
	
	/*@Override
	public void updateHashtag(HashtagVO hash) {
		
		boardDAO.updateHashtag(hash);
	}*/


}
