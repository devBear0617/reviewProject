package com.project.review.service;

import java.util.List;

import com.project.review.vo.BoardVO;


public interface SearchService {
	
	// TV
	public List<BoardVO> searchTV(String keyword);
	
	// Game
	public List<BoardVO> searchGame(String keyword);
	
	// MOVIE
	public List<BoardVO> searchMovie(String keyword, int pnum);
	public int searchMovie_cnt(String keyword);
	
		public List<BoardVO> searchMovie_likeCount(String keyword , int pnum);
		public int searchMovie_likeCount_cnt(String keyword);
		
		public List<BoardVO> searchMovie_Grade(String keyword, int pnum);
		public int searchMovie_Grade_cnt(String keyword);
		
		public List<BoardVO> searchMovie_titleContent(String keyword, int pnum);
		public int searchMovie_titleContent_cnt(String keyword);
		
		public List<BoardVO> searchMovie_Member(String keyword, int pnum);
		public int searchMovie_Member_cnt(String keyword);
		
		public List<BoardVO> searchMovie_ReplyContent(String keyword, int pnum);
		public int searchMovie_ReplyContent_cnt(String keyword);
		
		public List<BoardVO> searchMovie_Hashtag(String keyword, int pnum);
		public int searchMovie_Hashtag_cnt(String keyword);
		
	// TOTAL
	public List<BoardVO> searchTotal(String keyword, int pnum);
	public int searchTotal_cnt(String keyword);
	

}
