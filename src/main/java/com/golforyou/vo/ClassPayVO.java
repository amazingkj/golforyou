package com.golforyou.vo;

import lombok.Data;

@Data
public class ClassPayVO {

	private String username; //멤버아이디
	private Integer pno; //주문번호
	private Integer ono; //온라인 클래스 고유번호
	private String otitle; //클래스명
	private Integer oprice; //온라인 클래스 가격
	private String odesc; //온라인 클래스 상세 설명
	private Integer otime; //온라인 클래스 수강기간
	private String olevel; //온라인 클래스 추천 레벨
	private String pdate; //결제날짜
	
}
