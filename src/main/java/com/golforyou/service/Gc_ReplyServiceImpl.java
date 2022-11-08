package com.golforyou.service;

import java.util.List;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.golforyou.dao.Gc_RelpyDAO;
//import com.golforyou.vo.Gc_replyVO;
import com.golforyou.vo.Gc_replyVO;



@Service
public class Gc_ReplyServiceImpl implements Gc_ReplyService {

	@Autowired
	private Gc_RelpyDAO gc_RelpyDAO;

	@Override
	public void insertgcReply(Gc_replyVO vo) {
		this.gc_RelpyDAO.imsertgcReply(vo);
		
	}

	@Override
	public void gc_updateReply(Gc_replyVO vo) {
		this.gc_RelpyDAO.gc_updateReply(vo);
		
	}

	@Override
	public List<Gc_replyVO> gc_replyList(int gc_no) {
		return this.gc_RelpyDAO.gc_replyList(gc_no);
	}

	@Override
	public void gc_delReply(int gc_rno) {
		this.gc_RelpyDAO. gc_delReply(gc_rno);
		
	}
}
