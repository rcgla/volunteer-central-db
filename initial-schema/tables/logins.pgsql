create table rcglavc."Logins" (
    "id" serial primary key,
    "email" text not null,
    "password" text not null,
    "last_seen" timestamptz,
    "active" boolean default 't'
);
comment on table rcglavc."Logins" is 'User login information';
