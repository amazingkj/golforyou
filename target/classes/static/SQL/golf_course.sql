--ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½Ìºï¿½ ï¿½ï¿½ï¿½ï¿½
create table golf_couse(
gc_no number(38) primary key , -- ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½È£
gc_image varchar2(200), --ï¿½Ì¹ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½
gc_title varchar2(200), --ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
gc_english varchar2(200), --ï¿½ï¿½ï¿½ï¿½ï¿½å¿µï¿½ï¿½ï¿½ï¿½
gc_area varchar2(200),--ï¿½ï¿½ï¿½ï¿½
gc_hole number(38), --È¦
gc_golf number(38), --ï¿½ï¿½
gc_length number(38),-- ï¿½ï¿½ï¿½ï¿½
gc_kind varchar2(200),--ï¿½Üµï¿½ï¿½ï¿½ï¿½ï¿½
gc_type varchar2(200),--ï¿½Ú½ï¿½Å¸ï¿½ï¿½
gc_configuration varchar2(200),--ï¿½Ú½ï¿½ï¿½ï¿½ï¿½ï¿½
gc_caddy varchar2(200),--Ä³ï¿½ï¿½ (ï¿½ï¿½/ï¿½ï¿½)
gc_cart varchar2(200),--Ä«Æ® (ï¿½ï¿½/ï¿½ï¿½)
gc_architects varchar2(200), --ï¿½ï¿½ï¿½ï¿½ï¿½Ú¸ï¿½
gc_content varchar2(2000), --ï¿½ï¿½ï¿½ï¿½ï¿½å³»ï¿½ï¿½
gc_address_postcode varchar2(200),--ï¿½ï¿½ï¿½ï¿½ï¿½È£
gc_address_roadAddress varchar2(200),--ï¿½ï¿½ï¿½Î¸ï¿½ï¿½Ö¼ï¿½
gc_address_jibunAddress varchar2(200), --ï¿½ï¿½ï¿½ï¿½ï¿½Ö¼ï¿½
gc_address_detailAddress varchar2(200), --ï¿½ï¿½ï¿½Ö¼ï¿½
gc_address_extraAddress varchar2(200),--ï¿½ï¿½ï¿½ï¿½ï¿½×¸ï¿½
gc_phone varchar2(50), --ï¿½ï¿½È­ï¿½ï¿½È£
gc_fax varchar2(50), --ï¿½Ñ½ï¿½
gc_move varchar2(1000),--ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½Ìµï¿½ï¿½ï¿½ï¿½ 
gc_date varchar2(200) --ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½å³¯Â¥
);
commit;

DROP TABLE golf_couse;
DROP TABLE  gc_reply;
DROP SEQUENCE golf_couse_seq



SELECT * FROM golf_couse;
commit;
<<<<<<< HEAD
select * from golf_couse where gc_title='ï¿½Ò³ï¿½ ï¿½ç¸®Ã¼ CC'
=======

>>>>>>> origin/jong

--ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½È£ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
create sequence golf_couse_seq
start with 1 --1ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
increment by 1 --1ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
nocache; --ï¿½Ó½ï¿½ ï¿½Þ¸ð¸®¸ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ê°Ú´Ù´ï¿½ ï¿½Ç¹ï¿½.



--ï¿½ï¿½Û¼ï¿½ï¿½ï¿½ Ä«ï¿½ï¿½ï¿½ï¿½ï¿½Ø¼ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½Ï´ï¿½ gc_replycnt ï¿½Ã·ï¿½ ï¿½ß°ï¿½
alter table golf_couse
add(gc_replycnt number(38)default 0);
--ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ß°ï¿½ï¿½Ï¸ï¿½ +1 ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½Ï¸ï¿½ -1


--gc_replyï¿½ï¿½ï¿½Ìºï¿½ï¿½ï¿½ ï¿½Ô½ï¿½ï¿½Ç¹ï¿½È£ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½Û¼ï¿½ï¿½ï¿½ Ä«ï¿½ï¿½ï¿½ï¿½ ï¿½Ï¿ï¿½  golf_couseï¿½ï¿½ï¿½Ìºï¿½ ï¿½ß°ï¿½ï¿½ï¿½ gc_replycntï¿½Ã·ï¿½ ï¿½ï¿½ï¿½Úµå°ªï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
update golf_couse set gc_replycnt=(select count(gc_no) from gc_reply where gc_no=golf_couse.gc_no)where gc_no>0;

--ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½Ìºï¿½ gc_reply ï¿½ï¿½ï¿½ï¿½
create table gc_reply(
<<<<<<< HEAD
    gc_rno number(38) primary key--ï¿½ï¿½ï¿½ ï¿½ï¿½È£
    ,gc_no number(38) default 0 --ï¿½Ü·ï¿½Å° ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ß°ï¿½ ï¿½ï¿½ï¿½ï¿½. golf_couse ï¿½ï¿½ï¿½Ìºï¿½ ï¿½ï¿½ ï¿½ï¿½È£ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½.ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½è°¡ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½.
    ,gc_replyer varchar2(100) not null --ï¿½ï¿½ï¿½ï¿½Û¼ï¿½ï¿½ï¿½
    ,gc_replytext varchar2(4000) not null --ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
    ,gc_regdate date -- ï¿½ï¿½ï¿½ ï¿½ï¿½Ï³ï¿½Â¥
    ,gc_updatedate date -- ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Â¥

);
-- gc_no_seq ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
=======
    gc_rno number(38) primary key--´ñ±Û ¹øÈ£
    ,gc_no number(38) default 0 --¿Ü·¡Å° Á¦¾à Á¶°ÇÀ¸·Î Ãß°¡ ¼³Á¤. golf_couse Å×ÀÌºí ÀÇ ¹øÈ£°ª¸¸ ÀúÀåµÊ.ÁÖÁ¾ °ü°è°¡ ¼º¸³µÊ.
    ,gc_replyer varchar2(100)  --´ñ±ÛÀÛ¼ºÀÚ
    ,gc_replytext varchar2(4000) --´ñ±Û ³»¿ë
    ,gc_regdate  date-- ´ñ±Û µî·Ï³¯Â¥
    ,gc_update date-- ´ñ±Û ¼öÁ¤³¯Â¥
);
select * from gc_reply
DROP TABLE  gc_reply;

-- gc_no_seq ½ÃÄö½º »ý¼º
>>>>>>> origin/jong
create sequence gc_no_seq
start with 1 --1ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
increment by 1 -- 1ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ 
nocache; --ï¿½Ó½ï¿½ ï¿½Þ¸ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ê°Ú´Ù´ï¿½ ï¿½Ç¹ï¿½

-- ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½È£ï¿½ï¿½ È®ï¿½ï¿½
select gc_no_seq.nextval from dual;

<<<<<<< HEAD
--ï¿½Ü·ï¿½Å° ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ß°ï¿½ ï¿½ï¿½ï¿½ï¿½
=======

Drop sequence gc_no_seq

--¿Ü·¡Å° Á¦¾àÁ¶°Ç Ãß°¡ ¼³Á¤
>>>>>>> origin/jong
alter table gc_reply add constraint gc_reply_gc_no_fk
foreign key(gc_no) references golf_couse(gc_no);


select * from gc_reply order by gc_rno desc;

--ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
create sequence gc_rno_seq
start with 1--1ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
increment by 1 --1ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
nocache;

select gc_rno_seq.nextval from dual;



Drop sequence gc_rno_seq