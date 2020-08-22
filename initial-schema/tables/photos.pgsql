create table rcglavc."Photos" (
    "id" serial primary key,
    "url" text,
    "alt" text,
    "session_id" integer,
    "user_id" integer,
    foreign key ("user_id") references rcglavc."Users"("id"),
    foreign key ("session_id") references rcglavc."Sessions"("id")
);
