/*
Tables:
    CamperGroups
    Logins (*)
    Participation (*)
    Pickup 
    Roles 
    RoleGroups
    RolesInRoleGroups
    Schedule
    Sessions
    Tuition
    Users (*)
    UserAvailability (*)
    UsersInCamperGroups
    Waivers
    Years
  
  * = RLS
*/

create database :dbname;

\c :dbname;

create schema rcglavc;

create type rcglavc.user_type as enum('USER', 'ADMIN');
create table rcglavc."Logins" (
    "id" serial primary key,
    "email" text not null,
    "password" text not null,
    "last_seen" timestamptz,
    "active" boolean default 't',
    "type" rcglavc.user_type default 'USER'
);
comment on table rcglavc."Logins" is 'User login information';
alter table rcglavc."Logins" enable row level security;

create type rcglavc.meal_type as enum('VEGETARIAN', 'VEGAN', 'OMNIVORE');
create table rcglavc."Users" (
    "id" serial primary key,
    "login_id" integer not null,
    "name" text,
    "address" text,
    "phone" text,
    "allergies" text,
    "tshirt_size" text,
    "meal_pref"	rcglavc.meal_type default 'OMNIVORE',
    "emergency_contact_1" text,
    "emergency_contact_2" text,
    "bio" text,
    "photo_url"	text,									
    foreign key ("login_id") references rcglavc."Logins"("id")
);
comment on table rcglavc."Users" is 'User profile information';
alter table rcglavc."Users" enable row level security;

create type rcglavc.session_type as enum('SUMMERCAMP', 'LADIESROCKCAMP', 'OTHER');
create table rcglavc."Sessions" (
    "id" serial primary key,
    "type" rcglavc.session_type default 'SUMMERCAMP',
    "name" text,
    "start" timestamptz,
    "end" timestamptz
);
comment on table rcglavc."Sessions" is 'Session info and dates';

create table rcglavc."Roles" (
    "id" serial primary key,
    "code" text not null,
    "name" text not null
);
comment on table rcglavc."Roles" is 'Roles at camp and year-round';

create table rcglavc."RoleGroups" (
    "id" serial primary key,
    "code" text not null,
    "name" text not null
);

create table rcglavc."RolesInRoleGroups" (
    "id" serial primary key,
    "role_id" integer not null,
    "role_group_id" integer not null,
    foreign key ("role_id") references rcglavc."Roles"("id"),
    foreign key ("role_group_id") references rcglavc."RoleGroups"("id")
);

create table rcglavc."Participation" (
    "id" serial primary key,
    "user_id" integer not null, 
    "session_id" integer,
    "role_id" integer not null,
    "start" timestamptz,
    "end" timestamptz,
    "confirmed" boolean default 'f',
    "dropped" boolean default 'f',
    foreign key ("user_id") references rcglavc."Users"("id"),
    foreign key ("session_id") references rcglavc."Sessions"("id"),
    foreign key ("role_id") references rcglavc."Roles"("id")
);
comment on table rcglavc."Participation" is 'Users and their roles for sessions (or outside sessions)';

create type rcglavc.track as enum('MVP', 'MUSIC');
create table rcglavc."CamperGroups" (
    "id" serial primary key,
    "name" text not null,
    "session_id" integer not null,
    "track" rcglavc.track default 'MUSIC',
    foreign key ("session_id") references rcglavc."Sessions"("id")
);
comment on table rcglavc."CamperGroups" is 'Bands and crews';

create table rcglavc."UsersInCamperGroups" (
    "id" serial primary key,
    "user_id" integer not null,
    "camper_group_id" integer not null,
    foreign key ("user_id") references rcglavc."Users"("id"),
    foreign key ("camper_group_id") references rcglavc."CamperGroups"("id")
);
comment on table rcglavc."UsersInCamperGroups" is 'Users in bands and crews';

create type rcglavc.schedule_visibility as enum('ALL', 'USER', 'ADMIN');
create table rcglavc."Schedule" (
    "id" serial primary key,
    "name" text not null,
    "desc" text,
    "start" timestamptz not null,
    "end" timestamptz not null,
    "session_id" integer,
    "visibility" rcglavc.schedule_visibility default 'USER',
    foreign key ("session_id") references rcglavc."Sessions"("id")
);
comment on table rcglavc."Schedule" is 'Schedule for camp and special events';

create table rcglavc."Tuition" (
    "id" serial primary key,
    "user_id" integer not null,
    "session_id" integer not null,
    "due_date" timestamptz,
    "amount_owed" numeric not null,
    "amount_paid" numeric default 0,
    "delayed" boolean default 'f',
    foreign key ("user_id") references rcglavc."Users"("id"),
    foreign key ("session_id") references rcglavc."Sessions"("id")
);
comment on table rcglavc."Tuition" is 'Camper tuition status and payment';

create table rcglavc."UserAvailability" (
    "id" serial primary key,
    "user_id" integer not null,
    "start" timestamptz not null,
    "end" timestamptz not null,
    foreign key ("user_id") references rcglavc."Users"("id")
);
comment on table rcglavc."UserAvailability" is 'User schedules';

create table rcglavc."Pickup" (
    "id" serial primary key,
    "user_id" integer not null,
    "trusted_party" text not null,
    "relationship" text,
    "public_transport" boolean default 'f',
    "drives_self" boolean default 'f',
    "rideshare" boolean default 'f',
    "start" timestamptz not null,
    "notes" text,
    foreign key ("user_id") references rcglavc."Users"("id")
);
comment on table rcglavc."Pickup" is 'Camper pickup authorizations';

create type rcglavc.waiver_type as enum ('MEDIA', 'LIABILITY', 'MEDICAL', 'COC', 'FREEDOM_OF_EXPRESSION', 'PICKUP_PERMISSION', 'OTHER');
create table rcglavc."Waivers" (
    "id" serial primary key,
    "user_id" integer not null,
    "type" rcglavc.waiver_type not null,
    "submitted" boolean default 'f',
    "completed" boolean default 'f',
    "date" timestamptz,
    "notes" text,
    foreign key ("user_id") references rcglavc."Users"("id")
);
comment on table rcglavc."Waivers" is 'Camper waiver status';

create table rcglavc."Years" (
    "id" serial primary key,
    "start" timestamptz not null,
    "end" timestamptz not null,
    "name" text not null
);
comment on table rcglavc."Years" is 'Camp is organized into years that are different from calendar years';

/*
  JWT format
*/
create type rcglavc.jwt_token as (
  role text,
  expires integer,
  user_id integer
);

