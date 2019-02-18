package com.project.review.dao;

import java.util.List;

import com.project.review.vo.BoardVO;
import com.project.review.vo.Board_MovieVO;
import com.project.review.vo.HashtagVO;

public interface BoardDAO {
	//select Board
	public BoardVO getBoardById(int board_num);
	public List<BoardVO> getBoardList();
	public List<BoardVO> getMovieBoardList();
	public List<BoardVO> getTvBoardList();
	
/*	//insert Board
	public void setBoard(BoardVO boardVO);
	//public void setB_Movie(int board_num);
	public void setB_Movie(Board_MovieVO b_movie);*/

	/*
		겹치는 내용
		Board_write = newBoard = setBoard(신규) -> 내용 추가되어 임시로setBoard 사용. 추후 변경 가능 
		searchBoard = getBoardById(초기 생성) -> 제일 처음에 작성한 getBoardById 사용. 다른 메소드와 명칭 통일하기 위해 추후에도 사용 예정. 
	*/
	/*public void board_write(BoardVO vo);*/
	public BoardVO searchBoard(int board_num);
	public BoardVO newBoard(String board_title, String board_content, String member_id);
	
	/*-------------------------------------------------------*/
	
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
