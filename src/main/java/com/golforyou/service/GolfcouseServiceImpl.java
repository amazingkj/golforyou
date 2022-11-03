package com.golforyou.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.golforyou.dao.GolfcouseDAO;
import com.golforyou.vo.GolfcouseVO;


@Service
public class GolfcouseServiceImpl implements GolfcouseService {

	@Autowired
	private GolfcouseDAO golfcouseDao;

	@Override
	public int getRowCount(GolfcouseVO gc) {
		return this.golfcouseDao.getRowCount(gc);
	}

	@Override
	public List<GolfcouseVO> getgolfcouseList(GolfcouseVO gc) {
		return this.golfcouseDao.getgolfcouseList(gc);
	}

	@Override
	public GolfcouseVO getGolfcouse(int gcno) {
		return this.golfcouseDao.getGolfcouse(gcno);
	}

	@Override
	public void insertGolfcouse(GolfcouseVO gc) {
		this.golfcouseDao.insertGolfcouse(gc);
		
	}
	
	@Override
	public void updategolfcouse(GolfcouseVO gc) {
		this.golfcouseDao.updategolfcouse(gc);
	}


	@Override
	public void deleteGolfcouse(int gc_no) {
		this.golfcouseDao.deleteGolfcouse(gc_no);
		
	}


	
	
}
