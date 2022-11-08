package com.golforyou.vo;

import lombok.Data;

@Data
public class Gc_replyVO {

	
	private int gc_rno;//댓글번호
	private int gc_no;//외래키로 설정된 게시판 번호
	private String gc_replyer;//댓글 작성자
	private String gc_replytext;//댓글 내용
	private String gc_regdate;//댓글등록날짜
	private String gc_update;//댓글수정날짜
	
	

}
