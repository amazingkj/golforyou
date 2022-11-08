package com.golforyou.dao;

import java.util.List;

import com.golforyou.vo.BoardReplyVO;
import com.golforyou.vo.BoardVO;
import com.golforyou.vo.LikesVO;

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

	//댓글
	void insertReply(BoardReplyVO vo);

	List<BoardReplyVO> replyList(int b_no);

	void updateReply(BoardReplyVO vo);

	void delReply(int r_no);
	
	//좋아요 
	void likeupdate(LikesVO vo);

	int likecount(LikesVO vo);

	void likeinsert(LikesVO vo);

	int likegetinfo(LikesVO vo);

	int liketotalcount(int b_no);

	//void updateliketotalcount(BoardVO b);

}
