--골프장 테이블 생성
create table golf_couse(
gc_no number(38), --클래스 고유번호
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
gc_content varchar2(1000), --골프장내용
gc_coordinates varchar2(200),--지도 좌표값
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

SELECT * FROM golf_couse;
DROP TABLE golf_couse;

commit;

--골프장 고유번호 시퀀스 생성
create sequence golf_couse_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가
nocache; --임시 메모리를 사용하지 않겠다는 의미.
