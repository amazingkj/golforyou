package com.golforyou.dao;

import java.util.List;

import com.golforyou.vo.GolfcouseVO;
import com.golforyou.vo.ScorecardVO;

public interface GolfcouseDAO {

	int getRowCount(GolfcouseVO gc);
	List<GolfcouseVO> getgolfcouseList(GolfcouseVO gc);
	GolfcouseVO getGolfcouse(int gcno);
	void insertGolfcouse(GolfcouseVO gc);
	void updategolfcouse(GolfcouseVO gc);
	void deleteGolfcouse(int gc_no);
	void updateIndiv(ScorecardVO scv);
	


}
