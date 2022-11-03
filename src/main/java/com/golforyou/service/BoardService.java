package com.golforyou.service;

import java.util.List;

import com.golforyou.vo.BoardReplyVO;
import com.golforyou.vo.BoardVO;

public interface BoardService {
	
	void insertBoard(BoardVO b);
	
	List<BoardVO> getboardList(BoardVO b);

	int getRowCount(BoardVO b);

	BoardVO getBoardCont(int b_no);

	BoardVO getBoardCont2(int b_no);

	void replyboard(BoardVO rb);

	void editboard(BoardVO eb);

	void delboard(int b_no);
	
	
//	//여기 부터 댓글
//	int register(BoardReplyVO vo);
//
//	BoardReplyVO getOneReply(Long r_no);  
//	
//	int deleteReply(Long r_no);
//	int modify(BoardReplyVO reply);
//
//	List<BoardReplyVO> getReplyList(
//			@Param("cri") Criteria cri,
//			@Param("bno") Long b_no);
	
	void insertReply(BoardReplyVO vo);

	List<BoardReplyVO> replyList(int b_no);
 //타입이 Object로 만들어지는 경우가 간혹 있으니, 주의하고 꼭 타입을 수정할 것
	//타입이 오류가 있으면 Controller도 오류가 생김

	void updateReply(BoardReplyVO vo);

	void delReply(int r_no);
	
}
