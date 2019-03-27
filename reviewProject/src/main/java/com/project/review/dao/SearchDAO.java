package com.project.review.dao;

import java.util.List;

import com.project.review.vo.BoardVO;

public interface SearchDAO {

	// MOVIE
	public List<Integer> searchMovie(String keyword);
		public List<Integer> searchMovie_likeCount(String keyword);
		public List<Integer> searchMovie_Grade(String keyword);
		public List<Integer> searchMovie_titleContent(String keyword);
		public List<Integer> searchMovie_Member(String keyword);
		public List<Integer> searchMovie_ReplyContent(String keyword);
		public List<Integer> searchMovie_Hashtag(String keyword);
	
	// TOTAL
	public List<Integer> searchTotal(String keyword);
	
	
	
}
