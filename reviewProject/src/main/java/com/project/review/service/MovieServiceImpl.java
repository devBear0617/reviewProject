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

	// -- select ---------------------------------------------------------
	
	//게시글 호출
	@Override
	public BoardVO getBoardById(int board_num) {
		// movie/tv/game -> 해당하는 board값 호출하는 함수 작성
		
		return boardDAO.getBoardById(board_num);
	}
	
	//게시판 호출
	@Override
	public List<BoardVO> getBoardList() {
		return boardDAO.getBoardList();
	}
	@Override
	public List<BoardVO> getMovieBoardList() {
		// movie/tv/game -> 해당하는 board값 호출하는 함수 작성,
		
		return boardDAO.getMovieBoardList();
	}

	
	
	// -- insert ---------------------------------------------------------
	
	//게시글 추가 (Board & Board_Movie)
	@Override
	public void insertMovie(BoardVO board, Board_MovieVO movie, HashtagVO hash) {
		
		boardDAO.insertMovie(board);
		movie.setBoard_num(board.getBoard_num());
		hash.setBoard_num(board.getBoard_num());
		boardDAO.insertB_movie(movie);
		boardDAO.insertHashtag(hash);
	}
	
	/*@Override
	public int addBoard(BoardVO boardVO) {
		//member 처리 필요
		boardVO.setMember_id("qwe");
		//board 생성
		boardDAO.setBoard(boardVO);
		Board_MovieVO b = new Board_MovieVO();
		b.setBoard_num(boardVO.getBoard_num());
		//board_movie 생성
		boardDAO.setB_Movie(b);
		
		return boardVO.getBoard_num();
		
		if(b_type.equals("movie") ) {
			boardDAO.setB_Movie(board_num);
		}else if(b_type.equals("tv") ) {
			boardDAO.setB_Movie(board_num);
		}else if(b_type.equals("game") ) {
			boardDAO.setB_Movie(board_num);
		}else {
			System.out.println("b_type 오류");
		}
		
	}*/
	
	
	
	// -- api ---------------------------------------------------------
	
	// 영화 기본 정보 호출
	@Override
	public MovieApiVO getMovieInfo(String movieNm) {
		
		return movieApiDAO.getMovie(movieNm);
	}
}
