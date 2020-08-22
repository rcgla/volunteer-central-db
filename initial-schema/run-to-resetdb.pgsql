\ir dropdb.pgsql

create database :dbname;
\c :dbname;
create schema rcglavc;

create type rcglavc.user_type as enum('CLIENT', 'STAFF', 'ADMIN');
create type rcglavc.meal_type as enum('VEGETARIAN', 'VEGAN', 'OMNIVORE');
create type rcglavc.schedule_visibility as enum('PUBLIC', 'CLIENT', 'STAFF', 'ADMIN');
create type rcglavc.transport_type as enum ('TRUSTED_PARTY', 'PUBLIC_TRANSIT', 'DRIVES_SELF', 'RIDESHARE');
create type rcglavc.waiver_type as enum ('MEDIA', 'LIABILITY', 'MEDICAL', 'COC', 'FREEDOM_OF_EXPRESSION', 'PICKUP_PERMISSION', 'OTHER');
create type rcglavc.application_field_type as enum ('TEXT', 'NUMBER', 'DATETIME', 'BOOLEAN');

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
\ir roles.pgsql
\ir functions/auth.pgsql
-- \ir policies.pgsql
\ir ../add-test-admin.pgsql