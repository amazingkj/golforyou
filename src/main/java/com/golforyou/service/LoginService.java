package com.golforyou.service;

import com.golforyou.vo.MemberVO;

public interface LoginService {

	int idCheck(String username);
	MemberVO getMember(String username);
	MemberVO getPassword(String mEmail);

}
