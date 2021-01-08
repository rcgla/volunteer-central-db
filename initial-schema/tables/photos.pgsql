create table rcglavc."Photos" (
    "id" serial primary key,
    "url" text,
    "alt" text,
    "event_id" integer,
    "user_id" integer,
    foreign key ("user_id") references rcglavc."Users"("id"),
    foreign key ("event_id") references rcglavc."Events"("id")
);
