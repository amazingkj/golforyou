package com.golforyou.service;

import java.util.List;

import com.golforyou.vo.Gc_replyVO;



public interface Gc_ReplyService {

	void insertgcReply(Gc_replyVO vo);//댓글등록

	void gc_updateReply(Gc_replyVO vo);//수정

	List<Gc_replyVO> gc_replyList(int gc_no);//목록

	void gc_delReply(int gc_rno);//삭제

	

}
