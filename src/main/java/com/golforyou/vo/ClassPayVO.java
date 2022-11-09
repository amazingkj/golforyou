package com.golforyou.vo;

import lombok.Data;

@Data
public class ClassPayVO {

	private Integer pno; //주문번호
	private String nickname; //멤버아이디
	private Integer ono; //클래스 고유번호
	private String pdate; //클래스 결제날짜
	private Integer oprice; //온라인 클래스 가격
	
}
