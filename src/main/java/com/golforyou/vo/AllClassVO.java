package com.golforyou.vo;

import lombok.Data;

@Data
public class AllClassVO {

	//필드 클래스 정보
	private Integer ano; //클래스 고유번호
	private String atitle; //클래스명
	private String aimage; //이미지 경로
	private Integer aprice; //필드 클래스 STANDARD 가격
	private String classtype;
	
	//강사 정보
	private Integer tno; //강사 고유번호: 외래키 지정
	private String tname; //강사명
	
	//페이징(쪽나누기) 관련 변수
	private int startrow; //시작행 번호
	private int endrow;//끝행 번호

	//검색관련 변수
	private String find_field;//검색 필드
	private String find_name;//검색어


}
