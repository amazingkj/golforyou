package com.golforyou.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.golforyou.vo.GolfcouseVO;

@Repository
public class GolfcouseDAOImpl implements GolfcouseDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getRowCount(GolfcouseVO gc) {
		return this.sqlSession.selectOne("golfcouse_count", gc);
	}

	@Override
	public List<GolfcouseVO> getgolfcouseList(GolfcouseVO gc) {
		return this.sqlSession.selectList("golfcouse_list", gc);
	}

	@Override
	public GolfcouseVO getGolfcouse(int gcno) {
		return this.sqlSession.selectOne("getGolfcouse", gcno);
	}

	@Override
	public void insertGolfcouse(GolfcouseVO gc) {
			this.sqlSession.insert("golfcouse_in",gc);
		
	}
	@Override
	public void updategolfcouse(GolfcouseVO gc) {
		System.out.println("=====================================");
		System.out.println(gc.toString());
		this.sqlSession.update("golfcouse_edit", gc);
	}
		
	@Override
	public void deleteGolfcouse(int gc_no) {
		this.sqlSession.delete("gcdelete",gc_no);
		
	}
	
}
