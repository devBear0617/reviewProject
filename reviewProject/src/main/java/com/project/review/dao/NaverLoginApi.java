package com.project.review.dao;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverLoginApi extends DefaultApi20 {
	/* 상속을 위한 빈 생성자 , 자가 호출 */
	protected NaverLoginApi() {
	}

	/* 직접적인 접근 피함  */
	private static class InstanceHolder {
		private static final NaverLoginApi INSTANCE = new NaverLoginApi();
	}

	/* 네이버api 접근 개체 */
	public static NaverLoginApi instance() {
		return InstanceHolder.INSTANCE;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		/* 
		 * 네이버 아이디로 로그인 인증 요청
		 * 메서드 : GET/POST 
		 * 출력 포맷 : URL 리다이렉트   
		 */
		return "https://nid.naver.com/oauth2.0/authorize";
	}
}