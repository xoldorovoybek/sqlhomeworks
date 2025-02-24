create table users (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50)NOT NULL,
	last_name VARCHAR(50)NOT NULL,
	email VARCHAR(50),
	gender VARCHAR(50)NOT NULL,
	date_of_birth DATE NOT NULL,
	country VARCHAR(50)NOT NULL
);
insert into users (first_name, last_name, email, gender, date_of_birth, country) values ('Koralle', 'Lowdyane', 'klowdyane0@youku.com', 'Female', '2024-05-26', 'China');
insert into users (first_name, last_name, email, gender, date_of_birth, country) values ('Wrennie', 'Gadeaux', 'wgadeaux1@zimbio.com', 'Female', '2024-06-30', 'Portugal');
insert into users (first_name, last_name, email, gender, date_of_birth, country) values ('Cornelia', 'Davidsson', null, 'Female', '2024-07-05', 'United States');
