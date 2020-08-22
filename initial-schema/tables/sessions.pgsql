create table rcglavc."Sessions" (
    "id" serial primary key,
    "session_type_id" integer not null,
    "name" text,
    "start" timestamptz,
    "end" timestamptz,
    foreign key("session_type_id") references rcglavc."SessionTypes"("id")
);
comment on table rcglavc."Sessions" is 'Session info and dates';

