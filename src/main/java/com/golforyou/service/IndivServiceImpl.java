package com.golforyou.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.golforyou.dao.IndivDAO;
import com.golforyou.vo.ScboardVO;
import com.golforyou.vo.ScorecardVO;

@Service
public class IndivServiceImpl implements IndivService {
	
	@Autowired
	private IndivDAO indivDAO;

	@Override
	public int getPoint(String id) {
		// TODO Auto-generated method stub
		return indivDAO.getPoint(id);
	}

	@Override
	public int monthCount(ScorecardVO sv) {
		// TODO Auto-generated method stub
		return indivDAO.monthCount(sv);
	}

	@Override
	public List<String> getRowNum(String id) {
		// TODO Auto-generated method stub
		return indivDAO.getRowNum(id);
	}

	@Override
	public void autoInsert(ScboardVO sb) {
		// TODO Auto-generated method stub
		indivDAO.autoInsert(sb);
	}

	@Override
	public String makeDate(ScboardVO sb) {
		// TODO Auto-generated method stub
		return indivDAO.makeDate(sb);
	}

	@Override
	public void sortDate(ScboardVO sb) {
		// TODO Auto-generated method stub
		indivDAO.sortDate(sb);
	}

	@Override
	public List<Integer> getOBandHazard(String id) {
		// TODO Auto-generated method stub
		return indivDAO.getOBandHazard(id);
	}

	@Override
	public List<Integer> getStrike(String id) {
		// TODO Auto-generated method stub
		return indivDAO.getStrike(id);
	}

	@Override
	public void sortUpdate(ScboardVO sb) {
		// TODO Auto-generated method stub
		indivDAO.sortUpdate(sb);
	}

	@Override
	public void autoUpdate(ScboardVO sb) {
		// TODO Auto-generated method stub
		indivDAO.autoUpdate(sb);
	}

	@Override
	public List<Integer> getNo(String id) {
		// TODO Auto-generated method stub
		return indivDAO.getNo(id);
	}
	
}
