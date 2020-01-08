prompt PL/SQL Developer import file
prompt Created on 2017��4��16�� by ��ʦ��
set feedback off
set define off
prompt Creating D_ADMIN...
create table D_ADMIN
(
  admin_id        NUMBER(19) not null,
  password        VARCHAR2(20 CHAR) not null,
  last_login_time TIMESTAMP(6),
  admin_status    NUMBER(10) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table D_ADMIN
  add primary key (ADMIN_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating D_ANNOTATION...
create table D_ANNOTATION
(
  annotation_id     NUMBER(19) not null,
  annotation_title  VARCHAR2(100 CHAR) not null,
  annotation_detail VARCHAR2(500 CHAR),
  annotation_date   TIMESTAMP(6) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table D_ANNOTATION
  add primary key (ANNOTATION_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating D_MENU...
create table D_MENU
(
  menu_id     NUMBER(19) not null,
  menu_name   VARCHAR2(30 CHAR) not null,
  menu_url    VARCHAR2(500 CHAR),
  menu_icon   VARCHAR2(100 CHAR),
  parent_id   NUMBER(19),
  menu_status NUMBER(10)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table D_MENU
  add primary key (MENU_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table D_MENU
  add constraint FKB0126C5A63C1848D foreign key (PARENT_ID)
  references D_MENU (MENU_ID);

prompt Creating D_BUTTON...
create table D_BUTTON
(
  button_id     NUMBER(19) not null,
  button_name   VARCHAR2(30 CHAR) not null,
  button_url    VARCHAR2(500 CHAR) not null,
  button_status NUMBER(10) not null,
  menu_id       NUMBER(19)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table D_BUTTON
  add primary key (BUTTON_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table D_BUTTON
  add constraint FKE347AB6D21003FB8 foreign key (MENU_ID)
  references D_MENU (MENU_ID);

prompt Creating D_USER...
create table D_USER
(
  user_id         NUMBER(19) not null,
  user_login_name VARCHAR2(30 CHAR) not null,
  password        VARCHAR2(20 CHAR) not null,
  last_login_time TIMESTAMP(6),
  user_status     NUMBER(10) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table D_USER
  add primary key (USER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating D_DOCUMENT...
create table D_DOCUMENT
(
  document_id     NUMBER(19) not null,
  document_type   VARCHAR2(30 CHAR) not null,
  document_name   VARCHAR2(30 CHAR) not null,
  document_desc   VARCHAR2(500 CHAR),
  document_rsc    VARCHAR2(500 CHAR) not null,
  download_time   NUMBER(10) not null,
  download_status NUMBER(10) not null,
  document_status NUMBER(10) not null,
  upload_time     TIMESTAMP(6) not null,
  update_time     TIMESTAMP(6) not null,
  upload_user_id  NUMBER(19)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table D_DOCUMENT
  add primary key (DOCUMENT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table D_DOCUMENT
  add constraint FKA57232964883BBFA foreign key (UPLOAD_USER_ID)
  references D_USER (USER_ID);

prompt Creating D_INFORM...
create table D_INFORM
(
  inform_id     NUMBER(19) not null,
  inform_type   VARCHAR2(8 CHAR) not null,
  target_id     NUMBER(19) not null,
  inform_reason VARCHAR2(500 CHAR),
  inform_date   TIMESTAMP(6) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table D_INFORM
  add primary key (INFORM_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating D_PRIVILEGE...
create table D_PRIVILEGE
(
  privilege_id  NUMBER(19) not null,
  role_type     VARCHAR2(5 CHAR) not null,
  role_id       NUMBER(19) not null,
  resource_type VARCHAR2(6 CHAR) not null,
  resource_id   NUMBER(19) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table D_PRIVILEGE
  add primary key (PRIVILEGE_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating D_USER_DETAIL...
create table D_USER_DETAIL
(
  user_id   NUMBER(19) not null,
  sex       NUMBER(10) not null,
  telephone VARCHAR2(13 CHAR),
  mail      VARCHAR2(30 CHAR),
  sign      VARCHAR2(50 CHAR),
  pic_path  VARCHAR2(500 CHAR)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table D_USER_DETAIL
  add primary key (USER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table D_USER_DETAIL
  add constraint FKE2BE47EADF999838 foreign key (USER_ID)
  references D_USER (USER_ID);

prompt Loading D_ADMIN...
insert into D_ADMIN (admin_id, password, last_login_time, admin_status)
values (1, '123456', to_timestamp('16-04-2017 22:29:52.564000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into D_ADMIN (admin_id, password, last_login_time, admin_status)
values (21, '123456', to_timestamp('11-04-2017 13:03:55.079000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into D_ADMIN (admin_id, password, last_login_time, admin_status)
values (41, '123456', null, 1);
commit;
prompt 3 records loaded
prompt Loading D_ANNOTATION...
insert into D_ANNOTATION (annotation_id, annotation_title, annotation_detail, annotation_date)
values (1, '���Թ���', null, to_timestamp('21-03-2017 23:07:20.726000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into D_ANNOTATION (annotation_id, annotation_title, annotation_detail, annotation_date)
values (21, '����', 'textAnnotation', to_timestamp('09-04-2017 17:32:22.239000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into D_ANNOTATION (annotation_id, annotation_title, annotation_detail, annotation_date)
values (41, 'testtest', null, to_timestamp('16-04-2017 22:36:24.063000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 3 records loaded
prompt Loading D_MENU...
insert into D_MENU (menu_id, menu_name, menu_url, menu_icon, parent_id, menu_status)
values (3, '��ѯ���', 'queryDocument-User.jsp', null, 1, 1);
insert into D_MENU (menu_id, menu_name, menu_url, menu_icon, parent_id, menu_status)
values (1, 'ȫ��', 'index.jsp', null, null, 1);
insert into D_MENU (menu_id, menu_name, menu_url, menu_icon, parent_id, menu_status)
values (2, '�ĵ�����', 'myDocument.jsp', null, 1, 1);
insert into D_MENU (menu_id, menu_name, menu_url, menu_icon, parent_id, menu_status)
values (4, '�����ѯ', 'queryAnnotation.jsp', null, 3, 1);
insert into D_MENU (menu_id, menu_name, menu_url, menu_icon, parent_id, menu_status)
values (5, '��������', 'userInfo.jsp', null, 1, 1);
insert into D_MENU (menu_id, menu_name, menu_url, menu_icon, parent_id, menu_status)
values (6, '�û���Ϣ�޸�', 'editUserInfo.jsp', null, 5, 1);
insert into D_MENU (menu_id, menu_name, menu_url, menu_icon, parent_id, menu_status)
values (7, 'ϵͳ����', 'updatePassword-Admin.jsp', null, 1, 1);
insert into D_MENU (menu_id, menu_name, menu_url, menu_icon, parent_id, menu_status)
values (8, '����Ա����', 'adminManage.jsp', null, 7, 1);
insert into D_MENU (menu_id, menu_name, menu_url, menu_icon, parent_id, menu_status)
values (9, '����Ա��Ȩ', 'adminPrivilege.jsp', null, 7, 1);
insert into D_MENU (menu_id, menu_name, menu_url, menu_icon, parent_id, menu_status)
values (10, '�û�����', 'userManage.jsp', null, 7, 1);
insert into D_MENU (menu_id, menu_name, menu_url, menu_icon, parent_id, menu_status)
values (11, '�û���Ȩ', 'userPrivilege.jsp', null, 7, 1);
insert into D_MENU (menu_id, menu_name, menu_url, menu_icon, parent_id, menu_status)
values (12, '�ĵ�����', 'documentManage.jsp', null, 7, 1);
insert into D_MENU (menu_id, menu_name, menu_url, menu_icon, parent_id, menu_status)
values (13, '�û�����', 'informMessage.jsp', null, 7, 1);
insert into D_MENU (menu_id, menu_name, menu_url, menu_icon, parent_id, menu_status)
values (14, '���淢��', 'publishAnnotation.jsp', null, 7, 1);
commit;
prompt 14 records loaded
prompt Loading D_BUTTON...
insert into D_BUTTON (button_id, button_name, button_url, button_status, menu_id)
values (4, 'ɾ���ĵ�', 'removeDocument.jsp', 1, 2);
insert into D_BUTTON (button_id, button_name, button_url, button_status, menu_id)
values (5, '�����ĵ�', 'lockDocument.jsp', 1, 2);
insert into D_BUTTON (button_id, button_name, button_url, button_status, menu_id)
values (6, '�����ĵ�', 'unlockDocument.jsp', 1, 2);
insert into D_BUTTON (button_id, button_name, button_url, button_status, menu_id)
values (7, '�����ĵ�', 'searchDocument.jsp', 1, 3);
insert into D_BUTTON (button_id, button_name, button_url, button_status, menu_id)
values (8, '�����ĵ�', 'downloadDocument.jsp', 1, 3);
insert into D_BUTTON (button_id, button_name, button_url, button_status, menu_id)
values (9, '��ӹ���Ա', 'addAdmin.jsp', 1, 8);
insert into D_BUTTON (button_id, button_name, button_url, button_status, menu_id)
values (10, '���ù���Ա', 'suspendAdmin.jsp', 1, 8);
insert into D_BUTTON (button_id, button_name, button_url, button_status, menu_id)
values (11, '�������Ա', 'activateAdmin.jsp', 1, 8);
insert into D_BUTTON (button_id, button_name, button_url, button_status, menu_id)
values (12, '�����û�', 'suspendUser.jsp', 1, 10);
insert into D_BUTTON (button_id, button_name, button_url, button_status, menu_id)
values (13, '�����û�', 'activateUser.jsp', 1, 10);
insert into D_BUTTON (button_id, button_name, button_url, button_status, menu_id)
values (14, '�����ĵ�', 'lockDocument.jsp', 1, 12);
insert into D_BUTTON (button_id, button_name, button_url, button_status, menu_id)
values (15, '�����ĵ�', 'unlockDocument.jsp', 1, 12);
insert into D_BUTTON (button_id, button_name, button_url, button_status, menu_id)
values (16, '�ٱ��ĵ�', 'informDocument.jsp', 1, 3);
insert into D_BUTTON (button_id, button_name, button_url, button_status, menu_id)
values (17, '�ٱ��û�', 'informUser.jsp', 1, 3);
insert into D_BUTTON (button_id, button_name, button_url, button_status, menu_id)
values (1, '�½��ĵ�', 'addDocument.jsp', 1, 2);
insert into D_BUTTON (button_id, button_name, button_url, button_status, menu_id)
values (2, '�޸��ĵ�', 'modifyDocument.jsp', 1, 2);
insert into D_BUTTON (button_id, button_name, button_url, button_status, menu_id)
values (3, '�����ĵ�', 'downloadDocument.jsp', 1, 2);
commit;
prompt 17 records loaded
prompt Loading D_USER...
insert into D_USER (user_id, user_login_name, password, last_login_time, user_status)
values (41, 'ass', '123456', to_timestamp('16-04-2017 21:28:03.605000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into D_USER (user_id, user_login_name, password, last_login_time, user_status)
values (62, 'testuser', '123456', null, 1);
insert into D_USER (user_id, user_login_name, password, last_login_time, user_status)
values (81, 'testUser', '123456', to_timestamp('11-04-2017 13:00:48.829000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into D_USER (user_id, user_login_name, password, last_login_time, user_status)
values (1, 'user1', '123456', to_timestamp('11-04-2017 02:08:17.448000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into D_USER (user_id, user_login_name, password, last_login_time, user_status)
values (21, 'user2', '123456', to_timestamp('10-04-2017 18:07:18.976000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into D_USER (user_id, user_login_name, password, last_login_time, user_status)
values (102, 'aaa', '123', null, 1);
commit;
prompt 6 records loaded
prompt Loading D_DOCUMENT...
insert into D_DOCUMENT (document_id, document_type, document_name, document_desc, document_rsc, download_time, download_status, document_status, upload_time, update_time, upload_user_id)
values (2, 'code', 'bms_data', 'text', 'bms_data.sql', 0, 1, 0, to_timestamp('26-03-2017 16:11:45.655000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('27-03-2017 16:31:25.463000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into D_DOCUMENT (document_id, document_type, document_name, document_desc, document_rsc, download_time, download_status, document_status, upload_time, update_time, upload_user_id)
values (21, 'code', 'bms_database', 'text', 'bms_database.sql', 0, 1, 0, to_timestamp('27-03-2017 16:33:18.305000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('27-03-2017 16:33:30.775000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into D_DOCUMENT (document_id, document_type, document_name, document_desc, document_rsc, download_time, download_status, document_status, upload_time, update_time, upload_user_id)
values (22, 'code', 'bms_data', '123', 'bms_data.sql', 0, 1, 0, to_timestamp('27-03-2017 16:35:40.928000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('27-03-2017 16:35:51.634000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into D_DOCUMENT (document_id, document_type, document_name, document_desc, document_rsc, download_time, download_status, document_status, upload_time, update_time, upload_user_id)
values (23, 'text', 'bms', null, 'bms����.sql', 0, 1, 0, to_timestamp('27-03-2017 16:37:54.828000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('27-03-2017 16:39:03.335000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into D_DOCUMENT (document_id, document_type, document_name, document_desc, document_rsc, download_time, download_status, document_status, upload_time, update_time, upload_user_id)
values (24, 'text', '233', null, 'bms_data.sql', 0, 1, 0, to_timestamp('27-03-2017 16:39:28.098000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('27-03-2017 16:39:33.380000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into D_DOCUMENT (document_id, document_type, document_name, document_desc, document_rsc, download_time, download_status, document_status, upload_time, update_time, upload_user_id)
values (25, 'text', 'data', '123', 'bms_data.sql', 0, 1, 1, to_timestamp('27-03-2017 17:10:41.251000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('27-03-2017 17:10:41.251000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into D_DOCUMENT (document_id, document_type, document_name, document_desc, document_rsc, download_time, download_status, document_status, upload_time, update_time, upload_user_id)
values (41, 'text', '��ҵ����', '123456', '���繤��+20131003558+������.doc', 0, 0, 1, to_timestamp('11-04-2017 12:59:01.881000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('11-04-2017 12:59:01.881000', 'dd-mm-yyyy hh24:mi:ss.ff'), 81);
insert into D_DOCUMENT (document_id, document_type, document_name, document_desc, document_rsc, download_time, download_status, document_status, upload_time, update_time, upload_user_id)
values (61, 'text', 'bbs', 'adfaadsfadf', 'atmsystem.sql', 0, 1, 0, to_timestamp('15-04-2017 21:31:59.206000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('16-04-2017 18:48:57.865000', 'dd-mm-yyyy hh24:mi:ss.ff'), 41);
insert into D_DOCUMENT (document_id, document_type, document_name, document_desc, document_rsc, download_time, download_status, document_status, upload_time, update_time, upload_user_id)
values (81, 'text', 'ass', 'sdfasdf', 'my.ini', 0, 1, 1, to_timestamp('16-04-2017 18:32:14.700000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('16-04-2017 18:32:14.700000', 'dd-mm-yyyy hh24:mi:ss.ff'), 41);
commit;
prompt 9 records loaded
prompt Loading D_INFORM...
insert into D_INFORM (inform_id, inform_type, target_id, inform_reason, inform_date)
values (1, 'document', 25, '123', to_timestamp('06-04-2017 01:08:07.600000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into D_INFORM (inform_id, inform_type, target_id, inform_reason, inform_date)
values (21, 'user', 1, 'adf', to_timestamp('06-04-2017 12:27:55.186000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into D_INFORM (inform_id, inform_type, target_id, inform_reason, inform_date)
values (41, 'user', 0, 'fasdfaf', to_timestamp('16-04-2017 18:42:15.359000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 3 records loaded
prompt Loading D_PRIVILEGE...
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (184, 'admin', 1, 'button', 10);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (185, 'admin', 1, 'button', 11);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (186, 'admin', 1, 'menu', 9);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (187, 'admin', 1, 'menu', 10);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (188, 'admin', 1, 'button', 12);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (189, 'admin', 1, 'button', 13);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (190, 'admin', 1, 'menu', 11);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (191, 'admin', 1, 'menu', 12);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (192, 'admin', 1, 'button', 14);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (193, 'admin', 1, 'button', 15);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (194, 'admin', 1, 'menu', 13);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (195, 'admin', 1, 'menu', 14);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (196, 'user', 102, 'menu', 1);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (197, 'user', 102, 'menu', 2);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (110, 'admin', 21, 'button', 10);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (111, 'admin', 21, 'button', 11);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (112, 'admin', 21, 'menu', 10);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (113, 'admin', 21, 'button', 12);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (114, 'admin', 21, 'button', 13);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (115, 'admin', 21, 'menu', 12);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (120, 'user', 1, 'button', 4);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (121, 'user', 1, 'button', 5);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (122, 'user', 1, 'button', 6);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (123, 'user', 1, 'button', 1);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (124, 'user', 1, 'button', 2);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (125, 'user', 1, 'button', 3);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (126, 'user', 21, 'menu', 2);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (127, 'user', 21, 'button', 4);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (128, 'user', 21, 'button', 5);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (129, 'user', 21, 'button', 6);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (130, 'user', 21, 'button', 1);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (131, 'user', 21, 'button', 2);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (132, 'user', 21, 'button', 3);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (133, 'user', 62, 'menu', 1);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (134, 'user', 62, 'menu', 2);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (135, 'user', 62, 'menu', 3);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (136, 'user', 62, 'menu', 4);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (137, 'user', 62, 'menu', 5);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (138, 'user', 62, 'menu', 6);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (41, 'user', 41, 'menu', 1);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (42, 'user', 41, 'menu', 2);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (43, 'user', 41, 'menu', 3);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (44, 'user', 41, 'menu', 4);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (45, 'user', 41, 'menu', 5);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (46, 'user', 41, 'menu', 6);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (47, 'user', 41, 'button', 1);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (48, 'user', 41, 'button', 2);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (49, 'user', 41, 'button', 3);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (50, 'user', 41, 'button', 4);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (51, 'user', 41, 'button', 5);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (52, 'user', 41, 'button', 6);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (53, 'user', 41, 'button', 7);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (54, 'user', 41, 'button', 8);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (55, 'user', 41, 'button', 16);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (56, 'user', 41, 'button', 17);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (198, 'user', 102, 'menu', 3);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (116, 'admin', 21, 'button', 14);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (117, 'admin', 21, 'button', 15);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (107, 'admin', 21, 'menu', 7);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (108, 'admin', 21, 'menu', 8);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (109, 'admin', 21, 'button', 9);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (139, 'user', 62, 'button', 1);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (119, 'user', 1, 'menu', 2);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (140, 'user', 62, 'button', 2);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (141, 'user', 62, 'button', 3);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (142, 'user', 62, 'button', 4);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (143, 'user', 62, 'button', 5);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (144, 'user', 62, 'button', 6);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (145, 'user', 62, 'button', 7);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (146, 'user', 62, 'button', 8);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (147, 'user', 62, 'button', 16);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (148, 'user', 62, 'button', 17);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (161, 'user', 81, 'menu', 1);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (162, 'user', 81, 'menu', 2);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (163, 'user', 81, 'menu', 3);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (164, 'user', 81, 'menu', 4);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (165, 'user', 81, 'menu', 5);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (166, 'user', 81, 'menu', 6);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (167, 'user', 81, 'button', 1);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (168, 'user', 81, 'button', 2);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (169, 'user', 81, 'button', 3);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (170, 'user', 81, 'button', 4);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (171, 'user', 81, 'button', 5);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (172, 'user', 81, 'button', 6);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (173, 'user', 81, 'button', 7);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (174, 'user', 81, 'button', 8);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (175, 'user', 81, 'button', 16);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (176, 'user', 81, 'button', 17);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (181, 'admin', 1, 'menu', 7);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (182, 'admin', 1, 'menu', 8);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (183, 'admin', 1, 'button', 9);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (199, 'user', 102, 'menu', 4);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (200, 'user', 102, 'menu', 5);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (201, 'user', 102, 'menu', 6);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (202, 'user', 102, 'button', 1);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (203, 'user', 102, 'button', 2);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (204, 'user', 102, 'button', 3);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (205, 'user', 102, 'button', 4);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (206, 'user', 102, 'button', 5);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (207, 'user', 102, 'button', 6);
commit;
prompt 100 records committed...
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (208, 'user', 102, 'button', 7);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (209, 'user', 102, 'button', 8);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (210, 'user', 102, 'button', 16);
insert into D_PRIVILEGE (privilege_id, role_type, role_id, resource_type, resource_id)
values (211, 'user', 102, 'button', 17);
commit;
prompt 104 records loaded
prompt Loading D_USER_DETAIL...
insert into D_USER_DETAIL (user_id, sex, telephone, mail, sign, pic_path)
values (41, 1, null, null, null, null);
insert into D_USER_DETAIL (user_id, sex, telephone, mail, sign, pic_path)
values (62, 1, null, null, null, null);
insert into D_USER_DETAIL (user_id, sex, telephone, mail, sign, pic_path)
values (81, 1, null, null, null, null);
insert into D_USER_DETAIL (user_id, sex, telephone, mail, sign, pic_path)
values (1, 0, '123456', '123456', '```', null);
insert into D_USER_DETAIL (user_id, sex, telephone, mail, sign, pic_path)
values (21, 0, null, null, null, null);
insert into D_USER_DETAIL (user_id, sex, telephone, mail, sign, pic_path)
values (102, 1, null, null, null, null);
commit;
prompt 6 records loaded
set feedback on
set define on
prompt Done.
