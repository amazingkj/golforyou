package com.golforyou.dao;

import java.util.List;

import com.golforyou.vo.AddrVO;
import com.golforyou.vo.MemberVO;
import com.golforyou.vo.RankingVO;
import com.golforyou.vo.WithdrawalVO;

public interface MypageDAO {

	void updateMember(MemberVO m);

	void updateProvince(RankingVO id);

	void withdrawal(String password);

	void saveDelcont(WithdrawalVO w);

	void changePwd(MemberVO member);

	List<AddrVO> getAddrList();

	int classCount(String username);

	MemberVO getInfo(MemberVO m);

	

}