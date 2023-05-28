create database makeBlog;
use makeBlog;
create table user(id int(20) PRIMARY KEY AUTO_INCREMENT not null,
					name varchar(30) not null,
                    email varchar(40) not null, 
                    password varchar(20) not null,
                    gender varchar(10) not null,
                    rdate timestamp not null,
                    UNIQUE (email));
                    
ALTER TABLE user ADD profile varchar(100) DEFAULT 'default.png';
select * from user;
drop table user;
