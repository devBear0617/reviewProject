package com.project.review.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.review.vo.BoardVO;

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
	

}
