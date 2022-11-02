package com.golforyou.vo;

import lombok.Data;

@Data
public class OnlineClassVO {

	private Integer ono; //클래스 고유번호
	private Integer tno; //외래키 지정
	private String otitle; //클래스명
	private String ophone; //클래스 전화번호
	private String oimage; //이미지 경로
	private String odate; //클래스 개설날짜
	private Integer oprice; //온라인 클래스 가격
	private String odesc; //온라인 클래스 상세 설명
	private Integer otime; //온라인 클래스 수강기간
	private String olevel; //온라인 클래스 추천 레벨

	//페이징(쪽나누기) 관련 변수
	private int startrow; //시작행 번호
	private int endrow;//끝행 번호

	//검색관련 변수
	private String find_field;//검색 필드
	private String find_name;//검색어


}
