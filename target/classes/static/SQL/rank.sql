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
,r_sum number(38)
,r_maxrange number(38)
,r_province varchar2(50)
);

create sequence test_scboard_seq
start with 1
increment by 1
nocache;

