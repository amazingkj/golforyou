package com.golforyou.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.golforyou.vo.ScboardVO;
import com.golforyou.vo.ScorecardVO;

@Repository
public class IndivDAOImpl implements IndivDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getPoint(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("rank_loginpoint", id);
	}

	@Override
	public List<Integer> getPutting(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sc_putting", id);
	}

	@Override
	public int monthCount(ScorecardVO sv) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sc_graph", sv);
	}

	@Override
	public List<String> getRowNum(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sc_row", id);
	}

	@Override
	public List<String> getDate(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sc_date", id);
	}

	@Override
	public List<Integer> getSumScore(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sc_sumscore", id);
	}

	@Override
	public List<String> getLocation(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sc_location", id);
	}

	@Override
	public List<Integer> getRange(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sc_range", id);
	}

	@Override
	public List<Integer> getSumPoint(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sc_sumpoint", id);
	}

	@Override
	public void autoInsert(ScboardVO sb) {
		// TODO Auto-generated method stub
		sqlSession.insert("sc_auto", sb);
	}

	@Override
	public String makeDate(ScboardVO sb) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sc_makedate", sb);
	}

	@Override
	public void sortDate(ScboardVO sb) {
		// TODO Auto-generated method stub
		sqlSession.update("sc_sort", sb);
	}

	@Override
	public List<Integer> getOBandHazard(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sc_obandhazard", id);
	}

	@Override
	public List<Integer> getStrike(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sc_strike", id);
	}

	@Override
	public void sortUpdate(ScboardVO sb) {
		// TODO Auto-generated method stub
		sqlSession.update("sc_sortupdate",sb);
	}

	@Override
	public void autoUpdate(ScboardVO sb) {
		// TODO Auto-generated method stub
		sqlSession.update("sc_contupdate", sb);
	}

	@Override
	public List<Integer> getNo(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sc_ino",id);
	}
	
}
