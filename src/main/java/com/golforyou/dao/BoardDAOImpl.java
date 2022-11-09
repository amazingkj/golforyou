package com.golforyou.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.golforyou.vo.BoardReplyVO;
import com.golforyou.vo.BoardVO;
//import com.golforyou.vo.LikesVO;
import com.golforyou.vo.LikesVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertBoard(BoardVO b) {
		this.sqlSession.insert("board_write",b);		
	}//게시물 저장 
	
	@Override
	public List<BoardVO> getboardList(BoardVO b) {		
		return sqlSession.selectList("board_list",b);
	}//게시물 목록

	@Override
	public int getRowCount(BoardVO b) {
		return sqlSession.selectOne("board_count",b);
	}//게시물 글 수

	@Override
	public void replyboard(BoardVO rb) {
		this.sqlSession.insert("reply_in2",rb);
	}

	@Override
	public void editboard(BoardVO eb) {
		this.sqlSession.update("board_up",eb);
		
	}

	@Override
	public void delboard(int b_no) {
		this.sqlSession.delete("board_del",b_no);
		
	}

	@Override
	public BoardVO getBoardCont(int b_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHit(int b_no) {
		this.sqlSession.update("board_hit", b_no);
		
	}

	@Override
	public BoardVO getBoard_cont(int b_no) {
		return sqlSession.selectOne("board_co",b_no);
		
	}

	@Override
	public void updateLevel(BoardVO rb) {
		this.sqlSession.update("LevelUp",rb);
		
	}

	@Override
	public void insertReply(BoardReplyVO vo) {
		 this.sqlSession.insert("register", vo);
		
	}
	

	@Override
	public List<BoardReplyVO> replyList(int b_no) {
		return this.sqlSession.selectList("reply_list", b_no);
		//selectList()는 하나 이상의 레코드를 검색, reply_list는 유일한 아이디명(reply.xml)
		
	}//댓글 목록

	@Override
	public void updateReply(BoardReplyVO vo) {
		this.sqlSession.update("reply_edit", vo);
		
	}//댓글 수정

	@Override
	public void delReply(int r_no) {
		this.sqlSession.delete("reply_del",r_no);
		
	}//댓글 삭제


	/*
	 * @Override public int SaveHeart(LikesVO to) { return
	 * this.sqlSession.insert("heart_save",to);
	 * 
	 * }
	 */

	
	/*
	 * public int RemoveHeart(LikesVO to) { return
	 * this.sqlSession.delete("heart_remove",to);
	 * 
	 * }
	 */

	
	//좋아요 2차시도 
	@Override
	public void likeupdate(LikesVO vo) {
		//this.sqlSession.update("likeupdate",vo);
		sqlSession.insert("like_yes",vo);
		sqlSession.update("heart_up",vo);
	}
	

	@Override
	public void likeupdate2(LikesVO vo) {
		// TODO Auto-generated method stub
		sqlSession.delete("like_no",vo);
		sqlSession.update("heart_down",vo);
	}

	@Override
	public int likecount(LikesVO vo) {
		return this.sqlSession.selectOne("likecount",vo);
	}

	@Override
	public void likeinsert(LikesVO vo) {
		this.sqlSession.insert("likeinsert",vo);
		
	}

	@Override
	public int likegetinfo(LikesVO vo) {
		return this.sqlSession.selectOne("likegetinfo",vo);
	}

	@Override
	public int liketotalcount(int b_no) {
		return this.sqlSession.selectOne("liketotalcount",b_no);
	}

	@Override
	public LikesVO getlike(LikesVO like) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("like_exist",like);
	}

	@Override
	public void likeyes(LikesVO like) {
		// TODO Auto-generated method stub
		sqlSession.insert("like_plus",like);
		sqlSession.update("board_likeplus",like);
	}

	@Override
	public void likeno(LikesVO like) {
		// TODO Auto-generated method stub
		sqlSession.delete("like_minus",like);
		sqlSession.update("board_likeminus",like);
	}

	@Override
	public List<String> getReplyNickname(BoardReplyVO rvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reply_nickname",rvo);
	}

//	@Override
//	public void updateliketotalcount(BoardVO b) {
//		this.sqlSession.update("updateliketotalcount",b);
//		
//	}
	
}
