package com.golforyou.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.golforyou.dao.AdminBoardDAO;
import com.golforyou.vo.AbBoardVO;

@Service
public class AdminBoardServiceImpl 
implements AdminBoardService {

	@Autowired
	private AdminBoardDAO adminBoardDAO;
	@Override
	public void updateHit(int abboard_no) {
		this.adminBoardDAO.updateHit(abboard_no);		
	}
	@Override
	public int getListCount(AbBoardVO b) {
		return this.adminBoardDAO.getListCount(b);
	}

	@Override
	public List<AbBoardVO> getBoardList(AbBoardVO b) {
		return this.adminBoardDAO.getBoardList(b);
	}

	@Override
	public void insertBoard(AbBoardVO b) {
		this.adminBoardDAO.insertBoard(b);		
	}

	@Override
	public AbBoardVO getAdminBoardCont(int abboard_no) {
		return this.adminBoardDAO.getAdminBoardCont(abboard_no);
	}

	@Override
	public void editBoard(AbBoardVO eb) {
		this.adminBoardDAO.editBoard(eb);			
	} 

	@Override
	public void deleteBoard(int no) {
		this.adminBoardDAO.deleteBoard(no);		

	}
}















