create table "JoinRoomsAndScheduleEntries" (
    "id" serial primary key,
    "schedule_entry_id" integer not null,
    "room_id" integer not null,
    foreign key ("room_id") references rcglavc."Rooms"("id"),
    foreign key ("schedule_entry_id") references rcglavc."ScheduleEntries"("id")
);