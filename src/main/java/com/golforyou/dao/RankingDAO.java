package com.golforyou.dao;

import java.util.List;

import com.golforyou.vo.MemberVO;
import com.golforyou.vo.RankingVO;
import com.golforyou.vo.ScorecardVO;

public interface RankingDAO {

	int memberCount();

	int playCount(String r_id);

	void updateAvgScore(ScorecardVO sc);

	void createRank(RankingVO r);

	int getUpdatedScorecardCount(ScorecardVO sc);

	void resetScore(ScorecardVO sc);

	List<RankingVO> getRankList();

	String getNickname(String sc_id);

	List<MemberVO> getRankList2();

}
