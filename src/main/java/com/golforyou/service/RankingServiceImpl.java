package com.golforyou.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.golforyou.dao.RankingDAO;
import com.golforyou.vo.MemberVO;
import com.golforyou.vo.RankingVO;
import com.golforyou.vo.ScorecardVO;

@Service
public class RankingServiceImpl implements RankingService {
	
	@Autowired
	private RankingDAO rankingDAO;

	@Override
	public int memberCount() {
		// TODO Auto-generated method stub
		return rankingDAO.memberCount();
	}

	@Override
	public int playCount(String r_id) {
		// TODO Auto-generated method stub
		return rankingDAO.playCount(r_id);
	}

	@Override
	public void updateAvgScore(ScorecardVO sc) {
		// TODO Auto-generated method stub
		rankingDAO.updateAvgScore(sc);
	}

	@Override
	public void createRank(RankingVO r) {
		// TODO Auto-generated method stub
		rankingDAO.createRank(r);
	}

	@Override
	public int getUpdatedScorecardCount(ScorecardVO sc) {
		// TODO Auto-generated method stub
		return rankingDAO.getUpdatedScorecardCount(sc);
	}

	@Override
	public void resetScore(ScorecardVO sc) {
		// TODO Auto-generated method stub
		rankingDAO.resetScore(sc);
	}

	@Override
	public List<RankingVO> getRankList() {
		// TODO Auto-generated method stub
		return rankingDAO.getRankList();
	}

	@Override
	public String getNickname(String sc_id) {
		// TODO Auto-generated method stub
		return rankingDAO.getNickname(sc_id);
	}

	@Override
	public List<MemberVO> getRankList2() {
		// TODO Auto-generated method stub
		return rankingDAO.getRankList2();
	}

	@Override
	public int getPoint(int mno) {
		// TODO Auto-generated method stub
		return rankingDAO.getPoint(mno);
	}
	
}
