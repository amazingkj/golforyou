package com.golforyou.dao;

import com.golforyou.vo.GolforyouMemberNEW;

public interface LoginDAO {

	int idCheck(String username);
	GolforyouMemberNEW getMember(String id);

}
