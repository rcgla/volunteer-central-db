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
