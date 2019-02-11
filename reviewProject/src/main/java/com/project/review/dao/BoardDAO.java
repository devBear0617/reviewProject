package com.project.review.dao;

import java.util.List;

import com.project.review.vo.BoardVO;

public interface BoardDAO {
	public List<BoardVO> getMovieBoardList();
	public List<BoardVO> getTvBoardList();
	public BoardVO getBoardById(int board_num);
	
	public void Board_write(BoardVO vo);
	
}
