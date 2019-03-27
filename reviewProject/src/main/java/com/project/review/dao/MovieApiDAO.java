package com.project.review.dao;

import java.util.List;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.project.review.vo.MovieApiVO;

public interface MovieApiDAO {
	public JsonObject commonContent(String apiURL, Boolean isNaver);
	public JsonArray getMovieArray(String movieNm);
	public MovieApiVO getMovieApi(MovieApiVO movieApiVO, Boolean isDirector);
	//public MovieApiVO setMovieApi(MovieApiVO movieApiVO, JsonObject jsonObj);
	public Map<String, Object> setMap(JsonArray jsonArray);
	public Map<String, Object> getMap(String category_type);
	public Map<String, Object> getCaMovieArray(String ca_type, String cd, int pnum);
	
	public JsonArray getCaPeopleArray(String query, int pnum);
	public List<String> getCaPeople1(String query, int pnum);
}
