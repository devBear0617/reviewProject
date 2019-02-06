package com.project.review.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.project.review.vo.MovieApiVO;

public class MovieApiDAOImpl implements MovieApiDAO{
	private String key;
	public void setKey(String key) {
		this.key = key;
	}

	@Override
	public MovieApiVO getMovie(String query) {
		StringBuffer response = new StringBuffer();
		MovieApiVO movieApiVO = null;
		try {
			String query_e = URLEncoder.encode(query, "UTF-8");
				
			String apiURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key="+key+"&movieNm="+query_e;
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode==200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
			}
			
			String inputLine;
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			JsonParser Parser = new JsonParser();
			JsonObject jsonObj = (JsonObject) Parser.parse(response.toString());
			jsonObj = (JsonObject) jsonObj.get("movieListResult");
			JsonArray jsonArray = (JsonArray) jsonObj.get("movieList");
			JsonObject object = (JsonObject) jsonArray.get(0);

			movieApiVO = new MovieApiVO();
			movieApiVO.setMovieCd(object.get("movieCd").getAsInt());
			movieApiVO.setMovieNm(object.get("movieNm").getAsString());
			movieApiVO.setGenreAlt(object.get("genreAlt").getAsString());
			movieApiVO.setRepNationNm(object.get("repNationNm").getAsString());
			movieApiVO.setPeopleNm(object.get("peopleNm").getAsString());
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return movieApiVO;
	}
}
