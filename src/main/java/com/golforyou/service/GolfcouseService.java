package com.golforyou.service;

import java.util.List;

import com.golforyou.vo.GolfcouseVO;
import com.golforyou.vo.ScorecardVO;

public interface GolfcouseService {

	int getRowCount(GolfcouseVO gc);//골프장 목로 검색전 총레코드 개수,검색후 레코드 개수
	List<GolfcouseVO> getgolfcouseList(GolfcouseVO gc);// /골프장 목로 검색 전후 목록
	GolfcouseVO getGolfcouse(int gcno);//골프장검색
	void insertGolfcouse(GolfcouseVO gc);//관리자 골프장등록
	void updategolfcouse(GolfcouseVO gc);//골프장수정
	void deleteGolfcouse(int gc_no);//골프장삭제
	void updateIndiv(ScorecardVO scv);
	
	
	

}
