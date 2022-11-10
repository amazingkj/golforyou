package com.golforyou.vo;

import lombok.Data;

@Data
public class ScorecardVO {
	private int s_no;
	private String s_id;
	private String s_nickname;
	private String s_location;
	private double s_putting;
	private int s_range;
	private String s_date;
	private int s_sort;
	private double s_sumscore;
	private int s_updated;
	private int s_strike;
	private int s_obandhazard;
	
	private String graph_date;
	
	//쪽나누기 변수
	private int startrow;
	private int endrow;
	
	//지역 수정변수
	private String oldLocation;
	private String newLocation;
}
