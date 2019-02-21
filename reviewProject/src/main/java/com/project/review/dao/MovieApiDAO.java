package com.project.review.dao;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.project.review.vo.MovieApiVO;

public interface MovieApiDAO {
	public JsonArray searchMovie(String query);
	public JsonObject getMovieNmLsit(JsonArray jsonArray);
	public MovieApiVO getMovie(JsonArray jsonArray);
}
