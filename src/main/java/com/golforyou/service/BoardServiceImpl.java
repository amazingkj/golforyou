package com.golforyou.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.golforyou.dao.BoardDAO;
import com.golforyou.vo.BoardReplyVO;
import com.golforyou.vo.BoardVO;
import com.golforyou.vo.LikesVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public void insertBoard(BoardVO b) {
		this.boardDAO.insertBoard(b);		
	}
	@Override
	public List<BoardVO> getboardList(BoardVO b) {
		return this.boardDAO.getboardList(b);
	}

	@Override
	public int getRowCount(BoardVO b) {
		return boardDAO.getRowCount(b);
	
	}
	@Transactional
	@Override
	public BoardVO getBoardCont(int b_no) {
		this.boardDAO.updateHit(b_no); //조회수 증가
		return this.boardDAO.getBoard_cont(b_no);
	}
	@Override
	public BoardVO getBoardCont2(int b_no) {
		return this.boardDAO.getBoard_cont(b_no);
	}
	
	@Transactional
	@Override
	public void replyboard(BoardVO rb) {
		this.boardDAO.updateLevel(rb);
		this.boardDAO.replyboard(rb);
		
	}
	@Override
	public void editboard(BoardVO eb) {
		this.boardDAO.editboard(eb);
		
	}
	@Override
	public void delboard(int b_no) {
		this.boardDAO.delboard(b_no);	
		
	}
//댓글
	@Override
	public void insertReply(BoardReplyVO vo) {
		this.boardDAO.insertReply(vo);
		
	}

	@Override
	public List<BoardReplyVO> replyList(int b_no) {
		return this.boardDAO.replyList(b_no);
		
	}

	@Override
	public void updateReply(BoardReplyVO vo) {
		this.boardDAO.updateReply(vo);
		
	}

	@Override
	public void delReply(int r_no) {
		this.boardDAO.delReply(r_no);
		
	}
	
	@Override
	public void likeupdate(LikesVO vo) {
		this.boardDAO.likeupdate(vo);
		
	}
	@Override
	public int likecount(LikesVO vo) {
		return this.boardDAO.likecount(vo);
	}
	@Override
	public void likeinsert(LikesVO vo) {
		this.boardDAO.likeinsert(vo);
		
	}
	@Override
	public int likegetinfo(LikesVO vo) {
		return this.boardDAO.likegetinfo(vo);
	}
	@Override
	public int liketotalcount(int b_no) {
		return this.boardDAO.liketotalcount(b_no);
		
	}
//	@Override
//	public void updateliketotalcount(BoardVO b) {
//		this.boardDAO.updateliketotalcount(b);
//		
//	}
	

}
