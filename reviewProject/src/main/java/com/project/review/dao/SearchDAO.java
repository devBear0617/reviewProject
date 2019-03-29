package com.project.review.dao;

import java.util.List;

public interface SearchDAO {

	
	// TV
	public List<BoardVO> searchTV(String keyword);
	
	// Game
	public List<BoardVO> searchGame(String keyword);
	
	// MOVIE
	public List<BoardVO> searchMovie(String keyword);
		public List<BoardVO> searchMovie_likeCount(String keyword);
		public List<BoardVO> searchMovie_Grade(String keyword);
		public List<BoardVO> searchMovie_titleContent(String keyword);
		public List<BoardVO> searchMovie_Member(String keyword);
		public List<BoardVO> searchMovie_ReplyContent(String keyword);
		public List<BoardVO> searchMovie_Hashtag(String keyword);
	
	// TOTAL
<<<<<<< HEAD
	public List<Integer> searchTotal(String keyword);
=======
	public List<BoardVO> searchTotal(String keyword);
	
	
	
>>>>>>> BearB
}
