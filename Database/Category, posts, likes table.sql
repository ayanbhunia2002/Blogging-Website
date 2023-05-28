use makeBlog;
create table categories(cid int(20) PRIMARY KEY AUTO_INCREMENT not null,
					name varchar(100) not null,
                    description varchar(200));
                    
select * from categories;
select * from posts;
select * from likes;

delete from posts where pid=43;



INSERT INTO categories (name, description) VALUES ('Java Programming', 'Java is a most popular language');
INSERT INTO categories (name, description) VALUES ('Python Programming', 'Python is best for Data Science');
INSERT INTO categories (name, description) VALUES ('Web Technology', 'One of the most trending technology');
INSERT INTO categories (name, description) VALUES ('Misc', 'Post whaterer you want');


delete from posts;