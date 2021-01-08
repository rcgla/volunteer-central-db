\ir dropdb.pgsql

create database :dbname;
\c :dbname;
create schema rcglavc;

create type rcglavc.user_type as enum('CLIENT', 'STAFF', 'ADMIN');
create type rcglavc.meal_type as enum('VEGETARIAN', 'VEGAN', 'OMNIVORE');
create type rcglavc.handed_type as enum('LEFT', 'RIGHT', 'OTHER');

/*
  JWT format

  roles are:
  rcglavc_admin_role (sysadmins)
  rcglavc_staff_role (volunteers)
  rcglavc_client_role (campers)

    and

  rcglavc_app_role
  rcglavc_public_role
*/
create type rcglavc.jwt_token as (
  role text,
  expires integer,
  user_id integer
);


\ir tables.pgsql
\ir functions.pgsql
\ir dbroles.pgsql
\ir policies.pgsql
\ir cascade-dbroles.pgsql
\ir ../add-test-admin.pgsql

insert into rcglavc."DbInfo"("field", "value") values ('version', '01');
