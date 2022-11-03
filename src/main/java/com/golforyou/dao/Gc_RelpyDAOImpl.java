package com.golforyou.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.golforyou.vo.Gc_replyVO;

@Repository
public class Gc_RelpyDAOImpl implements Gc_RelpyDAO {


	@Autowired
	private SqlSession sqlSession;

	@Override
	public void imsertgcReply(Gc_replyVO vo) {
			this.sqlSession.insert("gc_reply_in",vo);
		
	}

	@Override
	public void gc_updateReply(Gc_replyVO vo) {
		this.sqlSession.update("gc_updatereply",vo);
	}

	@Override
	public List<Gc_replyVO> gc_replyList(int gc_no) {
		return this.sqlSession.selectList("gc_reply_list",gc_no);
	}

	@Override
	public void gc_delReply(int gc_rno) {
		
		this.sqlSession.delete("gc_reply_del",gc_rno);
	}
	

}
