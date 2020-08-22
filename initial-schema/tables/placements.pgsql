create table rcglavc."Placements" (
    "id" serial primary key,
    "user_id" integer not null, 
    "session_id" integer,
    "role_id" integer not null,
    "confirmed" boolean default 'f',
    "dropped" boolean default 'f',
    foreign key ("user_id") references rcglavc."Users"("id"),
    foreign key ("session_id") references rcglavc."Sessions"("id"),
    foreign key ("role_id") references rcglavc."Roles"("id")
);
comment on table rcglavc."Placements" is 'Users and their roles for sessions (or outside sessions)';
