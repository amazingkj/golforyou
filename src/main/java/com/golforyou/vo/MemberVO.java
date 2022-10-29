package com.golforyou.vo;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Entity
@SequenceGenerator(
		name = "MEMBER_SEQ_GENERATOR",
		sequenceName = "MEMBER_SEQ",	//매핑할 DB 시퀀스 이름
		initialValue = 1, allocationSize = 1)
@Data
@NoArgsConstructor
@DynamicInsert
public class MemberVO implements Serializable{
	@Id 
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="MEMBER_SEQ_GENERATOR")
	private int  mno;
	
	@Column(name="username" , unique=true)
	private String username; //id
	private String nickname;
	private String password;
	private String mphone;
	private String maddr;
	private String memail;
	private String mgender;
	private String mfile;
	
	@ColumnDefault("'1'")
	private int mstate;
	private String mrole; //ROLE_USER,ROLE_ADMIN,ROLE_MANAGER
	private String mailkey;
	
	//ouath2를 위한 설정 
	private String mprovider;
	private String mproviderid;
	

	@CreationTimestamp
	private Timestamp mcreatedate;
	
	@Builder
	public MemberVO(int mno, String username, String nickname, String password, String mphone, String maddr, String memail,
			String mgender, String mfile, int mstate, String mrole, String mailkey, String mprovider, String mproviderid,
			Timestamp mcreatedate, String mdelcont, String mdeldate) {

		this.mno = mno;
		this.username = username;
		this.nickname = nickname;
		this.password = password;
		this.mphone = mphone;
		this.maddr = maddr;
		this.memail = memail;
		this.mgender = mgender;
		this.mfile = mfile;
		this.mstate = mstate;
		this.mrole = mrole;
		this.mailkey = mailkey;
		this.mprovider = mprovider;
		this.mproviderid = mproviderid;
		this.mcreatedate = mcreatedate;
		this.mdelcont = mdelcont;
		this.mdeldate = mdeldate;
	}
	
	private String mdelcont;
	private String mdeldate; 
	
	

}
