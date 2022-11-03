--골프장 테이블 생성
create table golf_couse(
gc_no number(38) primary key , -- 고유번호
gc_image varchar2(200), --이미지 경로
gc_title varchar2(200), --골프장명
gc_english varchar2(200), --골프장영문명
gc_area varchar2(200),--지역
gc_hole number(38), --홀
gc_golf number(38), --파
gc_length number(38),-- 길이
gc_kind varchar2(200),--잔디종류
gc_type varchar2(200),--코스타입
gc_configuration varchar2(200),--코스구성
gc_caddy varchar2(200),--캐디 (유/무)
gc_cart varchar2(200),--카트 (유/무)
gc_architects varchar2(200), --설계자명
gc_content varchar2(2000), --골프장내용
gc_address_postcode varchar2(200),--우편번호
gc_address_roadAddress varchar2(200),--도로명주소
gc_address_jibunAddress varchar2(200), --지번주소
gc_address_detailAddress varchar2(200), --상세주소
gc_address_extraAddress varchar2(200),--참고항목
gc_phone varchar2(50), --전화번호
gc_fax varchar2(50), --팩스
gc_move varchar2(1000),--골프장까지 자차이동경로 
gc_date varchar2(200) --골프장 개장날짜
);


DROP TABLE golf_couse;
DROP TABLE  gc_reply;
DROP SEQUENCE golf_couse_seq



SELECT * FROM golf_couse;
commit;
select * from golf_couse where gc_title='소노 펠리체 CC'

--골프장 고유번호 시퀀스 생성
create sequence golf_couse_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가
nocache; --임시 메모리를 사용하지 않겠다는 의미.



--댓글수를 카운터해서 저장하는 gc_replycnt 컬럼 추가
alter table golf_couse
add(gc_replycnt number(38)default 0);
--댓글을 추가하면 +1 댓글을 삭제하면 -1


--gc_reply테이블의 게시판번호를 기준으로 댓글수를 카운터 하여  golf_couse테이블에 추가된 gc_replycnt컬럼 레코드값을 수정
update golf_couse set gc_replycnt=(select count(gc_no) from gc_reply where gc_no=golf_couse.gc_no)where gc_no>0;

--댓글 테이블 gc_reply 생성
create table gc_reply(
    gc_rno number(38) primary key--댓글 번호
    ,gc_no number(38) default 0 --외래키 제약 조건으로 추가 설정. golf_couse 테이블 의 번호값만 저장됨.주종 관계가 성립됨.
    ,gc_replyer varchar2(100) not null --댓글작성자
    ,gc_replytext varchar2(4000) not null --댓글 내용
    ,gc_regdate date -- 댓글 등록날짜
    ,gc_updatedate date -- 댓글 수정날짜

);
-- gc_no_seq 시퀀스 생성
create sequence gc_no_seq
start with 1 --1부터 시작
increment by 1 -- 1씩 증가 
nocache; --임시 메모리 사용하지 않겠다는 의미

-- 시퀀스 다음 번호값 확인
select gc_no_seq.nextval from dual;

--외래키 제약조건 추가 설정
alter table gc_reply add constraint gc_reply_gc_no_fk
foreign key(gc_no) references golf_couse(gc_no);


select * from gc_reply order by gc_rno desc;

--댓글 시퀀스 생성
create sequence gc_rno_seq
start with 1--1부터 시작
increment by 1 --1씩 증가
nocache;

select gc_rno_seq.nextval from dual;