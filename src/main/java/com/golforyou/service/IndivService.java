package com.golforyou.service;

import java.util.List;

import com.golforyou.vo.ScboardVO;
import com.golforyou.vo.ScorecardVO;

public interface IndivService {

	int getPoint(String id);

	List<Integer> getPutting(String id);

	int monthCount(ScorecardVO sv);

	List<String> getRowNum(String id);

	List<String> getDate(String id);

	List<Integer> getSumScore(String id);

	List<String> getLocation(String id);

	List<Integer> getRange(String id);

	List<Integer> getSumPoint(String id);

	void autoInsert(ScboardVO sb);

	String makeDate(ScboardVO sb);

	void sortDate(ScboardVO sb);

	List<Integer> getOBandHazard(String id);

	List<Integer> getStrike(String id);

	void sortUpdate(ScboardVO sb);

	void autoUpdate(ScboardVO sb);

	List<Integer> getNo(String id);

	
}
