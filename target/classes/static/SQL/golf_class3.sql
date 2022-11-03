-- 지역 테이블
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

select * from address;

select distinct adname from address;
select adname2 from address;


-- 강사 테이블
create table cteacher(
tno number(38) primary key, --강사 고유번호
tname varchar2(50), --강사명
tgender varchar2(60), --강사 성별
tcareer varchar2(2000) --강사 소개 또는 경력사항
);

--강사 시퀀스
create sequence ct_seq
start with 100
increment by 1
nocache;

----강사 insert
insert into cteacher values (ct_seq.nextval, '조소정', '여성', 'KPGA 프로');
insert into cteacher values (ct_seq.nextval, '홍길동', '남성', '최선을 다하겠습니다.');
insert into cteacher values (ct_seq.nextval, '이순신', '남성', '골프 장수입니다.');

drop sequence ct_seq;

select * from cteacher;


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

-- 강사 고유번호 외래키 지정
ALTER TABLE field_class 
ADD CONSTRAINTS fk_tno FOREIGN KEY (tno) 
REFERENCES cteacher(tno) ON DELETE CASCADE;

-- 필드 클래스 insert
insert into field_class values(
fd_seq.nextval,
100,
'답답한 연습장이 아닌 필드에서 가르쳐드립니다.',
'010-7458-8965',
'수도권', 
'서울',
'/images/class/field01.jpg',
sysdate,
670000, --필드 클래스 STANDARD 가격
1, -- STANDARD 라운딩 횟수
'STANDARD 상세설명', -- STANDARD 상세 설명
360, -- STANDARD 1회당 레슨 시간(분)
1300000, --필드 클래스 DELUXE 가격
5, -- DELUXE 라운딩 횟수
'DELUXE 상세 설명', -- DELUXE 상세 설명
360, -- DELUXE 1회당 레슨 시간(분)
3500000, --필드 클래스 PREMIUM 가격
10, -- PREMIUM 라운딩 횟수
'PREMIUM 상세 설명', -- PREMIUM 상세 설명
360 -- PREMIUM 1회당 레슨 시간(분)
);

select * from field_class;


---강사 테이블 + 필드 클래스 테이블 join---
select * from cteacher, field_class where cteacher.tno(+)=field_class.tno;

select tno,tname,tgender,tcareer,
ono,otitle,ophone,oimage,odate,oprice,odesc,otime,olevel
from cteacher inner join online_class
on cteacher.tno=online_class.tno;


select tname,tgender,tcareer from cteacher where tno=100;


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

drop sequence ol_seq;

-- 강사 고유번호 외래키 지정
ALTER TABLE online_class 
ADD CONSTRAINTS fk_tno2 FOREIGN KEY (tno) 
REFERENCES cteacher(tno) ON DELETE CASCADE;


----온라인 클래스 insert
insert into online_class values(
ol_seq.nextval,
101,
'비대면 원포인트 골프 레슨',
'010-4545-9898',
'/images/class/online01_01.jpg',
sysdate,
50000,
'온라인 상세 설명',
90,
'브론즈'
);


---강사 테이블 + 온라인 클래스 테이블 join---
select * from cteacher, online_class where cteacher.tno(+)=online_class.tno order by ono desc;

select * from cteacher, online_class where cteacher.tno(+)=online_class.tno and ono=20000;

select * from (
		select rowNum
		rNum,
        cteacher.tno,
        cteacher.tname,
        cteacher.tcareer,
        online_class.ono,
        online_class.otitle,
        online_class.ophone,
        online_class.oimage,
        online_class.odate,
		online_class.oprice,
        online_class.odesc,
        online_class.otime,
        online_class.olevel
		from (select * from cteacher, online_class where cteacher.tno(+)=online_class.tno))
        
select cteacher.tno,
       cteacher.tname,
       cteacher.tcareer,
       online_class.ono,
       online_class.otitle,
       online_class.ophone,
       online_class.oimage,
       online_class.odate,
       online_class.oprice,
       online_class.odesc,
       online_class.otime,
       online_class.olevel
from cteacher, online_class where cteacher.tno(+)=online_class.tno;

----강사, 필드, 온라인 클래스 테이블 join----
select * from cteacher ct, field_class fc, online_class oc
where ct.tno=fc.tno or ct.tno=oc.tno;




select * from cteacher;

select * from field_class;

select * from online_class;





commit;

