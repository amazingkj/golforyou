package com.golforyou.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.golforyou.dao.MypageDAO;
import com.golforyou.vo.GolforyouMemberNEW;
import com.golforyou.vo.RankingVO;

@Service
public class MypageServiceImpl implements MypageService {


	@Autowired (required = false) @Qualifier
	private MypageDAO mypageDao;
	
	
	@Override
	public void updateMember(String username) {
		this.mypageDao.updateMember(username);
	}

	@Override
	public void updateProvince(RankingVO id) {

		this.mypageDao.updateProvince(id);
	}

	@Override
	public void withdrawal(String password) {
		this.mypageDao.withdrawal(password);
		
	}

}
