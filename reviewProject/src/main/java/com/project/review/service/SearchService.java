package com.project.review.service;

import java.util.List;

import com.google.gson.JsonArray;
import com.project.review.vo.BoardVO;
import com.project.review.vo.MovieApiVO;

public interface SearchService {
	public List<BoardVO> searchTitle(String s_title);
	public List<MovieApiVO> searchMovie(String s_title);
	public JsonArray s_autocomplete(String s_title, String s_sort);
}
