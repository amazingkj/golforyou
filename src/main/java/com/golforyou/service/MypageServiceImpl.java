//package com.golforyou.service;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.stereotype.Service;
//
//import com.golforyou.dao.MypageDAO;
//import com.golforyou.vo.MemberVO;
//import com.golforyou.vo.RankingVO;
//
//@Service
//public class MypageServiceImpl implements MypageService {
//
//
//	@Autowired @Qualifier
//	private MypageDAO mypageDao;
//	
//	
//	@Override
//	public void updateMember(MemberVO id) {
//
//		this.mypageDao.updateMember(id);
//	}
//
//	@Override
//	public void updateProvince(RankingVO id) {
//
//		this.mypageDao.updateProvince(id);
//	}
//
//	@Override
//	public void withdrawal(String m_pw) {
//		this.mypageDao.withdrawal(m_pw);
//		
//	}
//
//}
