package com.project.review.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.review.vo.BoardVO;
import com.project.review.vo.Board_MovieVO;
import com.project.review.vo.HashtagVO;


public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> getMovieBoardList() {
		return boardDAO.getMovieBoardList();
	}

	@Override
	public BoardVO getBoardById(int board_num) {
		return boardDAO.getBoardById(board_num);
	}

	@Override
	public List<BoardVO> getTvBoardList() {
		return boardDAO.getTvBoardList();
	}

	@Override
	public void Board_write(BoardVO vo) {
		boardDAO.Board_write(vo);
		
	}
	
	@Override
	public BoardVO searchBoard(int board_num) {
		
		return boardDAO.searchBoard(board_num);
	}
	
	@Override
	public BoardVO newBoard(String board_title, String board_content, String member_id) {
		
		return boardDAO.newBoard(board_title, board_content, member_id);
	}
	
	@Override
	public void insertMovie(BoardVO board) {
		
		boardDAO.insertMovie(board);
	}
	
	@Override
	public void insertB_movie(Board_MovieVO movie) {
		
		boardDAO.insertB_movie(movie);
	}
	
	@Override
	public void insertHashtag(HashtagVO hash) {
		
		boardDAO.insertHashtag(hash);
	}
	
	@Override
	public void updateMovie(BoardVO board) {
		
		boardDAO.updateMovie(board);
	}
	
	@Override
	public void updateB_movie(Board_MovieVO movie) {
		
		boardDAO.updateB_movie(movie);
	}
	
	@Override
	public void updateHashtag(HashtagVO hash) {
		
		boardDAO.updateHashtag(hash);
	}
	
}
