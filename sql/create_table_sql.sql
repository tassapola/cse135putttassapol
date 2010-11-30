create table transcript (
	ID	serial primary key,
	name	text,
	content	bytea
);

create table countries (
	ID	serial primary key,
	name	varchar(255)
);

create table universities (
	ID	serial primary key,
	location varchar(255),
	name	 varchar(255)
);

create table disciplines (
	ID	serial primary key,
	name	varchar(255)
);

create table specializations (
	ID	serial primary key,
	name	varchar(255)
);

create table address (
	ID	serial primary key,
	street_address	varchar(255),
	city	varchar(255),
	zip_code	varchar(5),
	area_code	varchar(10),
	tel_number	varchar(20),
	state		varchar(255),
	country_code	varchar(20)
);

create table applicant (
	ID	serial primary key,
	first_name	varchar(255),
	last_name	varchar(255),
	middle_name	varchar(255),
	citizenship	integer references countries (ID) NOT NULL,
	residence	integer references countries (ID) NOT NULL,
	specialization	integer references specializations (ID) NOT NULL,
	address		integer references address (ID) NOT NULL,
	residency	boolean,
	status	varchar(10)
);

create table degree (
	ID	serial primary key,
	university	integer references universities (ID) NOT NULL,
	discipline	integer references disciplines (ID) NOT NULL,
	degree_title	varchar(255),
	degree_date	date,
	gpa		real,
	transcript	integer references transcript (ID) NOT NULL
);

create table degree_holder (
	ID	serial primary key,
	applicant	integer references applicant (ID) NOT NULL,
	degree	integer references degree (ID) NOT NULL
);

create table users (
	ID	serial primary key,
	user_name   text,
	password    text,
	email	    text
);

create table user_roles (
	ID	serial primary key,
	user_name   text,
	role	text
);

create table review_result (
	ID	serial primary key,
	applicant	integer references applicant (ID) NOT NULL,
	reviewer	integer references user_roles (ID) NOT NULL,
	grade		integer,
	comments	text
);