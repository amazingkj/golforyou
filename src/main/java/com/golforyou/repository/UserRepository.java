package com.golforyou.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.golforyou.vo.MemberVO;

public interface UserRepository extends JpaRepository<MemberVO, Integer> {

	
	//public MemberVO findBymId(String mId);
	//public MemberVO findByUsername(String username);
	//public MemberVO findBymId(String username);
	//public MemberVO findByUsername(String username);
	
	public MemberVO findByUsername(String username); //JPA Query method() 

	public int deleteByUsername(String username);

}
