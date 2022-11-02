package com.golforyou.vo;

import lombok.Data;

@Data
public class FieldClassVO {

	private Integer fno; //클래스 고유번호
	private Integer tno; //강사 고유번호: 외래키 지정
	private String ftitle; //클래스명
	private String fphone; //클래스 전화번호
	private String faddr; //클래스 지역 대분류
	private String faddr2; //클래스 지역 소분류
	private String fimage; //이미지 경로
	private String fdate; //클래스 개설날짜
	private Integer fsprice; //필드 클래스 STANDARD 가격
	private Integer fsrounding; //STANDARD 라운딩 횟수
	private String fsdesc; //STANDARD 상세 설명
	private Integer fstime; //STANDARD 1회당 레슨 시간(분)
	private Integer fdprice; //필드 클래스 DELUXE 가격
	private Integer fdrounding; //DELUXE 라운딩 횟수
	private String fddesc; //DELUXE 상세 설명
	private Integer fdtime; //DELUXE 1회당 레슨 시간(분)
	private Integer fpprice; //필드 클래스 PREMIUM 가격
	private Integer fprounding; //PREMIUM 라운딩 횟수
	private String fpdesc; //PREMIUM 상세 설명
	private Integer fptime; //PREMIUM 1회당 레슨 시간(분)

	//페이징(쪽나누기) 관련 변수
	private int startrow; //시작행 번호
	private int endrow;//끝행 번호

	//검색관련 변수
	private String find_field;//검색 필드
	private String find_name;//검색어


}
