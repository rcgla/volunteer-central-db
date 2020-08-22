create table rcglavc."UserAvailability" (
    "id" serial primary key,
    "user_id" integer not null,
    "start" timestamptz not null,
    "end" timestamptz not null,
    foreign key ("user_id") references rcglavc."Users"("id")
);
comment on table rcglavc."UserAvailability" is 'User schedules';
