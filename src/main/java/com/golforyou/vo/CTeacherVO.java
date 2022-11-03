package com.golforyou.vo;

import lombok.Data;

@Data
public class CTeacherVO {

	private Integer tno; //강사 고유번호
	private String tname; //강사명
	private String tgender; //강사 성별
	private String tcareer; //강사 소개 또는 경력사항
	private String tdate; //강사 등록 날짜


    //페이징(쪽나누기) 관련 변수
	private int startrow; //시작행 번호
	private int endrow;//끝행 번호
	
	//검색관련 변수
	private String find_field;//검색 필드
	private String find_name;//검색어

}
