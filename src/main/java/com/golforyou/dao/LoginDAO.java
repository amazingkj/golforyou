package com.golforyou.dao;

import com.golforyou.vo.GolforyouMemberNEW;

public interface LoginDAO {

	GolforyouMemberNEW idCheck(String username);
	GolforyouMemberNEW getMember(String id);

}
