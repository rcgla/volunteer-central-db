create table rcglavc."ScheduleEntries" (
    "id" serial primary key,
    "name" text not null,
    "desc" text,
    "start" timestamptz not null,
    "end" timestamptz not null,
    "session_id" integer,
    "room_id" integer,
    "visibility" rcglavc.schedule_visibility default 'STAFF',
    foreign key ("session_id") references rcglavc."Sessions"("id")
);
comment on table rcglavc."ScheduleEntries" is 'Schedule for camp and special events';
