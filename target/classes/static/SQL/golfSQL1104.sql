--===========================
--김지인(회원,자유게시판)
--회원 MemberVO는 첫 실행시 application.properties ddl문 update를 create로 변경해서 실행, 이후 update로 수정.
--첫 실행 이후 테이블 추가해야 외래키 지정이 원활함.

--자유게시판 
create table golforboard( --테이블 생성
  b_no number(38) primary key --게시물 번호
 ,username varchar2(100) not null --글쓴이
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
 


--===========================
--김민우(랭킹)

create table scboard(
sc_no number(38)
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
s_id varchar2(50)
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
,r_id varchar2(50)
,r_nickname varchar2(255)
,r_sum number(38)
,r_maxrange number(38)
,r_province varchar2(50)
);

create sequence rno_seq
start with 1
increment by 1
nocache;

create sequence test_scboard_seq
start with 1
increment by 1
nocache;


--=================================
--관리자공지사항게시판(양희수)
--abboard 테이블 생성
create table abboard(
 abboard_no number(38) primary key --게시물 번호
 ,abboard_name varchar2(100) not null --작성자
 ,abboard_title varchar2(200) not null --제목
 ,abboard_pwd varchar2(20) not null --비번
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
gc_replycnt number(38)default 0 --댓글수 카운터
);


--골프장 고유번호 시퀀스 생성
create sequence golf_couse_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가
nocache; --임시 메모리를 사용하지 않겠다는 의미.


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



--외래키 제약조건 추가 설정
alter table gc_reply add constraint gc_reply_gc_no_fk
foreign key(gc_no) references golf_couse(gc_no);



--댓글 시퀀스 생성
create sequence gc_rno_seq
start with 1--1부터 시작
increment by 1 --1씩 증가
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


--골프 필드 클래스 테이블 생성
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

