﻿create table countries (
	ID	serial primary key,
	name	text
);

create table universities (
	ID	serial primary key,
	location text,
	name	 text
);

create table disciplines (
	ID	serial primary key,
	name	text
);

create table specializations (
	ID	serial primary key,
	name	text
);

create table address (
	ID	serial primary key,
	street_address	text,
	city	text,
	zip_code	text,
	area_code	text,
	tel_number	text,
	state		text,
	country_code	text
);

create table applicant (
	ID	serial primary key,
	first_name	text,
	last_name	text,
	middle_name	text,
	citizenship	integer references countries (ID) NOT NULL,
	residency	integer references countries (ID) NOT NULL,
	specialization	integer references specializations (ID) NOT NULL,
	address		integer references address (ID) NOT NULL
);

create table degree (
	ID	serial primary key,
	university	integer references universities (ID) NOT NULL,
	discipline	integer references disciplines (ID) NOT NULL,
	degree_title	text,
	degree_date	date,
	gpa		real,
	transcript	text
);

create table degree_holder (
	ID	serial primary key,
	applicant	integer references applicant (ID) NOT NULL,
	degree	integer references degree (ID) NOT NULL
);

