package com.project.review.service;

import java.util.List;


public interface SearchService {
	
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
