create database bbs1;

use bbs1;

CREATE TABLE users (
  id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(20)NOT NULL,
  password varchar(50)NOT NULL,
  sex varchar(2) not null,
  headImage varchar(100) not null,
  crtTime datetime,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

#��������
create table board(
	id int(11) NOT NULL AUTO_INCREMENT,
	name varchar(20) not null,
	pid int(11) not null,
	primary key(id)
	)engine=InnoDB default charset=utf8;




#��board���в�������
insert into board(name,pid)values(".net����",0);
insert into board(name,pid)values("java����",0);
insert into board(name,pid)values("���ݿ⼼��",0);
insert into board(name,pid)values("����",0);

insert into board(name,pid)values("c#����",1);
insert into board(name,pid)values("WinForms����",1);
insert into board(name,pid)values("ADO.NET",1);
insert into board(name,pid)values("ASP.NET.1",1);

insert into board(name,pid)values("java����",2);
insert into board(name,pid)values("jsp����",2);
insert into board(name,pid)values("servlet����",2);
insert into board(name,pid)values("eclipseӦ��",2);

insert into board(name,pid)values("sql server����",3);
insert into board(name,pid)values("sql server�߼�",3);

insert into board(name,pid)values("��ˮ��԰",4);



#���ӱ�
create table topic(
	id int(11) not null auto_increment,
	title varchar(100)not null,
	body text not null,
	uid int(11)not null,
	bid int(11)not null,
	creTime datetime not null,
	upTime datetime not null,
	replyCount int(11) default 0,
	primary key (id)
	)ENGINE=InnoDB  DEFAULT CHARSET=utf8;

	
	#�ظ����ӱ�
create table reply(
	id int(11) not null auto_increment,
	title varchar(100)not null,
	body text not null,
	uid int(11)not null,
	tid int(11)not null,
	creTime datetime not null,
	upTime datetime not null,	
	primary key (id)
	)ENGINE=InnoDB  DEFAULT CHARSET=utf8;
	

