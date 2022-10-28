package com.golforyou.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.golforyou.vo.MemberVO;
import com.golforyou.vo.RankingVO;
import com.golforyou.vo.WithdrawalVO;

@Repository
public class MypageDAOImpl implements MypageDAO{

	@Autowired (required = false)@Qualifier
	private SqlSession sqlSession;
	
	@Override
	public void updateMember(String username) {
		this.sqlSession.update("update_member", username);
		
	}

	@Override
	public void updateProvince(RankingVO id) {
		this.sqlSession.update("update_province",id);
		
	}

	@Override
	public void withdrawal(String password) {
		this.sqlSession.update("withdrawal",password);
		
	}


	@Override
	public void saveDelcont(WithdrawalVO w) {
		this.sqlSession.insert("saveDelcont",w);
		
	}
	

	
}
