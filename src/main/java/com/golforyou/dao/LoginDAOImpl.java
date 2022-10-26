package com.golforyou.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.golforyou.vo.GolforyouMemberNEW;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public GolforyouMemberNEW idCheck(String username) { 
		return this.sqlSession.selectOne("id_check",username);
		
	}//아이디 중복 검사

	@Override
	public GolforyouMemberNEW getMember(String id) {	
		return this.sqlSession.selectOne("getMember",id);
	}//회원정보 수정을 위한 아이디 받아오기
}
