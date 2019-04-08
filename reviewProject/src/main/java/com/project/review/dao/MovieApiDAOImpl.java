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
	public JsonArray getMovieArray(String movieNm) {
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
	public MovieApiVO getMovieApi(MovieApiVO movieApiVO, Boolean isDirector) {
		String apiDirecorURL = "";
		String movieNm = movieApiVO.getMovie_nm();
		
		try {
			if (isDirector) {
				String director = movieApiVO.getDirector().split("|")[0];
				
				if (movieNm.contains(" - ")) {
					String movieNm1 = movieNm.split(" - ")[0];
					String movieNm2 = movieNm.split(" - ")[1].split("부")[0];
					movieNm = movieNm1+movieNm2;
				}		
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
	
	@Override
	public Map<String, Object> setMap(JsonArray jsonArray) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<String> movieCd = new ArrayList<String>();
			List<String> movieNm = new ArrayList<String>();

			for (int i=0; i<jsonArray.size(); i++) {
				JsonObject jobj = (JsonObject) jsonArray.get(i);
				movieCd.add(jobj.get("movieCd").getAsString());
				movieNm.add(jobj.get("movieNm").getAsString());
			}
			map.put("cd", movieCd);
			map.put("nm", movieNm);
		} catch (Exception e) {
			System.out.println("setMap Error : "+e);
		}
		return map;
	}
	
	@Override
	public Map<String, Object> getMap(String category) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			String queryCategory = URLEncoder.encode(category, "UTF-8");
			String apiURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key="+key+"&targetDt="+queryCategory;
			
			JsonObject jsonObj = commonContent(apiURL, false);
			JsonObject jsonObj2 = (JsonObject) jsonObj.get("boxOfficeResult");
			JsonArray jsonArray = (JsonArray) jsonObj2.get("weeklyBoxOfficeList");
			
			map = setMap(jsonArray);
		} catch (Exception e) {
			System.out.println("getArray Error : "+e);
		}
		return map;
	}
	
	@Override
	public Map<String, Object> getCaMovieArray(String ca_type, String cd, int pnum) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String queryCategory = URLEncoder.encode(cd, "UTF-8");
			String apiURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key="+key+"&curPage="+pnum;
			
			switch (ca_type) {
				case "open_dt":
					if (cd!="2010") {
						apiURL += "&openStartDt="+queryCategory+"&openEndDt="+queryCategory;
					}else {
						apiURL += "&openEndDt="+queryCategory;
					}
					break;
				case "movie_type":
					apiURL += "&movieTypeCd="+queryCategory;
					break;
				case "nation":
					apiURL += "&repNationCd="+queryCategory;
					break;
				default:
					return null;
			}
			JsonObject jsonObj = commonContent(apiURL, false);
			jsonObj = (JsonObject) jsonObj.get("movieListResult");
			JsonArray jsonArray = (JsonArray) jsonObj.get("movieList");
			
			map = setMap(jsonArray);
		} catch (Exception e) {
			System.out.println("getCaMovieArray Error : "+e);
		} 
		return map;
	}
	
	@Override
	public JsonArray getCaPeopleArray(String query, int pnum) {
		JsonArray jsonArray = null;
		try {
			String queryCategory = URLEncoder.encode(query, "UTF-8");
			String apiURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/people/searchPeopleList.json?key="+key+"&peopleNm="+queryCategory;
			
			JsonObject jsonObj = commonContent(apiURL, false);
			jsonObj = (JsonObject) jsonObj.get("peopleListResult");
			jsonArray = (JsonArray) jsonObj.get("peopleList");
			
		} catch (Exception e) {
			System.out.println("getCaPeopleArray Error : "+e);
		} 
		return jsonArray;
	}
	
	@Override
	public List<String> getCaPeople1(String query, int pnum) {
		List<String> list = new ArrayList<String>();
		
		try {
			JsonArray jsonArray = getCaPeopleArray(query, pnum);
			
			JsonObject obj = (JsonObject) jsonArray.get(0);
			String[] array = obj.get("filmoNames").getAsString().split("\\|");
			
			list = Arrays.asList(array);
		} catch (Exception e) {
			System.out.println("getCaPeople1 Error : "+e);
		}
		
		return list;
	}
	
}	