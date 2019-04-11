package com.project.review.dao;

import java.util.List;
import java.util.Map;

import com.project.review.vo.BoardVO;

public interface SearchDAO {

	
	// TV
	public List<BoardVO> searchTV(String keyword);
	
	// Game
	public List<BoardVO> searchGame(String keyword);
	
	// MOVIE
	public List<BoardVO> searchMovie(Map<String,Object> map);
	public int searchMovie_cnt(String keyword);
	
		public List<BoardVO> searchMovie_likeCount(Map<String,Object> map);
		public int searchMovie_likeCount_cnt(String keyword);
		
		public List<BoardVO> searchMovie_Grade(Map<String,Object> map);
		public int searchMovie_Grade_cnt(String keyword);
		
		public List<BoardVO> searchMovie_titleContent(Map<String,Object> map);
		public int searchMovie_titleContent_cnt(String keyword);
		
		public List<BoardVO> searchMovie_Member(Map<String,Object> map);
		public int searchMovie_Member_cnt(String keyword);
		
		public List<BoardVO> searchMovie_ReplyContent(Map<String,Object> map);
		public int searchMovie_ReplyContent_cnt(String keyword);
		
		public List<BoardVO> searchMovie_Hashtag(Map<String,Object> map);
		public int searchMovie_Hashtag_cnt(String keyword);
	
	// TOTAL
	public List<BoardVO> searchTotal(Map<String,Object> map);
	public int searchTotal_cnt(String keyword);
	

}
