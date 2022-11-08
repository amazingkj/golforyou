--������ ���̺� ����
create table golf_couse(
gc_no number(38) primary key , -- ������ȣ
gc_image varchar2(200), --�̹��� ���
gc_title varchar2(200), --�������
gc_english varchar2(200), --�����念����
gc_area varchar2(200),--����
gc_hole number(38), --Ȧ
gc_golf number(38), --��
gc_length number(38),-- ����
gc_kind varchar2(200),--�ܵ�����
gc_type varchar2(200),--�ڽ�Ÿ��
gc_configuration varchar2(200),--�ڽ�����
gc_caddy varchar2(200),--ĳ�� (��/��)
gc_cart varchar2(200),--īƮ (��/��)
gc_architects varchar2(200), --�����ڸ�
gc_content varchar2(2000), --�����峻��
gc_address_postcode varchar2(200),--�����ȣ
gc_address_roadAddress varchar2(200),--���θ��ּ�
gc_address_jibunAddress varchar2(200), --�����ּ�
gc_address_detailAddress varchar2(200), --���ּ�
gc_address_extraAddress varchar2(200),--�����׸�
gc_phone varchar2(50), --��ȭ��ȣ
gc_fax varchar2(50), --�ѽ�
gc_move varchar2(1000),--��������� �����̵���� 
gc_date varchar2(200) --������ ���峯¥
);
commit;

--������ ������ȣ ������ ����
create sequence golf_couse_seq
start with 1 --1���� ����
increment by 1 --1�� ����
nocache; --�ӽ� �޸𸮸� ������� �ʰڴٴ� �ǹ�.

--��� ���̺� gc_reply ����
create table gc_reply(
    gc_rno number(38) primary key--��� ��ȣ
    ,gc_no number(38) default 0 --�ܷ�Ű ���� �������� �߰� ����. golf_couse ���̺� �� ��ȣ���� �����.���� ���谡 ������.
    ,gc_replyer varchar2(100) not null --����ۼ���
    ,gc_replytext varchar2(4000) not null --��� ����
    ,gc_regdate date -- ��� ��ϳ�¥
    ,gc_updatedate date -- ��� ������¥
    ,gc_update date-- ��� ������¥
);

create sequence gc_no_seq
start with 1 --1���� ����
increment by 1 -- 1�� ���� 
nocache; --�ӽ� �޸� ������� �ʰڴٴ� �ǹ�

alter table gc_reply add constraint gc_reply_gc_no_fk
foreign key(gc_no) references golf_couse(gc_no);

--��� ������ ����
create sequence gc_rno_seq
start with 1--1���� ����
increment by 1 --1�� ����
nocache;
