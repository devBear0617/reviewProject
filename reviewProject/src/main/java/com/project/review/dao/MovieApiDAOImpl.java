package com.project.review.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.project.review.vo.MovieApiVO;


public class MovieApiDAOImpl implements MovieApiDAO{
	private String key; 
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
	public JsonObject commonContent(String apiURL, Boolean isNaver) {
		StringBuffer response = new StringBuffer();
		JsonObject jsonObj = null;
		
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			if (isNaver) {
				con.setRequestProperty("X-Naver-Client-Id", clientId);
				con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			}
			int responseCode = con.getResponseCode();
			
			BufferedReader br;
			if(responseCode==200) 
				br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
			else 
				br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
			
			String inputLine;
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			JsonParser Parser = new JsonParser();
			jsonObj = (JsonObject) Parser.parse(response.toString());
		} catch (Exception e) {
			System.out.println("commonContent Error : "+e);
		}
		
		return jsonObj;
	}
	
	@Override
	public JsonArray getNaverMovieArray(String movieNm) {
		JsonArray jsonArray = null;
		
		try {
			String query = URLEncoder.encode(movieNm, "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/movie?encoding=utf-8&query="+query+"&display=8";
			
			JsonObject jsonObj = commonContent(apiURL, true);
			jsonArray = (JsonArray) jsonObj.get("items");
		} catch (Exception e) {
			System.out.println("getJson Error : "+e);
		}
		return jsonArray;
	}
	
	@Override
	public MovieApiVO contactNMovieApi(JsonArray jsonArray, MovieApiVO movieApiVO) {
		Optional<JsonArray> opt = Optional.ofNullable(jsonArray);

		if (opt.isPresent()) {
			JsonObject object = (JsonObject) jsonArray.get(0);
			movieApiVO.setDirector(object.get("director").getAsString());
			movieApiVO.setActor(object.get("actor").getAsString());
			movieApiVO.setPoster(object.get("image").getAsString());
		}
		return movieApiVO;
	}
	
	@Override
	public MovieApiVO contactMovieApi(MovieApiVO movieApiVO, Boolean isDirector) {
		String apiDirecorURL = "";
		String movieNm = movieApiVO.getMovie_nm();
		
		try {
			if (isDirector) {
				String director = movieApiVO.getDirector().split("|")[0];
				String queryDirector = URLEncoder.encode(director, "UTF-8");
				apiDirecorURL = "&directorNm="+queryDirector;
			}
			String queryMovieNm = URLEncoder.encode(movieNm, "UTF-8");
			String apiURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key="+key+"&movieNm="+queryMovieNm+apiDirecorURL;
			
			JsonObject jsonObj = commonContent(apiURL, false);
			if (!jsonObj.has("movieListResult"))
				return null;
			
			jsonObj = (JsonObject) jsonObj.get("movieListResult");
			JsonArray jsonArray = (JsonArray) jsonObj.get("movieList");
			JsonObject object = (JsonObject) jsonArray.get(0);
			
			movieApiVO.setOpen_dt(object.get("openDt").getAsString());
			movieApiVO.setGenre(object.get("genreAlt").getAsString());
			movieApiVO.setNation(object.get("repNationNm").getAsString());
		} catch (Exception e) {
			System.out.println("getMovieApi Error : "+e);
		}
		return movieApiVO;
	}
	
	
	private Map<String, String> getTypeMap() {
		Map<String, String> map = new HashMap<>();
		map.put("open_dt", "&openStartDt=");
		map.put("movie_type", "&movieTypeCd=");
		map.put("nation", "&repNationCd=");
		
		return map;
	} 
	
	@Override
	public List<String> getCaMNmList(String ca_type, String cd, int pnum) {
		List<String> movieNmList = new ArrayList<>();
		
		try {
			Map<String, String> map = getTypeMap();
			String queryCategory = URLEncoder.encode(cd, "UTF-8");
			String apiURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key="+key+"&curPage="+pnum;
			
			apiURL += map.get(ca_type)+queryCategory;
			if (ca_type.equals("open_dt") && cd!="2010") {
				apiURL += "&openEndDt="+queryCategory;
			}
			
			JsonObject jsonObj = commonContent(apiURL, false);
			jsonObj = (JsonObject) jsonObj.get("movieListResult");
			JsonArray movieArr = (JsonArray) jsonObj.get("movieList");
			
			for (int i = 0; i < movieArr.size(); i++) {
				JsonObject object = (JsonObject) movieArr.get(i);
				movieNmList.add(object.get("movieNm").getAsString());
			}
		} catch (Exception e) {
			System.out.println("getCaMovieArray Error : "+e);
		} 
		return movieNmList;
	}
	
	@Override
	public List<String> getCaPeopleMNmList(String query, int pnum) {
		List<String> movieNmList = new ArrayList<>();
		
		try {
			String queryCategory = URLEncoder.encode(query, "UTF-8");
			String apiURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/people/searchPeopleList.json?key="+key+"&peopleNm="+queryCategory;
			
			JsonObject jsonObj = commonContent(apiURL, false);
			jsonObj = (JsonObject) jsonObj.get("peopleListResult");
			JsonArray jsonArray = (JsonArray) jsonObj.get("peopleList");
			
			JsonObject obj = (JsonObject) jsonArray.get(0);
			String[] array = obj.get("filmoNames").getAsString().split("\\|");
			
			movieNmList = Arrays.asList(array);
		} catch (Exception e) {
			System.out.println("getCaPeople1 Error : "+e);
		}
		return movieNmList;
	}
	
	@Override
	public List<String> getCaRecentMNmList (String ca_type) {
		List<String> movieNmList = new ArrayList<>();
		
		try {
			String queryCategory = URLEncoder.encode(ca_type, "UTF-8");
			String apiURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key="+key+"&targetDt="+queryCategory;
			
			JsonObject jsonObj = commonContent(apiURL, false);
			JsonObject jsonObj2 = (JsonObject) jsonObj.get("boxOfficeResult");
			JsonArray movieArr = (JsonArray) jsonObj2.get("weeklyBoxOfficeList");
			
			for (int i = 0; i < movieArr.size(); i++) {
				JsonObject object = (JsonObject) movieArr.get(i);
				movieNmList.add(object.get("movieNm").getAsString());
			}
		} catch (Exception e) {
			System.out.println("getArray Error : "+e);
		}
		return movieNmList;
	}
}	