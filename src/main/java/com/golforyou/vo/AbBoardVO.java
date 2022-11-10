package com.golforyou.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class AbBoardVO {
 /*
  *  네임피라미터 이름,빈클래스변수명,테이블 컬럼명을 일치시킨다.
  */
	private int abboard_no;
	private String abboard_name;
	private String abboard_title;
	private String abboard_cont;
	private int abboard_hit;
	private int abboard_ref;
	private int abboard_step;
	private int abboard_level;
	private String abboard_date;
	
	//페이징 쪽나누기 관련변수
    private int startrow;//시작행 번호
    private int endrow;//끝행 번호
    
    //검색기능
    private String find_name;//검색어
    private String find_field;//검색필드 
    

	public void setAbboard_date(String abboard_date) {
		this.abboard_date = abboard_date.substring(0,10);
	}
	
}



















