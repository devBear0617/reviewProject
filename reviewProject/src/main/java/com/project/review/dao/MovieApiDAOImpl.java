package com.project.review.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
	public JsonArray searchMovie(String query) {
		StringBuffer response = new StringBuffer();
		JsonArray jsonArray = null;
		
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
			jsonArray = (JsonArray) jsonObj.get("movieList");

		} catch (Exception e) {
			System.out.println("searchMovie : "+e);
		}
		return jsonArray;
	}
	
	@Override
	public JsonObject getMovieNmLsit(JsonArray jsonArray) {
		JsonObject movieNameObject = new JsonObject();
		try {
			JsonArray movieNmArray = new JsonArray();
			for (int i=0; i<jsonArray.size(); i++) {
				if (i==10) 
					break;
				JsonObject object = (JsonObject) jsonArray.get(i);
				String movieNm = object.get("movieNm").getAsString();
				movieNmArray.add(movieNm);
			}
			movieNameObject.add("movieNmObject", movieNmArray);
		}catch (Exception e) {
			System.out.println("getMovieNmLsit : "+e);
		}
		return movieNameObject;
	}
	
	@Override
	public MovieApiVO getMovie(JsonArray jsonArray) {
		MovieApiVO movieApiVO = null;
		try {
			JsonObject object = (JsonObject) jsonArray.get(0);
			System.out.println(object.toString());
			movieApiVO = new MovieApiVO();
			movieApiVO.setMovie_cd(object.get("movieCd").getAsInt());
			movieApiVO.setMovie_nm(object.get("movieNm").getAsString());
			movieApiVO.setGenre(object.get("genreAlt").getAsString());
			movieApiVO.setNation(object.get("repNationNm").getAsString());
			//movieApiVO.setPeople(object.get("peopleNm").getAsString());
		} catch (Exception e) {
			System.out.println("getMovie : "+e);
		}
		return movieApiVO;
	}
}
