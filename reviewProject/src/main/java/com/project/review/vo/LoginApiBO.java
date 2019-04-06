package com.project.review.vo;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.project.review.dao.NaverLoginApi;

public class LoginApiBO {
	/* 인증 요청문을 구성하는 파라미터 */
	//client_id: 애플리케이션 등록 후 발급받은 클라이언트 아이디
	//response_type: 인증 과정에 대한 구분값. code로 값 고정.
	//redirect_uri: 네이버 로그인 인증의 결과를 전달받을 콜백 URL(URL 인코딩). 애플리케이션을 등록할 때 Callback URL에 설정한 정보.
	//state: 애플리케이션이 생성한 상태 토큰 . 사이트 간 요청 위조(cross-site request forgery) 공격을 방지하기 위해 애플리케이션에서 생성한 상태 토큰값으로 URL 인코딩을 적용한 값을 사용
	private final static String CLIENT_ID = "JkVf4ViBfh9V1cpbJrwH";
	private final static String CLIENT_SECRET = "iEi_R1G4vQ";
	private final static String REDIRECT_URI = "http://localhost:8081/review/mypage/loginCallback/";
	private final static String SESSION_STATE = "oauth_state";
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	/*	 프로필 조회 API URL 
	 	메서드 : GET/POST
	 	인증 : OAuth2.0
	 	출력형태 : JSON
	 */
    
    /* 네이버 아이디로 인증  URL 생성 */
    public String getAuthorizationUrl(HttpSession session) {
        /* 세션 유효성 검증을 위하여 난수를 생성 */
        String state = generateRandomString();
        setSession(session,state);        

        /* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
        OAuth20Service oauthService = new ServiceBuilder()                                                   
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI)
                .state(state) //앞서 생성한 난수값을 인증 URL생성시 사용함
                .build(NaverLoginApi.instance());
        /**
          	https://nid.naver.com/oauth2.0/authorize?
				response_type=code
				&client_id=JkVf4ViBfh9V1cpbJrwH
				&redirect_uri=http%3A%2F%2Flocalhost%3A8081%2Freview%2FloginApi%2FloginCallbackTest%2F
				&state=f8a7207d-e650-4981-ac2a-9cb1c97bbe14
         */
        return oauthService.getAuthorizationUrl();
    }

    /* 네이버아이디로 Callback 처리 및  AccessToken 획득 Method */
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{

        /* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
        String sessionState = getSession(session);
        if(StringUtils.pathEquals(sessionState, state)){
            OAuth20Service oauthService = new ServiceBuilder()
                    .apiKey(CLIENT_ID)
                    .apiSecret(CLIENT_SECRET)
                    .callback(REDIRECT_URI)
                    .state(state)
                    .build(NaverLoginApi.instance());
            
            /* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
            /*
             * 	•API 요청 성공시 : http://콜백URL/redirect?code={code값}&state={state값}
				•API 요청 실패시 : http://콜백URL/redirect?state={state값}&error={에러코드값}&error_description={에러메시지}
             */
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            
            return accessToken;
        }
        return null;
    }

    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }

    private void setSession(HttpSession session,String state){
        session.setAttribute(SESSION_STATE, state);     
    }

    private String getSession(HttpSession session){
        return (String) session.getAttribute(SESSION_STATE);
    }

    public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{

        OAuth20Service oauthService =new ServiceBuilder()
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI)
                .build(NaverLoginApi.instance());

        /*	사용자 로그인 정보를 획득하기 위해서는 프로필 정보 조회 API를 먼저 호출.
         * 	ex) curl  -XGET "https://openapi.naver.com/v1/nid/me" 
      			-H "Authorization: Bearer AAAAPIuf0L+qfDkMABQ3IJ8heq2mlw71DojBj3oc2Z6OxMQESVSrtR0dbvsiQbPbP1/cxva23n7mQShtfK4pchdk/rc="
         *  요청헤더 : Authorization
         * 	접근 토큰(access token)을 전달하는 헤더
			다음과 같은 형식으로 헤더 값에 접근 토큰(access token)을 포함. 토큰 타입은 "Bearer"로 값 고정.
			Authorization: {토큰 타입] {접근 토큰]
         */
        OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();
        return response.getBody();
    }
    
    private JsonObject getApiCode(String apiResult) {
    	JsonParser Parser = new JsonParser();
    	JsonObject jsonObj = (JsonObject) Parser.parse(apiResult);
    	jsonObj = (JsonObject) jsonObj.get("response");
    	
    	return jsonObj;
    }
    
    public MemberVO setApiCodeToVO(String apiResult) {
    	JsonObject jsonObj = getApiCode(apiResult);
    	MemberVO member = new MemberVO();

    	member.setMember_id(jsonObj.get("email").getAsString());
    	member.setMember_name(jsonObj.get("nickname").getAsString());
    	member.setSns_type("naver");
    	member.setSns_idx(jsonObj.get("id").getAsInt());
    	if (jsonObj.get("profile_image")!=null) {
    		member.setMember_pic(jsonObj.get("profile_image").getAsString());
		}
    	
    	return member;
    }
}
