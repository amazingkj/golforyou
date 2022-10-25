package com.golforyou.service;

import com.golforyou.vo.GolforyouMemberNEW;
import com.golforyou.vo.RankingVO;

public interface MypageService {

	void updateProvince(RankingVO id);

	void updateMember(String m);

	void withdrawal(String password);




}
