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
public class GolforyouMemberNEW implements Serializable{
	@Id 
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="MEMBER_SEQ_GENERATOR")
	private int  mNo;
	
	@Column(name="username" , unique=true)
	private String username;
	
	private String password;
	private String mPhone;
	private String mAddr;
	private String mEmail;
	private String mGender;
	private String mFile;
	
	@ColumnDefault("'1'")
	private int mState;
	private String mRole; //ROLE_USER,ROLE_ADMIN,ROLE_MANAGER
	
	//ouath2를 위한 설정 
	private String mProvider;
	private String mProviderid;
	

	@CreationTimestamp
	private Timestamp mCreateDate;
	
	@Builder
	public GolforyouMemberNEW(int mNo, String username, String password, String mPhone, String mAddr, String mEmail,
			String mGender, String mFile, int mState, String mRole, String mProvider, String mProviderid,
			Timestamp mCreateDate, String mDelcont, String mDeldate) {

		this.mNo = mNo;
		this.username = username;
		this.password = password;
		this.mPhone = mPhone;
		this.mAddr = mAddr;
		this.mEmail = mEmail;
		this.mGender = mGender;
		this.mFile = mFile;
		this.mState = mState;
		this.mRole = mRole;
		this.mProvider = mProvider;
		this.mProviderid = mProviderid;
		this.mCreateDate = mCreateDate;
		this.mDelcont = mDelcont;
		this.mDeldate = mDeldate;
	}
	
	private String mDelcont;
	private String mDeldate;
	
	

}
