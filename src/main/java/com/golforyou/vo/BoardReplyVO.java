package com.golforyou.vo;

import lombok.Data;

@Data
public class BoardReplyVO {
	private int r_no;
	private int b_no;
	private String reply;
	private String replyer;
	private String replyDate;
	private String updateDate;
	
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate.substring(0,10);
	}
	
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate.substring(0,10);
	}

}
