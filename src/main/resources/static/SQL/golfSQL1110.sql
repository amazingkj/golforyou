--===========================
--김지인(회원,자유게시판)
--회원 MemberVO는 첫 실행시 application.properties ddl문 update를 create로 변경해서 실행, 이후 update로 수정.
--첫 실행 이후 테이블 추가해야 외래키 지정이 원활함.

--자유게시판 
create table golforboard( --테이블 생성
  b_no number(38) primary key --게시물 번호
 ,username varchar2(100) not null --글쓴이
 ,nickname  varchar2(100) not null --닉네임
 ,b_title varchar2(200) not null --글제목
 ,b_cont varchar2(4000) not null --글내용
 ,b_file varchar2(200) --첨부파일명
 ,b_hit number(38) default 0 --조회수
 ,b_ref number(38) --원본글과 관리자 답변글을 묶어주는 글 그룹번호값
 ,b_step number(38) --원본글이면 0,첫번째 답변글이면 1,두번째 답변글이면 2,원본글과 답변글을 구분하는 번호값이면서 몇번째 답변글인가를 알려준다.
 ,b_level number(38) --답변글 정렬순서
 ,b_date date --글 등록날짜
 ,b_like number(38) default 0
);

alter table golforboard add constraint golforboard_username_fk
foreign key(username) references MemberVO(username);

alter table golforboard add foreign key(nickname) references memberVO(nickname);



create sequence b_no_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가
nocache;

create table golforboard_reply(
r_no number(10,0), -- 댓글 번호
b_no number(10,0) not null, -- 게시물 번호
reply varchar2(1000) not null, -- 댓글 내용
replyer varchar2(50) not null, -- 댓글 작성자
replyDate date default sysdate, -- 작성일
updateDate date default sysdate -- 수정일
);

-- 댓글
create sequence seq_reply;
-- r_no 시퀸스 처리 예정.
alter table golforboard_reply add constraint pk_reply primary key(r_no);
--테이블 생성후에 제약조건을 추가, pk는 r_no.
alter table golforboard_reply add constraint fk_reply_board
foreign key (b_no) references golforboard(b_no);
-- 외래키로 golforboard(b_no) 사용.


--좋아요 
create table likes (
    likes_idx number(10,0) primary key,
    likes_no number(10,0),
    board_no number(10,0),
    nickname varchar2(50),
    foreign key (board_no) references golforboard (b_no),
    foreign key (nickname) references memberVO (nickname)

);


create sequence likes_no_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가
nocache;


CREATE TABLE WITHDRAWAL(
wNO NUMBER(38,0) PRIMARY KEY 
,USERNAME VARCHAR2(100) NOT NULL
,MDELCONT VARCHAR2(200) NOT NULL  
,MDELDATE VARCHAR2(50) NOT NULL 
 
);

alter table withdrawal add constraint fk_withdrawal
foreign key (username) references memberVO(username);






--===========================
--김민우(랭킹)

create table scboard(
sc_no number(38) primary key
,sc_id varchar2(50)
,sc_name varchar2(50)
,sc_title varchar2(50)
,sc_playdate varchar2(50)
,sc_cont varchar2(4000)
,sc_file varchar2(100)
,sc_hit number(38) default 0
,sc_ref number(38)
,sc_step number(38)
,sc_level number(38)
,sc_notice number(38)
,sc_date date
);

create table score_card(
s_no number(38) primary key
,s_id varchar2(50)
,s_nickname varchar2(255)
,s_location varchar2(50)
,s_putting number(38)
,s_range number(38)
,s_date varchar2(50)
,s_sort number(38)
,s_sumscore number(38)
,s_updated number(38) default 0
,s_strike number(38)
,s_obandhazard number(38)
);

create table ranking(
r_no number(38)
,r_sum number(38)
,r_maxrange number(38)
);

create sequence test_scboard_seq
start with 1
increment by 1
nocache;

alter table Ranking add constraint fk_Ranking
foreign key (r_no) references memberVO(mno);

alter table score_card add constraint fk_score_card
foreign key (s_no) references scboard(sc_no);



--=================================
--관리자공지사항게시판(양희수)
--abboard 테이블 생성
create table abboard(
 abboard_no number(38) primary key --게시물 번호
 ,abboard_name varchar2(100) not null --작성자
 ,abboard_title varchar2(200) not null --제목
 ,abboard_cont varchar2(4000) not null --내용
 ,abboard_hit number(38) default 0--조회수
 ,abboard_ref number(38) --원본글과 답변글을 묶어주는 그룹번호역할
 ,abboard_step number(38) --원본글이면 0,첫번째 답변글 1. 원본글과
 --답변글을 구분하는 번호값,몇번째 답변글인가를 구분하는 번호값
 ,abboard_level number(38) --답변글 정렬 순서
 ,abboard_date date --등록날짜
);

--abboard_no_seq 시퀀스 생성
create sequence abboard_no_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가옵션
nocache;

--=================================
--김종혁(골프장 검색)

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

--=====================================
--조소정(클래스)

----- 지역 테이블
create table address(
adno number(38),
adname varchar2(100),
adname2 varchar2(100)
);

-- 지역 고유번호 시퀀스
create sequence add_seq
start with 1
increment by 1
nocache;

-- 지역 insert
insert into address values(add_seq.nextval, '수도권', '경기도 전체');
insert into address values(add_seq.nextval, '수도권', '서울');
insert into address values(add_seq.nextval, '수도권', '인천');

insert into address values(add_seq.nextval, '강원도', '강원도 전체');
insert into address values(add_seq.nextval, '강원도', '춘천');
insert into address values(add_seq.nextval, '강원도', '속초');


insert into address values(add_seq.nextval, '충청도', '충청도 전체');
insert into address values(add_seq.nextval, '충청도', '대전');
insert into address values(add_seq.nextval, '충청도', '세종');

insert into address values(add_seq.nextval, '전라도', '전라도 전체');
insert into address values(add_seq.nextval, '전라도', '광주');
insert into address values(add_seq.nextval, '전라도', '전주');

insert into address values(add_seq.nextval, '경상도', '경상도 전체');
insert into address values(add_seq.nextval, '경상도', '부산');
insert into address values(add_seq.nextval, '경상도', '대구');
insert into address values(add_seq.nextval, '경상도', '울산');

insert into address values(add_seq.nextval, '제주도', '제주도 전체');
insert into address values(add_seq.nextval, '제주도', '제주시');
insert into address values(add_seq.nextval, '제주도', '서귀포시');


-- 강사 테이블
create table cteacher(
tno number(38) primary key, --강사 고유번호
tname varchar2(50), --강사명
tgender varchar2(60), --강사 성별
tcareer varchar2(2000), --강사 소개 또는 경력사항
tdate date --강사 등록 날짜
);

--강사 시퀀스
create sequence ct_seq
start with 100
increment by 1
nocache;

--필드 클래스 테이블 생성
create table field_class(
fno number(38) primary key, --클래스 고유번호
tno number(38), --강사 고유번호: 외래키 지정
ftitle varchar2(200), --클래스명
fphone varchar2(50), --클래스 전화번호
faddr varchar2(200), --클래스 지역 대분류
faddr2 varchar2(200), --클래스 지역 소분류
fimage varchar2(200), --이미지 경로
fdate date, --클래스 개설날짜
fsprice number(38), --필드 클래스 STANDARD 가격
fsrounding number(38), -- STANDARD 라운딩 횟수
fsdesc varchar2(1000), -- STANDARD 상세 설명
fstime number(38), -- STANDARD 1회당 레슨 시간(분)
fdprice number(38), --필드 클래스 DELUXE 가격
fdrounding number(38), -- DELUXE 라운딩 횟수
fddesc varchar2(1000), -- DELUXE 상세 설명
fdtime number(38), -- DELUXE 1회당 레슨 시간(분)
fpprice number(38), --필드 클래스 PREMIUM 가격
fprounding number(38), -- PREMIUM 라운딩 횟수
fpdesc varchar2(1000), -- PREMIUM 상세 설명
fptime number(38) -- PREMIUM 1회당 레슨 시간(분)
);

-- 필드 클래스 시퀀스
create sequence fd_seq
start with 10000
increment by 1
nocache;

-- 필드 클래스 테이블 강사 고유번호 외래키 지정
ALTER TABLE field_class 
ADD CONSTRAINTS fk_tno FOREIGN KEY (tno) 
REFERENCES cteacher(tno) ON DELETE CASCADE;


--온라인 클래스 테이블
create table online_class(
ono number(38) primary key, --클래스 고유번호
tno number(38), --강사 고유번호: 외래키 지정
otitle varchar2(200), --클래스명
ophone varchar2(50), --클래스 전화번호
oimage varchar2(200), --이미지 경로
odate date, --클래스 개설날짜
oprice number(38), --온라인 클래스 가격
odesc varchar2(1000), --온라인 클래스 상세 설명
otime number(38), --온라인 클래스 수강기간
olevel varchar2(50) --온라인 클래스 추천 레벨
);

-- 온라인 클래스 시퀀스
create sequence ol_seq
start with 20000
increment by 1
nocache;


-- 온라인 클래스 테이블 강사 고유번호 외래키 지정
ALTER TABLE online_class 
ADD CONSTRAINTS fk_tno2 FOREIGN KEY (tno) 
REFERENCES cteacher(tno) ON DELETE CASCADE;


----결제완료 온라인 클래스 테이블 생성
create table class_pay(
pno number(38), ----주문번호
nickname varchar2(100), ----유저닉네임
ono number(38), ----온라인 클래스 고유번호
pdate date ----결제 완료 날짜
);


===============================

추가한 외래키 속성들 

alter table Ranking add constraint fk_Ranking
foreign key (r_no) references memberVO(mno);

alter table withdrawal add constraint fk_withdrawal
foreign key (username) references memberVO(username);


alter table score_card add constraint fk_score_card
foreign key (s_no) references scboard(sc_no);

alter table class_pay add constraint fk_class_pay
foreign key (nickname) references memberVO(nickname);

alter table golforboard add constraint fk_golforboard
foreign key (username) references memberVO(username);
