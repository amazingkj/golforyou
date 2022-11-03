package com.golforyou.vo;

import lombok.Data;

@Data
public class GolfcouseVO {

	
	private Integer gc_no; //--골프장 고유번호
	private String	gc_image; //--이미지 경로
	private String	gc_title; //--골프장명
	private String	gc_english; // --골프장영문명
	private String	gc_area; //지역
	private Integer gc_hole; //홀
	private Integer	gc_golf; //파
	private Integer	gc_length; //길이
	private String	gc_kind; //잔디종류
	private String	gc_type; //코스타입
	private String	gc_configuration; //코스구성	 
	private String	gc_caddy; //캐디 (유/무)
	private String 	gc_cart; //카트 (유/무)
	private String	gc_architects; //골프장 설계자
	private String	gc_content; //골프장소개
	private String	gc_coordinates; //지도 좌표값
	private String gc_address_postcode; //우편번호
	private String gc_address_roadAddress; //도로명주소
	private String gc_address_jibunAddress; //지번주소
	private String gc_address_detailAddress; //상세주소
	private String gc_address_extraAddress; //참고항목
	private String	gc_phone; //전화번호
	private String	gc_fax; //팩스
	private String	gc_move; //골프장까지 자차이동경로 
	private String	gc_date; //골프장 개장날짜
	
	
	//페이징(쪽나누기) 관련 변수
	private int startrow; //시작행 번호
	private int endrow;//끝행 번호
		
	//검색관련 변수
	private String find_field;//검색 필드
	private String find_name;//검색어
	

}
