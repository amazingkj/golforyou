package com.golforyou.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.golforyou.vo.MemberVO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int idCheck(String username) { 
		return this.sqlSession.selectOne("id_check",username);
		
	}//아이디 중복 검사

	@Override
	public MemberVO getMember(String username) {	
		return this.sqlSession.selectOne("getMember",username);
	}//회원정보 수정을 위한 아이디 받아오기

	@Override
	public MemberVO getPassword(String mEmail) {
		return this.sqlSession.selectOne("getPassword",mEmail);
		
	}

	@Override
	public void updateMailAuth(MemberVO member) {
		
		this.sqlSession.update("updateMailAuth",member);
	}

	@Override
	public void updateTempPwd(MemberVO member) {
		this.sqlSession.update("updateTempPwd",member);
		
	}
}
