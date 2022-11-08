package com.golforyou.vo;

import lombok.Data;

@Data
public class LikesVO {

	private int likes_no; //눌리면 1 취소하면 0 
	private int board_no; //게시물 기본키
	private String nickname; //멤버 닉네임
	
	private int count; //좋아요가 눌린상태인지 확인 
	//private int likestotal; //게시판 별 좋아요 총 횟수
	
}
