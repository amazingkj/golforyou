package com.golforyou.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.golforyou.dao.LoginDAO;
import com.golforyou.vo.GolforyouMemberNEW;


@Service
public class LoginServiceImpl implements LoginService {
	
		@Autowired (required = false)
		private LoginDAO loginDAO;


		@Override
		public GolforyouMemberNEW idCheck(String username) {
			return this.loginDAO.idCheck(username);
			
		}

		@Override
		public GolforyouMemberNEW getMember(String id) {
		
			return loginDAO.getMember(id);
		}
		
		
}