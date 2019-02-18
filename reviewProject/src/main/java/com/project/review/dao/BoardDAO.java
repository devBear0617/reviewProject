package com.project.review.dao;

import java.util.List;

import com.project.review.vo.BoardVO;
import com.project.review.vo.Board_MovieVO;
import com.project.review.vo.HashtagVO;


public interface BoardDAO {
	public List<BoardVO> getMovieBoardList();
	public List<BoardVO> getTvBoardList();
	public BoardVO getBoardById(int board_num);
	
	public void insertBoard(BoardVO vo);
	public void insertB_Movie(int board_num);
	
	public BoardVO searchBoard(int board_num);
	public BoardVO newBoard(String board_title, String board_content, String member_id);
	
	/*insert*/
	public void insertMovie(BoardVO board);
	public void insertB_movie(Board_MovieVO movie);
	public void insertHashtag(HashtagVO hash);
	/*update*/
	public void updateMovie(BoardVO board);
	public void updateB_movie(Board_MovieVO movie);
	public void updateHashtag(HashtagVO hash);
	/*delete*/
	public void deleteMovie(int board_num);
	public void deleteB_movie(int board_num);
	public void deleteHashtag(int board_num);	
	
}
