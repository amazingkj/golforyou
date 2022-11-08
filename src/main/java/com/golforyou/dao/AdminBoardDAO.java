package com.golforyou.dao;

import java.util.List;


import com.golforyou.vo.AbBoardVO;

public interface AdminBoardDAO {

	int getListCount(AbBoardVO b);
	List<AbBoardVO> getBoardList(AbBoardVO b);
	void insertBoard(AbBoardVO b);
	AbBoardVO getAdminBoardCont(int abboard_no);
	void editBoard(AbBoardVO eb);
	void deleteBoard(int no);
	void updateHit(int abboard_no);

}
