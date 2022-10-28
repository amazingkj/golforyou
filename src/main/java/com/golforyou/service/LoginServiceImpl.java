package com.golforyou.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.golforyou.dao.LoginDAO;
import com.golforyou.vo.MemberVO;


@Service
public class LoginServiceImpl implements LoginService {
	
		@Autowired (required = false)
		private LoginDAO loginDAO;


		@Override
		public int idCheck(String username) {
			return this.loginDAO.idCheck(username);
			
		}

		@Override
		public MemberVO getMember(String username) {
		
			return loginDAO.getMember(username);
		}

		@Override
		public MemberVO getPassword(String mEmail) {
			return this.loginDAO.getPassword(mEmail);
			
		}
		
		
}
