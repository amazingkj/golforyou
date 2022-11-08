package com.golforyou.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.golforyou.vo.AbBoardVO;

@Repository
public class AdminBoardDAOImpl implements AdminBoardDAO {

	@Autowired
	private SqlSession sqlSession;//자동 의존성 주입
	//sqlSession은 mybatis 쿼리문 실행 객체
	@Override
	public void updateHit(int abboard_no) {
		this.sqlSession.update("ab_board_hi",abboard_no);
		//board_hi는 update 아이디명,update()메서드가 레코드
		//수정. this.은 생략가능
	}//조회수 증가	
	@Override
	public int getListCount(AbBoardVO b) {
		return this.sqlSession.selectOne("ab_count",b);
	}//검색전후 레코드 개수	

	@Override
	public List<AbBoardVO> getBoardList(AbBoardVO b) {
		return this.sqlSession.selectList("ab_list", b);
		//selectList()메서드는 복수개의 레코드를 검색해서 컬렉션
		//List로 반환
	}//검색전후 목록

	@Override
	public void insertBoard(AbBoardVO b) {
		this.sqlSession.insert("ab_in",b);
		//ab_in은 insert 아이디명
	}//관리자 게시판 저장

	@Override
	public AbBoardVO getAdminBoardCont(int abboard_no) {
		return this.sqlSession.selectOne("ab_cont",abboard_no);
		//selectOne() 메서드는 단 한개의 레코드만 반환
		//ab_cont는 select 아이디명
	}//내용보기+수정폼

	@Override
	public void editBoard(AbBoardVO eb) {
		this.sqlSession.update("ab_edit",eb);		
	}//수정완료

	@Override
	public void deleteBoard(int no) {
		this.sqlSession.delete("ab_del",no);
		//delete()메서드가 레코드 삭제,ab_del이 delete 아이디명
	}//게시물 삭제
}









