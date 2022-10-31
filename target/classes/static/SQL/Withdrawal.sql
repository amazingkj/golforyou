create table Withdrawal( --테이블 생성
  wno number(38) primary key --게시물 번호
 ,username varchar2(100) not null --글쓴이
 ,mdelcont varchar2(200) not null --코멘트
 ,mdeldate varchar2(50) not null --탈퇴한날
);

alter table Withdrawal add constraint Withdrawal_username_fk
foreign key(username) references MemberVO(username);


create sequence w_no_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가
nocache;


commit;