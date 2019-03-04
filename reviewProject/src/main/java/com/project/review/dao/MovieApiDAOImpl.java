package com.project.review.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.project.review.vo.MovieApiVO;

public class MovieApiDAOImpl implements MovieApiDAO{
	//영화진흥원 Api 
	private String key;
	//naverApi
	private String clientId;
    private String clientSecret;
	
	public void setKey(String key) {
		this.key = key;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}

	@Override
	public JsonArray getMovieArray(String movieNm) {
		StringBuffer response = new StringBuffer();
		JsonArray jsonArray = null;
		
		try {
			String query = URLEncoder.encode(movieNm, "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/movie?encoding=utf-8&query="+query+"&display=8";
			
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
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
			jsonArray = (JsonArray) jsonObj.get("items");
		} catch (Exception e) {
			System.out.println("getJson"+e);
		}
		return jsonArray;
	}
	
	@Override
	public MovieApiVO getMovieApi(MovieApiVO movieApiVO) {
		StringBuffer response = new StringBuffer();
		String director = movieApiVO.getDirector();
		director = director.split("|")[0];
		String movieNm = movieApiVO.getMovie_nm();
		if (movieNm.contains(" - ")) {
			String movieNm1 = movieNm.split(" - ")[0];
			String movieNm2 = movieNm.split(" - ")[1].split("부")[0];
			movieNm = movieNm1+movieNm2;
			System.out.println(movieNm);
		}
		System.out.println(movieNm);
		try {
			String queryMovieNm = URLEncoder.encode(movieNm, "UTF-8");
			String queryDirector = URLEncoder.encode(director, "UTF-8");
			System.out.println(queryMovieNm+" "+queryDirector);
			String apiURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key="+key+"&movieNm="+queryMovieNm+"&directorNm="+queryDirector;
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
			if (!jsonObj.has("movieListResult"))
				return null;
				
			jsonObj = (JsonObject) jsonObj.get("movieListResult");
			JsonArray jsonArray = (JsonArray) jsonObj.get("movieList");
			System.out.println(">>>"+jsonArray);
			JsonObject object = (JsonObject) jsonArray.get(0);
			System.out.println(">>>"+object.toString());
			movieApiVO.setOpen_dt(object.get("openDt").getAsString());
			movieApiVO.setGenre(object.get("genreAlt").getAsString());
			movieApiVO.setNation(object.get("repNationNm").getAsString());
			System.out.println("movieApiVO : "+movieApiVO.toString());
		} catch (Exception e) {
			System.out.println("searchMovie : "+e);
		}
		
		return movieApiVO;
	}
	
	/*@Override
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
	}*/
}
