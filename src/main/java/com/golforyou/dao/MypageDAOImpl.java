package com.golforyou.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.golforyou.vo.AddrVO;
import com.golforyou.vo.MemberVO;
import com.golforyou.vo.RankingVO;
import com.golforyou.vo.WithdrawalVO;

@Repository
public class MypageDAOImpl implements MypageDAO{


	@Autowired 
	private SqlSession sqlSession;
	
	@Override
	public void updateMember(MemberVO m) {
		this.sqlSession.update("update_member",m);
		//sqlSession.update("update_rank",m);
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

	@Override
	public void changePwd(MemberVO m) {
		this.sqlSession.update("changePwd",m);
		
	}

	@Override
	public List<AddrVO> getAddrList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("addr_list");
	}

	@Override
	public int classCount(String username) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("class_count",username);
	}

	@Override
	public MemberVO getInfo(MemberVO m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypage_info",m);
	}


	

	
}
