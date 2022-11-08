package com.golforyou.service;

import java.util.List;

import com.golforyou.vo.MemberVO;
import com.golforyou.vo.RankingVO;
import com.golforyou.vo.ScorecardVO;

public interface RankingService {

	int memberCount();

	int playCount(String r_id);

	void updateAvgScore(ScorecardVO sc);

	void createRank(RankingVO r);

	int getUpdatedScorecardCount(ScorecardVO sc);

	void resetScore(ScorecardVO sc);

	List<RankingVO> getRankList();

	String getNickname(String sc_id);

	List<MemberVO> getRankList2();

	int getPoint(int mno);

	List<RankingVO> getRankList(String prov);

	List<MemberVO> getRankList2(String prov);

	int memberCount(String prov);
}
