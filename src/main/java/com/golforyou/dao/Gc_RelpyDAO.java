package com.golforyou.dao;

import java.util.List;

import com.golforyou.vo.Gc_replyVO;

//import java.util.List;

//import com.golforyou.vo.Gc_replyVO;

public interface Gc_RelpyDAO {

	void imsertgcReply(Gc_replyVO vo);
	void gc_updateReply(Gc_replyVO vo);
	List<Gc_replyVO> gc_replyList(int gc_no);
	void gc_delReply(int gc_rno);

}
