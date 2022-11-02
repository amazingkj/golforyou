package com.golforyou.service;

import java.util.List;

import com.golforyou.vo.RankingVO;
import com.golforyou.vo.ScorecardVO;

public interface RankingService {

	int memberCount();

	int memberCount(String prov);

	int playCount(String r_id);

	void updateAvgScore(ScorecardVO sc);

	void createRank(RankingVO r);

	int getUpdatedScorecardCount(ScorecardVO sc);

	void resetScore(ScorecardVO sc);

	List<RankingVO> getRankList();

	List<String> getRankName();

	String getNickname(String sc_id);

	
}
