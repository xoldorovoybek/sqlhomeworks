create database homework_LLC;
create table passengers (
id bigint primary key,
first_name varchar(50),
last_name varchar(50),
date_of_birth date,
country_of_citizenship varchar(50),
country_of_residence varchar(50),
passport_number varchar(20),
created_at timestamp,
updated_at date);

create table no_fly_list (
id bigint primary key,
active_from date, active_to date, no_fly_reason varchar(50),
created_at timestamp, updated_at date,
psgnr_id bigint,
constraint fk_no_fly_list foreign key (psgnr_id)
	references passengers (id));

create table security_check (
id bigint primary key,
check_result varchar(50), comments varchar(6553),
created_at timestamp, updated_at date,
passenger_id bigint,
constraint fk_security_check foreign key (passenger_id)
	references passengers (id));

create table booking (
bookingid bigint primary key, flight_id bigint,
status varchar(50), booking_platform varchar(20),
created_at timestamp, updated_at date,
passenger_id bigint,
constraint fk_booking foreign key (passenger_id)
	references passengers (id));

	create table baggage_check (
	id bigint primary key,
check_result varchar(50), 
created_at bigint, updated_at bigint,
booking_id bigint,	passenger_id bigint,
constraint fk_booking_id foreign key (booking_id)
	references booking (bookingid),
constraint fk_passenger_id foreign key (passenger_id)
	references passengers (id));

	create table baggage (
	id bigint primary key,
	weight_in_kg decimal(4,2), 
	created_at timestamp, updated_at datetime,
	booking_id bigint,
	constraint fk_baggage foreign key (booking_id)
	references booking (bookingid));

	create table boarding_pass (
	id bigint primary key, qr_code varchar(8000), 
	created_at timestamp, updated_at datetime,
	booking_id bigint,
	constraint fk_boarding_pass foreign key (booking_id)
	references booking (bookingid));

	create table airport (
	id bigint primary key,
	airport_name varchar(50),
	country varchar(50), state varchar(50),
	city varchar(50), created_at timestamp, 
	updated_at datetime);

	create table airlane (
	id bigint primary key, airline_code varchar,
	airline_name bigint, airline_country varchar(50),
	created_at timestamp, updated_at datetime);

	create table flights (
	flight_id bigint primary key,
	departing_gate varchar(20), arriving_gate varchar(20),
	created_at timestamp, updated_at datetime,
	airlane_id bigint,
	constraint fk_airlane_id foreign key (airlane_id)
	references airlane (id),
	departing_airport_id bigint,
	constraint fk_departing_airport_id foreign key (departing_airport_id)
	references airport (id),
	arriving_airport_id bigint,
	constraint fk_arriving_airport_id foreign key (arriving_airport_id)
	references airport (id));

	create table flight_manifest (
	id bigint primary key,
	created_at timestamp, updated_at datetime,
	booking_id bigint,
	constraint fk_bookingS_id foreign key (booking_id)
	references booking (bookingid),
	flight_id bigint,
	constraint fk_flight_id foreign key (flight_id)
	references flightS (flight_id));

 




