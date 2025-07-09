-- ����ں� Refresh Token�� �����ϱ� ���� ���̺�
CREATE TABLE member_refresh_tokens (
    refresh_num NUMBER PRIMARY KEY,               -- ���� �ĺ���
    member_email VARCHAR2(50),                    -- �ܷ�Ű (members.member_email)
    refresh_token CLOB,                           -- �������� ��ū
    user_agent VARCHAR2(255),                     -- ������ ����
    ip_address VARCHAR2(50),                      -- IP
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- �߱� �ð�
    CONSTRAINT fk_member_refresh_tokens FOREIGN KEY (member_email) REFERENCES members(memberemail));

CREATE TABLE members (
  member_email VARCHAR(50),
  member_pass VARCHAR(100),
  member_name VARCHAR(30),
  member_phone CHAR(13),
  auth_role varchar2(10) DEFAULT 'USER',
  PRIMARY KEY (member_email)
);

CREATE TABLE   board(
    num number CONSTRAINT board_num PRIMARY KEY,
    subject varchar2(50),
    reg_date date default sysdate,
    read_count number default 0, 
    ref number, 
    re_step number default 0 , 
    re_level number default 0, 
    content varchar2(200),
    ip varchar2(20),
    upload varchar2(300),
    member_email varchar2(50),
   CONSTRAINT board_memberEmail FOREIGN KEY(member_email) REFERENCES members(member_email)
);




SELECT * FROM members;


SELECT * FROM board;

COMMIT;



INSERT INTO board (num, subject, reg_date, read_count, ref, re_step, re_level, content, ip, upload, member_email ) VALUES ('1','�����������ܼ��� ���!','25/07/01','15','1','0','0', '����ϱ� ������ �������� žƼ��, ���� �����ִ� ���ܺ��� ���','127.168.0.133','(null)', 'admin@google.com');
INSERT INTO board (num, subject, reg_date, read_count, ref, re_step, re_level, content, ip, upload, member_email ) VALUES ('2','�������̵��ܼ��� ���!','25/07/01','0','2','0','0', '����ϱ� ���̸Ծ��','127.168.0.133','(null)', 'admin@google.com');
INSERT INTO board (num, subject, reg_date, read_count, ref, re_step, re_level, content, ip, upload, member_email ) VALUES ('3','������ �ܵ��̺�Ʈ!','25/07/01','7','3','0','0', '������ 10�� ����˹��� ��ȸ����','127.168.0.133','(null)', 'admin@google.com');



SELECT b FROM BoardEntity b WHERE b.num = :num;

select * from board where board.num='2';

DELETE from board where board.num='3';
