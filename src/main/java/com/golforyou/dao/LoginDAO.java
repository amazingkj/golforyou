package com.golforyou.dao;

import com.golforyou.vo.MemberVO;

public interface LoginDAO {

	int idCheck(String username);
	MemberVO getMember(String username);
	MemberVO getPassword(String mEmail);

}
