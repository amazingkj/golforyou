package com.golforyou.config.oauth.provider;

import java.util.Map;

public class GoogleUserInfo implements OAuth2UserInfo{

	private Map<String,Object> attributes;//getAttributes()
	
	public GoogleUserInfo(Map<String,Object> attributes) {
		this.attributes = attributes;
	}
	
	@Override
	public String getProviderId() {		
		return (String)attributes.get("sub");
	}
	@Override
	public String getProvider() {
		return "google";
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

	@Override
	public String getProfile_image() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getGender() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getMobile() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getNickname() {
		// TODO Auto-generated method stub
		return null;
	}



}
