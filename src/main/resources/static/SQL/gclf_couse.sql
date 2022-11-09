create table golf_couse(
gc_no number(38) primary key , 
gc_image varchar2(200), 
gc_title varchar2(200),
gc_english varchar2(200),
gc_area varchar2(200),
gc_hole varchar2(200), 
gc_golf number(38),
gc_length number(38),
gc_kind varchar2(200),
gc_type varchar2(200),
gc_configuration varchar2(200),
gc_caddy varchar2(200),
gc_cart varchar2(200),
gc_architects varchar2(200), 
gc_content varchar2(2000),
gc_address_postcode varchar2(200),
gc_address_roadAddress varchar2(200),
gc_address_jibunAddress varchar2(200), 
gc_address_detailAddress varchar2(200), 
gc_address_extraAddress varchar2(200),
gc_phone varchar2(50), 
gc_fax varchar2(50), 
gc_move varchar2(1000),
gc_date varchar2(200)
);


create sequence golf_couse_seq
start with 1
increment by 1 
nocache;


create table gc_reply(
    gc_rno number(38) primary key
    ,gc_no number(38) default 0 
    ,gc_replyer varchar2(100) not null
    ,gc_replytext varchar2(4000) not null 
    ,gc_regdate date 
    ,gc_updatedate date 
    ,gc_update date
);


create sequence gc_no_seq
start with 1 
increment by 1  
nocache;



ALTER TABLE gc_reply
ADD CONSTRAINTS gc_reply_gc_no_fk FOREIGN KEY (gc_no) 
REFERENCES golf_couse(gc_no) ON DELETE CASCADE;


create sequence gc_rno_seq
start with 1
increment by 1 
nocache;