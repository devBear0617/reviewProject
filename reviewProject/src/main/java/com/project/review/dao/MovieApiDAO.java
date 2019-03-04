package com.project.review.dao;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.project.review.vo.MovieApiVO;

public interface MovieApiDAO {
	public JsonArray getMovieArray(String movieNm);
	public MovieApiVO getMovieApi(MovieApiVO movieApiVO);
	//public MovieApiVO getMovie(JsonArray jsonArray);
}
