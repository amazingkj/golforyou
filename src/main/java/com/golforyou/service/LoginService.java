package com.golforyou.service;

import com.golforyou.vo.GolforyouMemberNEW;

public interface LoginService {

	GolforyouMemberNEW idCheck(String username);
	GolforyouMemberNEW getMember(String id);

}
