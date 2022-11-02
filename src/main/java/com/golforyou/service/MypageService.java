package com.golforyou.service;


import com.golforyou.vo.MemberVO;
import com.golforyou.vo.RankingVO;
import com.golforyou.vo.WithdrawalVO;

public interface MypageService {

	void updateProvince(RankingVO id);

	void updateMember(MemberVO m);

	void withdrawal(String password);

	void saveDelcont(WithdrawalVO w);

	void changePwd(MemberVO member);




}
