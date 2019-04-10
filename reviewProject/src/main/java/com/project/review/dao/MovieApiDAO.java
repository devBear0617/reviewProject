package com.project.review.dao;

import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.project.review.vo.MovieApiVO;

public interface MovieApiDAO {
	public JsonObject commonContent(String apiURL, Boolean isNaver);
	public JsonArray getNaverMovieArray(String movieNm);
	public MovieApiVO contactNMovieApi(JsonArray jsonArray, MovieApiVO movieApiVO);
	public MovieApiVO contactMovieApi(MovieApiVO movieApiVO, Boolean isDirector);
	
	public List<String> getCaMNmList(String ca_type, String cd, int pnum);
	public List<String> getCaPeopleMNmList(String query, int pnum);
	public List<String> getCaRecentMNmList(String ca_type);
}
