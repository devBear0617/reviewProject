package com.project.review.service;

import java.util.List;

import com.project.review.vo.BoardVO;
import com.project.review.vo.MovieApiVO;

public interface MovieService {
	public BoardVO getBoardById(int board_num);
	List<BoardVO> getBoardList();
	public MovieApiVO getMovieInfo(String movieNm);
}
