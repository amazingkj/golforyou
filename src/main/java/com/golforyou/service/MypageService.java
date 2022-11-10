package com.golforyou.service;


import java.util.List;

import com.golforyou.vo.AddrVO;
import com.golforyou.vo.MemberVO;
import com.golforyou.vo.RankingVO;
import com.golforyou.vo.WithdrawalVO;

public interface MypageService {

	void updateProvince(RankingVO id);

	void updateMember(MemberVO m);

	void withdrawal(String password);

	void saveDelcont(WithdrawalVO w);

	void changePwd(MemberVO member);

	List<AddrVO> getAddrList();

	int classCount(String username);

	MemberVO getInfo(MemberVO m);




}
