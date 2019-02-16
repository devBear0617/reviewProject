package com.project.review.dao;

import java.util.List;

import com.project.review.vo.BoardVO;
import com.project.review.vo.HashtagVO;


public interface BoardDAO {
	public List<BoardVO> getMovieBoardList();
	public List<BoardVO> getTvBoardList();
	public BoardVO getBoardById(int board_num);
	
	public void Board_write(BoardVO vo);
	public BoardVO searchBoard(int board_num);
	public BoardVO newBoard(String board_title, String board_content, String member_id);
	
	public void insertMovie(BoardVO board);
	/*public void insertMovieNum(int board_num);
	public HashtagVO insertHashtag(int board_num);*/
	public void insertHashtag(HashtagVO hash);
	
}
