package com.golforyou.service;

import com.golforyou.vo.GolforyouMemberNEW;

public interface LoginService {

	int idCheck(String username);
	GolforyouMemberNEW getMember(String id);

}
