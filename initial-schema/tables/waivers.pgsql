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
