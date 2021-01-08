create table rcglavc."Logins" (
    "id" serial primary key,
    "username" text not null,
    "password" text not null,
    "last_seen" timestamptz,
    "active" boolean default 't'
);
alter table rcglavc."Logins" enable row level security;

comment on table rcglavc."Logins" is 'User login information';
