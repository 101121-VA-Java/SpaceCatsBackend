drop table if exists art;
drop table if exists users;
drop table if exists roles;
drop table if exists bids;

create table if not exists roles(
	id serial primary key not null,
	role varchar(20) not null
);

create table if not exists users(
	id serial primary key not null,
	fname varchar(100),
	lname varchar(100),
	uname varchar(100) unique not null,
	pw varchar(100) not null,
	roleid integer references roles(id)
);

create table if not exists art(
	id serial primary key not null,
	url varchar(200),
	artist varchar(100),
	name varchar(500),
	ownerid integer references users(id)
);

create table if not exists bids(
	id serial primary key not null,
	amount integer,
	bidderid integer references users(id),
	artid integer references art(id)
);

insert into public.roles 
(role)
VALUES('AUCTIONEER');

insert into public.roles 
(role)
VALUES('CLIENT');

INSERT INTO public.users
(fname, lname, uname, pw, roleid)
VALUES('auctioneer', 'auctioneer', '1', '1', 1);

INSERT INTO public.users
(fname, lname, uname, pw, roleid)
VALUES('client', 'client', '2', '2', 2);