package com.golforyou.config.oauth.provider;

import java.util.Map;

public class NaverUserInfo implements OAuth2UserInfo{

	private Map<String,Object> attributes;//getAttributes()
	
	public NaverUserInfo(Map<String,Object> attributes) {
		this.attributes = attributes;
	}
	
	@Override
	public String getProviderId() {		
		return (String)attributes.get("id");
	}
	@Override
	public String getProvider() {
		return "naver";
	}
	@Override
	public String getEmail() {
		// TODO Auto-generated method stub
		return (String) attributes.get("email");
	}

	@Override
	public String getName() {
		return (String) attributes.get("name");
	}
	
	public String getProfile_image() {		
		return (String)attributes.get("profile_image");
	}
	
	public String getGender() {		
		return (String)attributes.get("gender");
	}
	
	public String getMobile() {		
		return (String)attributes.get("mobile");
	}
	
	public String getNickname() {		
		return (String)attributes.get("nickname");
	}



}
