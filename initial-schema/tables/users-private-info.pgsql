create table rcglavc."UsersPrivateInfo" (
    "id" serial primary key,
    "phone" text,
    "address" text,
    "bio" text,
    "email" text
);
comment on table rcglavc."UsersPrivateInfo" is 'Access to this table is restricted to admins';

alter table rcglavc."UsersPrivateInfo" enable row level security;