package com.golforyou.dao;

import com.golforyou.vo.GolforyouMemberNEW;
import com.golforyou.vo.RankingVO;

public interface MypageDAO {

	void updateMember(String m);

	void updateProvince(RankingVO id);

	void withdrawal(String password);

}
