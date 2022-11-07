package com.golforyou.dao;

import java.util.List;

import com.golforyou.vo.BoardReplyVO;
import com.golforyou.vo.BoardVO;

public interface BoardDAO {
	
	void insertBoard(BoardVO b);
	
	int getRowCount(BoardVO b);

	List<BoardVO> getboardList(BoardVO b);

	BoardVO getBoardCont(int b_no);

	void replyboard(BoardVO rb);

	void editboard(BoardVO eb);

	void delboard(int b_no);

	void updateHit(int b_no);

	BoardVO getBoard_cont(int b_no);

	void updateLevel(BoardVO rb);

//	int register(BoardReplyVO vo);
//
//	BoardReplyVO getOneReply(Long r_no);
//
//	int deleteReply(Long r_no);
//
//	int modify(BoardReplyVO reply);
//
//	List<BoardReplyVO> getReplyList(Criteria cri, Long b_no);

	void insertReply(BoardReplyVO vo);

	List<BoardReplyVO> replyList(int b_no);

	void updateReply(BoardReplyVO vo);

	void delReply(int r_no);

	/*
	 * int SaveHeart(LikesVO to);
	 * 
	 * int RemoveHeart(LikesVO to);
	 */

	BoardVO CountHeart(BoardVO pto);

	void UpHeart(int no);

}
