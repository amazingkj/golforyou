package com.golforyou.config.oauth.provider;

public interface OAuth2UserInfo {
	String getProviderId();
	String getProvider();
	String getEmail();
	String getName();
	
	//
	String getProfile_image();
	String getGender();
	String getMobile();
	String getNickname();
}
